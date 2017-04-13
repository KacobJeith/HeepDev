import net from 'net'
import os from 'os' 
import * as heepParser from './HeepMemoryParser'
import * as heepIconUtils from './HeepIconUtils'

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
    var address = joinAddress(gateway,i)

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
  var xPosition = GetValueAsFixedSizeByteArray(position.left, 2);
  var yPosition = GetValueAsFixedSizeByteArray(position.top, 2);
  var packet = xPosition.concat(yPosition);
  var numBytes = [packet.length];

  var messageBuffer = Buffer.from([0x0B].concat(numBytes, packet));
  console.log('Sending COP 0x0B to Heep Device' + clientID.toString() + ' at IP: ' + IPAddress);
  console.log('Data: ', messageBuffer);
  ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)

}

export var SendValueToHeepDevice = (clientID, controlID, newValue) => {
  if (CheckIfNewValueAndSet(clientID, controlID, newValue)){
    var IPAddress = masterState.clients[clientID].IPAddress;
    var controlByteArray = GetByteArrayFromValue(controlID);
    var valueByteArray = GetByteArrayFromValue(newValue);
    var numBytes = [controlByteArray.length + valueByteArray.length];
    var messageBuffer = Buffer.from([0x0A].concat(numBytes, controlByteArray, valueByteArray));
    console.log('SENDING SETVAL TO HEEP CLIENT ', clientID + ' at ' + IPAddress);
    console.log('Data Packet: ',  messageBuffer);
    ConnectToHeepDevice(IPAddress, heepPort, messageBuffer)
  }
}

var CheckIfNewValueAndSet = (clientID, controlID, newValue) => {
  var thisControl = nameControl(clientID, controlID);
  if (masterState.controls[thisControl].CurCtrlValue == newValue){
    return false
  } else {
    masterState.controls[thisControl].CurCtrlValue = newValue;
    return true
  }
}

export var GetClientIDasByteArray = (value) => {
  var clientID = GetValueAsFixedSizeByteArray(value, 4);
  return clientID
}

export var GetValueAsFixedSizeByteArray = (value, size) => {
  var valueBytes = GetByteArrayFromValue(value);
  var backfill = size - valueBytes.length;
  for (var i = 0; i < backfill; i++){
    valueBytes.unshift(0x00);
  }
  
  return valueBytes
}

export var GetByteArrayFromValue = (value) => {
  var byteArray = [];
  var numBytes = GetNecessaryBytes(value);

  for (var i = 0; i < numBytes; i++){ 
    var hexVal = value % 256;
    byteArray.unshift(hexVal);
    value = value >> 8;
  }

  return byteArray
}

export var GetNecessaryBytes = (value) => {
  var numBytes = 1;
  value = value >> 8;

  while (value > 0) {
    numBytes += 1;
    value = value >> 8;
  }

  return numBytes
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

var joinAddress = (gateway, ip) => {
  return gateway.join('.') + '.' + ip.toString()
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
  var HeepResponse = heepParser.ReadHeepResponse(data);

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
      AddVertex(heepChunks[i])
      
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
  heepIconUtils.SetClientIconFromString(clientID, clientName, iconName);

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
  masterState.icons = heepIconUtils.GetIconContent();
}

var SetClientName = (heepChunk) => {
  masterState.clients[heepChunk.clientID].ClientName = heepChunk.clientName;
  if ((heepChunk.clientID in masterState.icons)){
    var currentIcon = masterState.icons[heepChunk.clientID];
  } 
  else {
    var currentIcon = 'none';
  }
  heepIconUtils.SetClientIconFromString(heepChunk.clientID, heepChunk.clientName, currentIcon);
  masterState.icons = heepIconUtils.GetIconContent()
}

var AddControl = (heepChunk) => {
  // Transition this to use new ControlID throughout frontend 
  var tempCtrlName = nameControl(heepChunk.clientID, heepChunk.control.ControlID) 
  masterState.controls[tempCtrlName] = heepChunk.control;
  masterState.controls[tempCtrlName].connectedControls = [];
  var currentIndex = SetControlStructure(heepChunk.clientID, tempCtrlName)

  masterState.positions[heepChunk.clientID][tempCtrlName] = SetControlPosition(heepChunk.clientID, currentIndex, heepChunk.control.ControlDirection);

}

var SetIconFromID = (heepChunk) => {
  var clientName = masterState.clients[heepChunk.clientID].ClientName;
  heepIconUtils.SetClientIconFromString(heepChunk.clientID, clientName, heepChunk.iconName);
  masterState.icons = heepIconUtils.GetIconContent()
}

var SetCustomIcon = (heepChunk) => {
  heepIconUtils.setCustomIcon(heepChunk.clientID, heepChunk.iconData);
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

var nameVertex = (vertex) => {
    return vertex['txClientID'] + '.' + vertex['txControlID'] + '->' + vertex['rxClientID'] + '.' + vertex['rxControlID'];
}

var nameControl = (clientID, controlName) => {
  return clientID +  '.' + controlName;
}

var getTxControlNameFromVertex = (vertex) => {
  return nameControl(vertex.txClientID, vertex.txControlID)
}

var getRxControlNameFromVertex = (vertex) => {
  return nameControl(vertex.rxClientID, vertex.rxControlID)
}

var AddVertex = (heepChunk) => {
  var vertexName = nameVertex(heepChunk.vertex);
  var txControl = getTxControlNameFromVertex(heepChunk.vertex);
  var rxControl = getRxControlNameFromVertex(heepChunk.vertex);
  masterState.vertexList[vertexName] = heepChunk.vertex;
  masterState.controls.connections[txControl] = rxControl;

}
