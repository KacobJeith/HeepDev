import net from 'net'
import os from 'os' 
import * as heepParser from './HeepMemoryParser'
import * as heepIconUtils from './HeepIconUtils'

var masterState = {
  clients: {clientArray: []},
  positions: {},
  controls: {controlStructure:{}},
  vertexList: {},
  icons: {},
  url: ''
};

var searchComplete = false;
var mostRecentSearch = {};

export var SearchForHeepDevices = () => {
  var gateway = findGateway();

  for (var i = 1; i <= 255; i++){
    var address = joinAddress(gateway,i)

    ConnectToHeepDevice(address, 5000, 'IsHeepDevice:');
  }
}

export var GetCurrentMasterState = () => {
  return masterState
}

export var SendCommandToHeepDevice = (commandID, message) => {
  //SetVal:ControlName,Value
  //SetXY:X,Y
  var command = message.split(',');
  var clientID = command.shift();
  var sendMessage = commandID + ':' + command.join(',');

  var IPAddress = masterState.clients[clientID].IPAddress;
  console.log(sendMessage)
  ConnectToHeepDevice(IPAddress, 5000, sendMessage);
}

var findGateway = () => {
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
    console.log('Device found at address: ', IPAddress + ':' + port.toString());
    console.log(data.toString());
    console.log(data);
    //var splitString = data.toString('ascii');

    // if (isNaN(parseInt(splitString[0])) == false) {
    //   AddClientToMasterState(splitString, IPAddress, data)
    // }

    mostRecentSearch[IPAddress] = true;
    var HeepChunks = heepParser.MemoryCrawler(data);
    //console.log(HeepChunks);
    if (HeepChunks != false){
      AddMemoryChunksToMasterState(HeepChunks, IPAddress)
    }
    sock.end();
  });

  sock.on('end', () => {});

  sock.on('error', () => {
    mostRecentSearch[IPAddress] = false;
  });
}

var AddMemoryChunksToMasterState = (heepChunks, IPAddress) => {
  console.log(heepChunks)
  for (var i = 0; i < heepChunks.length; i++) {
    if (heepChunks[i].op == 1){
      AddClient(heepChunks[i], IPAddress);

    } else if (heepChunks[i].op == 2){
      AddControl(heepChunks[i]);

    } else if (heepChunks[i].op == 3){
      
    } else if (heepChunks[i].op == 4){
      
    } else if (heepChunks[i].op == 5){
      
    } else if (heepChunks[i].op == 6){
      
    } else if (heepChunks[i].op == 7){
      
    } else if (heepChunks[i].op == 8){
      
    }
  }

  console.log(masterState)
}

var AddClient = (heepChunk, IPAddress) => {
  var clientID = heepChunk.clientID;
  var clientName = 'unset';
  var iconName = 'none';
  heepIconUtils.SetClientIconFromString(clientID, clientName, iconName);

  masterState.clients[clientID] = {
    ClientID: clientID,
    IPAddress: IPAddress,
    ClientName: clientName,
    IconCustom: 0,
    IconName: iconName,
    ControlList: [],
    Position: {left: 0, top: 0},
    VertexList: []
  }

  if( masterState.clients.clientArray.indexOf(clientID) == -1){
    masterState.clients.clientArray.push(clientID);
  }

  SetClientPosition(clientID);
  masterState.controls.controlStructure[clientID] = ControlStructureTemplate();
  masterState.icons = heepIconUtils.GetIconContent();
}

var AddControl = (heepChunk) => {
  // Transition this to use new ControlID throughout frontend 
  var tempCtrlName = nameControlFromObject(heepChunk.clientID, heepChunk.control.ControlName) 
  masterState.controls[tempCtrlName] = heepChunk.control;
  masterState.controls[tempCtrlName].connectedControls = [];
  SetControlStructureNew(heepChunk.clientID, tempCtrlName)
}

var SetClientPosition = (clientID) => {
  
  var newPosition = {
    client: {top: 0, left: 0}
  }

  masterState.positions[clientID] = newPosition;

}

// var SetControlFromSplitString = (splitString, startIndex) => {
  
//   var controlName = splitString[startIndex + 2];
//   var ControlDirection = parseInt(splitString[startIndex]);
//   var controlID = nameControl(splitString, startIndex);

//   masterState.controls[controlID] = {
//     ControlDirection: ControlDirection,
//     ControlValueType: parseInt(splitString[startIndex+1]),
//     ControlName: controlName,
//     LowValue: parseInt(splitString[startIndex + 3]),
//     HighValue: parseInt(splitString[startIndex + 4]),
//     CurCtrlValue: 0,
//     connectedControls: []
//   }

//   SetControlStructure(splitString, controlID);

//   return startIndex + 5
// }

var SetControlPositions = (splitString) => {

  
  var clientID = getClientID(splitString);
  var newPosition = masterState.positions[clientID];

  var inputs = masterState.controls.controlStructure[clientID]['inputs']['controlsArray'];

  for (var i = 0; i < inputs.length; i++){
    var thisControl = masterState.controls[inputs[i]].ControlName;
    newPosition[thisControl] = setInputControlPosition(clientID, i);
  }


  var outputs = masterState.controls.controlStructure[clientID]['outputs']['controlsArray'];

  for (var i = 0; i < outputs.length; i++){
    var thisControl = masterState.controls[outputs[i]].ControlName;
    newPosition[thisControl] = setOutputControlPosition(clientID, i);
  }

  masterState.positions[clientID] = newPosition;

}

var setInputControlPosition = (clientID, index) => {
  var startingPosition = masterState.positions[clientID]['client'];
  var position = {
    top: startingPosition['top'] + 45 + 1.5 + 25/2 + 55*index, 
    left: startingPosition['left'] + 10
  }
  
  return position;
}

var setOutputControlPosition = (clientID, index) => {
  var startingPosition = masterState.positions[clientID]['client'];
  var position = {
    top: startingPosition['top'] + 45 + 1.5 + 25/2 + 55*index, 
    left: startingPosition['left'] + 10
  }

  return position;
}

var ControlStructureTemplate = () => {
  return {
    inputs: {controlsArray: []},
    outputs: {controlsArray: []}
  }
}

var SetControlStructure = (splitString, controlID) => {

  if ( masterState.controls[controlID]['ControlDirection']){
    masterState.controls.controlStructure[getClientID(splitString)].outputs.controlsArray.push(controlID);
  } else {
    masterState.controls.controlStructure[getClientID(splitString)].inputs.controlsArray.push(controlID);
  }

}

var SetControlStructureNew = (clientID, controlID) => {

  if ( masterState.controls[controlID]['ControlDirection']){
    masterState.controls.controlStructure[clientID].outputs.controlsArray.push(controlID);
  } else {
    masterState.controls.controlStructure[clientID].inputs.controlsArray.push(controlID);
  }

}

var nameVertex = (vertex) => {
    return vertex['sourceID'] + '.' + vertex['outputName'] + '->' + vertex['destinationID'] + '.' + vertex['inputName'];
}

var nameControlFromObject = (clientID, controlName) => {
  return clientID +  '.' + controlName;
}
