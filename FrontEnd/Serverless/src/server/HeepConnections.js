import net from 'net'
import os from 'os' 
import * as HAPIParser from './HAPIMemoryParser'
import * as iconUtils from '../utilities/iconUtilities'
import * as generalUtils from '../utilities/generalUtilities'
import * as byteUtils from '../utilities/byteUtilities'

var masterState = {
  clients: {clientArray: []},
  positions: {},
  controls: {controlStructure:{}, connections: {}},
  vertexList: {},
  icons: {},
  url: ''
};

var heepPort = 5000;
var searchComplete = false;
var mostRecentSearch = {};

export var SearchForHeepDevices = () => {
  var gateway = findGateway();
  var searchBuffer = Buffer.from([0x09, 0x00])

  for (var i = 1; i <= 255; i++){
    var address = generalUtils.joinAddress(gateway,i)

    ConnectToHeepDevice(address, heepPort, searchBuffer);
  }
}

export var GetCurrentMasterState = () => {
  return masterState
}

export var ResetMasterState = () => {
  masterState = {
    clients: {clientArray: []},
    positions: {},
    controls: {controlStructure:{}},
    vertexList: {},
    icons: {},
    url: ''
  };

  return masterState
}

export var SendPositionToHeepDevice = (clientID, position) => {

  SetClientPositionFromBrowser(clientID, position);

  var IPAddress = masterState.clients[clientID].IPAddress;
  var xPosition = byteUtils.GetValueAsFixedSizeByteArray(position.left, 2);
  var yPosition = byteUtils.GetValueAsFixedSizeByteArray(position.top, 2);
  var packet = xPosition.concat(yPosition);
  var numBytes = [packet.length];

  var messageBuffer = Buffer.from([0x0B].concat(numBytes, packet));
  console.log('Connecting to Device ', clientID + ' at IPAddress: ' + IPAddress);
  console.log('Data packet: ', messageBuffer);
  ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)

}

export var SendValueToHeepDevice = (clientID, controlID, newValue) => {
  if (CheckIfNewValueAndSet(clientID, controlID, newValue)){
    var IPAddress = masterState.clients[clientID].IPAddress;
    var controlByteArray = byteUtils.GetByteArrayFromValue(controlID);
    var valueByteArray = byteUtils.GetByteArrayFromValue(newValue);
    var numBytes = [controlByteArray.length + valueByteArray.length];
    var messageBuffer = Buffer.from([0x0A].concat(numBytes, controlByteArray, valueByteArray));
    console.log('Connecting to Device ', clientID + ' at IPAddress: ' + IPAddress);
    console.log('Data Packet: ',  messageBuffer);
    ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)
  }
}

export var SendVertexToHeepDevices = (vertex) => {
  console.log('Received the following vertex to send to HeepDevice: ', vertex)

  var IPAddress = masterState.clients[vertex.txClientID].IPAddress;
  AddVertex(vertex);
  var messageBuffer = PrepVertexForCOP(vertex, 0x0C);

  console.log('Connecting to Device ', vertex.txClientID + ' at IPAddress: ' + IPAddress);
  console.log('Data Packet: ',  messageBuffer);

  ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)
}

export var SendDeleteVertexToHeepDevices = (vertex) => {
  console.log('Received the following vertex to delete from HeepDevice: ', vertex)

  var IPAddress = masterState.clients[vertex.txClientID].IPAddress;
  var messageBuffer = PrepVertexForCOP(vertex, 0x0D);
  DeleteVertex(vertex);

  console.log('Connecting to Device ', vertex.txClientID + ' at IPAddress: ' + IPAddress);
  console.log('Data Packet: ',  messageBuffer);

  ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)
}

export var PrepVertexForCOP = (vertex, COP) => {
  var txClientID = byteUtils.GetClientIDAsByteArray(vertex.txClientID);
  var txControlID = byteUtils.GetValueAsFixedSizeByteArray(vertex.txControlID, 1);
  var rxClientID = byteUtils.GetClientIDAsByteArray(vertex.rxClientID);
  var rxControlID = byteUtils.GetValueAsFixedSizeByteArray(vertex.rxControlID, 1);
  var rxIP = byteUtils.ConvertIPAddressToByteArray(vertex.rxIP);
  var packet = txClientID.concat(rxClientID, txControlID, rxControlID, rxIP);
  var numBytes = [packet.length];

  return Buffer.from([COP].concat(numBytes, packet));
}

var CheckIfNewValueAndSet = (clientID, controlID, newValue) => {
  var thisControl = generalUtils.nameControl(clientID, controlID);
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
      if (networkInterfaces[interfaces][i].netmask == '255.255.255.0'){
        var activeAddress = networkInterfaces[interfaces][i].address;
        var address = activeAddress.split('.');
        var myIp = address.pop();
        console.log('Searching on gateway: ', address);
        return address
      }
    }
  }
}

var ConnectToHeepDevice = (IPAddress, port, message) => {

  var sock = new net.Socket();
  sock.connect({host: IPAddress, port: port}, () => {
    sock.write(message);
  });

  sock.on('data', (data) => {
    ConsumeHeepResponse(data, IPAddress, port);

    sock.end();
  });

  sock.on('end', () => {});

  sock.on('error', () => {
    mostRecentSearch[IPAddress] = false;
  });
}

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
  console.log(heepChunks)
  for (var i = 0; i < heepChunks.length; i++) {
    if (heepChunks[i].op == 1){
      AddClient(heepChunks[i], IPAddress);

    } else if (heepChunks[i].op == 2){
      AddControl(heepChunks[i]);

    } else if (heepChunks[i].op == 3){
      AddVertex(heepChunks[i].vertex)
      
    } else if (heepChunks[i].op == 4){
      SetIconFromID(heepChunks[i]);

    } else if (heepChunks[i].op == 5){
      SetCustomIcon(heepChunks[i]);
      
    } else if (heepChunks[i].op == 6){
      SetClientName(heepChunks[i])

    } else if (heepChunks[i].op == 7){
      SetClientPosition(heepChunks[i])
      
    } else if (heepChunks[i].op == 8){
      
    }
  }
}

var AddClient = (heepChunk, IPAddress) => {
  var clientID = heepChunk.clientID;
  var clientName = 'unset';
  var iconName = 'none';
  iconUtils.SetClientIconFromString(clientID, clientName, iconName);

  masterState.clients[clientID] = {
    ClientID: clientID,
    IPAddress: IPAddress,
    ClientName: clientName
  }

  if( masterState.clients.clientArray.indexOf(clientID) == -1){
    masterState.clients.clientArray.push(clientID);
  }

  SetNullPosition(clientID);
  masterState.controls.controlStructure[clientID] = {inputs: [], outputs: []};
  masterState.icons = iconUtils.GetIconContent();
}

var SetClientName = (heepChunk) => {
  masterState.clients[heepChunk.clientID].ClientName = heepChunk.clientName;
  if ((heepChunk.clientID in masterState.icons)){
    var currentIcon = masterState.icons[heepChunk.clientID];
  } 
  else {
    var currentIcon = 'none';
  }
  iconUtils.SetClientIconFromString(heepChunk.clientID, heepChunk.clientName, currentIcon);
  masterState.icons = iconUtils.GetIconContent()
}

var AddControl = (heepChunk) => {
  // Transition this to use new ControlID throughout frontend 
  var tempCtrlName = generalUtils.nameControl(heepChunk.clientID, heepChunk.control.ControlID) 
  masterState.controls[tempCtrlName] = heepChunk.control;
  masterState.controls[tempCtrlName].clientID = heepChunk.clientID;
  var currentIndex = SetControlStructure(heepChunk.clientID, tempCtrlName)

  masterState.positions[heepChunk.clientID][tempCtrlName] = SetControlPosition(heepChunk.clientID, currentIndex, heepChunk.control.ControlDirection);
  masterState.controls.connections[tempCtrlName] = [];
}

var SetIconFromID = (heepChunk) => {
  var clientName = masterState.clients[heepChunk.clientID].ClientName;
  iconUtils.SetClientIconFromString(heepChunk.clientID, clientName, heepChunk.iconName);
  masterState.icons = iconUtils.GetIconContent()
}

var SetCustomIcon = (heepChunk) => {
  iconUtils.setCustomIcon(heepChunk.clientID, heepChunk.iconData);
}

var SetNullPosition = (clientID) => {
  
  var newPosition = {
    client: {top: 0, left: 0}
  }

  masterState.positions[clientID] = newPosition;
}

var SetClientPosition = (heepChunk) => {
  masterState.positions[heepChunk.clientID].client = heepChunk.position;
  RecalculateControlPositions(heepChunk.clientID);
}

var SetClientPositionFromBrowser = (clientID, position) => {
  var newPosition = {
    top: parseInt(position.top),
    left: parseInt(position.left)
  }

  masterState.positions[clientID].client = newPosition;
  RecalculateControlPositions(clientID);
}

var RecalculateControlPositions = (clientID) => {
  var startingPositions = masterState.positions[clientID];
  for (var controlName in startingPositions){
    if (controlName == 'client'){ 
      continue 
    }

    UpdateControlPosition(clientID, controlName);
  }
}

var UpdateControlPosition = (clientID, controlName) => {
  var clientPosition = masterState.positions[clientID].client;
  var thisPosition = masterState.positions[clientID][controlName];
  var direction = masterState.controls[controlName].ControlDirection;

  thisPosition.top = clientPosition['top'] + 45 + 1.5 + 25/2 + 55*(thisPosition.index - 1), 
  thisPosition.left = direction == 0 ? clientPosition['left'] + 10 : clientPosition['left'] + 250;
  
}

var SetControlPosition = (clientID, index, direction) => {
  var clientPosition = masterState.positions[clientID]['client'];

  var position = {
    top: clientPosition['top'] + 45 + 1.5 + 25/2 + 55*(index - 1), 
    left: direction == 0 ? clientPosition['left'] + 10 : clientPosition['left'] + 250,
    index: index
  }
  
  return position;
}

var SetControlStructure = (clientID, controlID) => {

  if ( masterState.controls[controlID]['ControlDirection'] == 0){
    var inputs = masterState.controls.controlStructure[clientID].inputs;
    inputs.push(controlID);
    return inputs.length

  } else {
    var outputs = masterState.controls.controlStructure[clientID].outputs;
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


