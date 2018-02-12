import os from 'os' 
import * as HAPIParser from './HAPIMemoryParser'
import * as iconUtils from '../utilities/iconUtilities'
import * as generalUtils from '../utilities/generalUtilities'
import * as byteUtils from '../utilities/byteUtilities'
const dgram = require('dgram');
var log = require('electron-log');

const udpServer = dgram.createSocket('udp4');

var newMasterState = {
  devices: {deviceArray: []},
  positions: {},
  controls: {controlStructure:{}, connections: {}},
  vertexList: {},
  icons: {},
  url: ''
};

var masterState = newMasterState;

var heepPort = 5000;
var searchComplete = false;
var mostRecentSearch = {};

export var SearchForHeepDevices = () => {
  var gateway = findGateway();
  var searchBuffer = Buffer.from([0x09, 0x00])

  var client = dgram.createSocket("udp4");
  client.bind(function(err, bytes){
      console.log("Set Broadcast");
      client.setBroadcast(true);
      var address = generalUtils.joinAddress(gateway,255)
      client.send(searchBuffer, 5000, address, function(err, bytes) {
          console.log("Broadcast sent");
          client.close();
      });
    });
}

export var GetCurrentMasterState = () => {
  return masterState
}

export var ResetMasterState = () => {
  masterState = newMasterState;

  return masterState
}

export var SendPositionToHeepDevice = (deviceID, position) => {

  SetDevicePositionFromBrowser(deviceID, position);

  var IPAddress = masterState.devices[deviceID].ipAddress;
  var xPosition = byteUtils.GetValueAsFixedSizeByteArray(position.left, 2);
  var yPosition = byteUtils.GetValueAsFixedSizeByteArray(position.top, 2);
  var packet = xPosition.concat(yPosition);
  var numBytes = [packet.length];

  var messageBuffer = Buffer.from([0x0B].concat(numBytes, packet));
  console.log('Connecting to Device ', deviceID + ' at IPAddress: ' + IPAddress);
  console.log('Data packet: ', messageBuffer);
  ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)

}

export var SendValueToHeepDevice = (deviceID, controlID, newValue) => {
  if (CheckIfNewValueAndSet(deviceID, controlID, newValue)){
    var IPAddress = masterState.devices[deviceID].ipAddress;
    var controlByteArray = byteUtils.GetByteArrayFromValue(controlID);
    var valueByteArray = byteUtils.GetByteArrayFromValue(newValue);
    var numBytes = [controlByteArray.length + valueByteArray.length];
    var messageBuffer = Buffer.from([0x0A].concat(numBytes, controlByteArray, valueByteArray));
    console.log('Connecting to Device ', deviceID + ' at IPAddress: ' + IPAddress);
    console.log('Data Packet: ',  messageBuffer);
    ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)
  }
}

export var SendVertexToHeepDevices = (vertex) => {
  console.log('Received the following vertex to send to HeepDevice: ', vertex)

  var IPAddress = masterState.devices[vertex.txDeviceID].ipAddress;
  AddVertex(vertex);
  var messageBuffer = PrepVertexForCOP(vertex, 0x0C);

  console.log('Connecting to Device ', vertex.txDeviceID + ' at IPAddress: ' + IPAddress);
  console.log('Data Packet: ',  messageBuffer);

  ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)
}

export var SendDeleteVertexToHeepDevices = (vertex) => {
  console.log('Received the following vertex to delete from HeepDevice: ', vertex)

  var IPAddress = masterState.devices[vertex.txDeviceID].ipAddress;
  var messageBuffer = PrepVertexForCOP(vertex, 0x0D);
  DeleteVertex(vertex);

  console.log('Connecting to Device ', vertex.txDeviceID + ' at IPAddress: ' + IPAddress);
  console.log('Data Packet: ',  messageBuffer);

  ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)
}

export var PrepVertexForCOP = (vertex, COP) => {
  var txDeviceID = byteUtils.GetDeviceIDAsByteArray(vertex.txDeviceID);
  var txControlID = byteUtils.GetValueAsFixedSizeByteArray(vertex.txControlID, 1);
  var rxDeviceID = byteUtils.GetDeviceIDAsByteArray(vertex.rxDeviceID);
  var rxControlID = byteUtils.GetValueAsFixedSizeByteArray(vertex.rxControlID, 1);
  var rxIP = byteUtils.ConvertIPAddressToByteArray(vertex.rxIP);
  var packet = txDeviceID.concat(rxDeviceID, txControlID, rxControlID, rxIP);
  var numBytes = [packet.length];

  return Buffer.from([COP].concat(numBytes, packet));
}

var CheckIfNewValueAndSet = (deviceID, controlID, newValue) => {
  var thisControl = generalUtils.nameControl(deviceID, controlID);
  if (masterState.controls[thisControl].CurCtrlValue == newValue){
    return false
  } else {
    masterState.controls[thisControl].CurCtrlValue = newValue;
    return true
  }
}

export var findGateway = () => {
  var networkInterfaces = os.networkInterfaces( );

  for (var interfaces in networkInterfaces) {
    for (var i = 0; i < networkInterfaces[interfaces].length; i++ ) {
      // console.log(networkInterfaces[interfaces][i])
      if (networkInterfaces[interfaces][i].netmask == '255.255.255.0' ){
        var activeAddress = networkInterfaces[interfaces][i].address;
        var address = activeAddress.split('.');
        var myIp = address.pop();
        
        console.log('Searching on gateway: ', address);
        
        return address
      }
    }
  }
  
  console.log('Searching on gateway: ', address);
  return address
}

var ConnectToHeepDevice = (IPAddress, port, message) => {

  console.log(message);

  var client = dgram.createSocket('udp4');
  console.log("About to Send " + IPAddress);
  client.send(message, heepPort, IPAddress, (err) => {
    client.close();
  });
}

udpServer.on('error', (err) => {
  console.log(`server error:\n${err.stack}`);
  udpServer.close();
});

udpServer.on('message', (msg, rinfo) => {
  ConsumeHeepResponse(msg, rinfo.address, rinfo.port);
  console.log(`server got: ${msg} from ${rinfo.address}:${rinfo.port}`);
});

udpServer.on('listening', () => {
  const address = udpServer.address();
  console.log(`server listening ${address.address}:${address.port}`);
});

console.log("About to bind");
udpServer.bind(heepPort);
console.log("Done binding");




var ConsumeHeepResponse = (data, IPAddress, port) => {
  console.log('Device found at address: ', IPAddress + ':' + port.toString());
  console.log('Stringified Data: ', data.toString());
  console.log('Raw inbound Data: ', data);

  mostRecentSearch[IPAddress] = true;
  var HeepResponse = HAPIParser.ReadHeepResponse(data);

  if (HeepResponse != false){
    if (HeepResponse.op == 0x0F) {
      //Memory Dump
      AddMemoryChunksToMasterState(HeepResponse.memory, IPAddress);

    } else if ( HeepResponse.op == 0x10) {
      //Success
      console.log('Heep Device SUCCESS with a HAPI message: ', HeepResponse.message);

    } else if (HeepResponse.op == 0x11){
      //Error 
      console.log('Heep Device ERROR with an unHAPI message: ', HeepResponse.message);
    } else {
      console.error('Did not receive a known Response Code from Heep Device');
    }
  } else {
    console.error('Heep Response Invalid');
  }
}

var AddMemoryChunksToMasterState = (heepChunks, IPAddress) => {
  console.log(heepChunks);  

  for (var i = 0; i < heepChunks.length; i++) {

    try {
      if (heepChunks[i].op == 1){
        AddDevice(heepChunks[i], IPAddress);

      } else if (heepChunks[i].op == 2){
        AddControl(heepChunks[i]);

      } else if (heepChunks[i].op == 3){
        AddVertex(heepChunks[i].vertex)
        
      } else if (heepChunks[i].op == 4){
        SetIconFromID(heepChunks[i]);

      } else if (heepChunks[i].op == 5){
        SetCustomIcon(heepChunks[i]);
        
      } else if (heepChunks[i].op == 6){

        SetDeviceName(heepChunks[i])

      } else if (heepChunks[i].op == 7){

        SetDevicePosition(heepChunks[i])
        
      } else if (heepChunks[i].op == 8){
        
      }
    } catch (err) {
      console.log(err.toString());
    }
    
  }
}

var AddDevice = (heepChunk, IPAddress) => {
  var deviceID = heepChunk.deviceID;
  var deviceName = 'unset';
  var iconName = 'none';
  //iconUtils.SetDeviceIconFromString(deviceID, deviceName, iconName);

  masterState.devices[deviceID] = {
    deviceID: deviceID,
    ipAddress: IPAddress,
    name: deviceName,
    active: false,
    iconName: "light_on",
    version: 0
  }

  if( masterState.devices.deviceArray.indexOf(deviceID) == -1){
    masterState.devices.deviceArray.push(deviceID);
  }

  SetNullPosition(deviceID);
  masterState.controls.controlStructure[deviceID] = {inputs: [], outputs: []};
  masterState.icons = iconUtils.GetIconContent();
}

var SetDeviceName = (heepChunk) => {
  masterState.devices[heepChunk.deviceID].name = heepChunk.deviceName;
  if ((heepChunk.deviceID in masterState.icons)){
    var currentIcon = masterState.icons[heepChunk.deviceID];
  } 
  else {
    var currentIcon = 'none';
  }
  iconUtils.SetDeviceIconFromString(heepChunk.deviceID, heepChunk.deviceName, currentIcon);
  masterState.icons = iconUtils.GetIconContent()
}

var AddControl = (heepChunk) => {
  // Transition this to use new ControlID throughout frontend 
  var tempCtrlName = generalUtils.nameControl(heepChunk.deviceID, heepChunk.control.controlID) 
  masterState.controls[tempCtrlName] = heepChunk.control;
  masterState.controls[tempCtrlName].deviceID = heepChunk.deviceID;
  var currentIndex = SetControlStructure(heepChunk.deviceID, tempCtrlName)

  masterState.positions[heepChunk.deviceID][tempCtrlName] = SetControlPosition(heepChunk.deviceID, currentIndex, heepChunk.control.controlDirection);
  masterState.controls.connections[tempCtrlName] = [];
}

var SetIconFromID = (heepChunk) => {
  var deviceName = masterState.devices[heepChunk.deviceID].deviceName;
  iconUtils.SetDeviceIconFromString(heepChunk.deviceID, deviceName, heepChunk.iconName);
  masterState.icons = iconUtils.GetIconContent()
}

var SetCustomIcon = (heepChunk) => {
  iconUtils.setCustomIcon(heepChunk.deviceID, heepChunk.iconData);
}

var SetNullPosition = (deviceID) => {
  
  var newPosition = {
    device: {top: 0, left: 0}
  }

  masterState.positions[deviceID] = newPosition;
}

var SetDevicePosition = (heepChunk) => {
  masterState.positions[heepChunk.deviceID].device = heepChunk.position;
  RecalculateControlPositions(heepChunk.deviceID);
}

var SetDevicePositionFromBrowser = (deviceID, position) => {
  var newPosition = {
    top: parseInt(position.top),
    left: parseInt(position.left)
  }

  masterState.positions[deviceID].device = newPosition;
  RecalculateControlPositions(deviceID);
}

var SetControlStructure = (deviceID, controlID) => {

  if ( masterState.controls[controlID]['controlDirection'] == 0){
    var inputs = masterState.controls.controlStructure[deviceID].inputs;
    inputs.push(controlID);
    return inputs.length

  } else {
    var outputs = masterState.controls.controlStructure[deviceID].outputs;
    outputs.push(controlID);
    return outputs.length

  }

}

var AddVertex = (vertex) => {
  var vertexName = generalUtils.nameVertex(vertex);
  var txControl = generalUtils.getTxControlNameFromVertex(vertex);
  var rxControl = generalUtils.getRxControlNameFromVertex(vertex);
  masterState.vertexList[vertexName] = vertex;
  masterState.controls.connections[txControl].push(rxControl);

}

var DeleteVertex = (vertex) => {
  delete masterState.vertexList[generalUtils.nameVertex(vertex)];

  var txControl = generalUtils.getTxControlNameFromVertex(vertex);
  var rxControl = generalUtils.getRxControlNameFromVertex(vertex);
  var index = masterState.controls.connections[txControl].indexOf(rxControl)
  if ( index != -1) {
    masterState.controls.connections[txControl].splice(index, 1);
  }

}

var RecalculateControlPositions = (deviceID) => {
  var startingPositions = masterState.positions[deviceID];
  for (var controlName in startingPositions){
    if (controlName == 'device'){ 
      continue 
    }

    UpdateControlPosition(deviceID, controlName);
  }
}

var UpdateControlPosition = (deviceID, controlName) => {
  var devicePosition = masterState.positions[deviceID].device;
  var thisPosition = masterState.positions[deviceID][controlName];
  var direction = masterState.controls[controlName].controlDirection;

  thisPosition.top = devicePosition['top'] + 45 + 1.5 + 25/2 + 55*(thisPosition.index - 1), 
  thisPosition.left = direction == 0 ? devicePosition['left'] + 10 : devicePosition['left'] + 240;
  
}

var SetControlPosition = (deviceID, index, direction) => {
  var devicePosition = masterState.positions[deviceID]['device'];

  var position = {
    top: devicePosition['top'] + 45 + 1.5 + 25/2 + 55*(index - 1), 
    left: direction == 0 ? devicePosition['left'] + 10 : devicePosition['left'] + 240,
    index: index
  }
  
  return position;
}

