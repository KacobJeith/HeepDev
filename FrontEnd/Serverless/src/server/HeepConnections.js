import net from 'net'
import os from 'os' 
import fs from 'fs'
import path from 'path'


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

export var SendCommandToHeepDevice = (message) => {
  //SetVal:ControlName,Value
  var command = message.split(',');
  var clientID = command[0];
  var sendMessage = 'SetVal:' + command[1] + ',' + command[2];
  var IPAddress = masterState[clientID].IPAddress;

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
    var splitString = data.toString().split(',');

    if (isNaN(parseInt(splitString[0]))) {
      console.log('Found an imposter HeepDevice!');
    } else {
      AddClientToMasterState(splitString, IPAddress)
    }

    mostRecentSearch[IPAddress] = true;
    
    sock.end();
  });

  sock.on('end', () => {});

  sock.on('error', () => {
    mostRecentSearch[IPAddress] = false;
  });
}

var AddClientToMasterState = (splitString, IPAddress) => {

    SetClientFromString(splitString, IPAddress);
    SetClientIconFromString(splitString);

    var numControls = parseInt(splitString[6]);
    masterState.controls.controlStructure[getClientID(splitString)] = ControlStructureTemplate();
    var it = 7;
    for (var i = 0; i < numControls; i++) {

      it = SetControlFromSplitString(splitString, it)
    }

    SetControlPositions(splitString);
  
}

var SetClientFromString = (splitString, IPAddress) => {
   var clientID = getClientID(splitString);

  if( masterState.clients.clientArray.indexOf(clientID) == -1){
    masterState.clients.clientArray.push(clientID);
  }

  masterState.clients[clientID] = {
    ClientID: parseInt(splitString[0]),
    IPAddress: IPAddress,
    ClientType: parseInt(splitString[2]),
    ClientName: splitString[3],
    IconCustom: parseInt(splitString[4]),
    IconName: splitString[5],
    ControlList: [],
    Position: {left: 0, top: 0},
    VertexList: []
  }

  SetClientPosition(splitString);
}

var SetClientIconFromString = (splitString) => {
  var clientIconName = getClientIcon(splitString);
  var filepath = path.join(__dirname, '../assets/', clientIconName + '.svg');

   fs.readFile(filepath, (err, data) => {
    if (err) {
      console.error('SVG failed');
   } else {
    masterState.icons[getClientID(splitString)] = data.toString();
   }
 });
}

var SetClientPosition = (splitString) => {
  
  var newPosition = {
    client: {top: 0, left: 0}
  }

  masterState.positions[getClientID(splitString)] = newPosition;

}

var SetControlFromSplitString = (splitString, startIndex) => {
  
  var controlName = splitString[startIndex + 2];
  var ControlDirection = parseInt(splitString[startIndex]);
  var controlID = nameControl(splitString, startIndex);

  masterState.controls[controlID] = {
    ControlDirection: ControlDirection,
    ControlValueType: parseInt(splitString[startIndex+1]),
    ControlName: controlName,
    LowValue: parseInt(splitString[startIndex + 3]),
    HighValue: parseInt(splitString[startIndex + 4]),
    CurCtrlValue: 0,
    connectedControls: []
  }

  SetControlStructure(splitString, controlID);

  return startIndex + 5
}

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

var nameVertex = (vertex) => {
    return vertex['sourceID'] + '.' + vertex['outputName'] + '->' + vertex['destinationID'] + '.' + vertex['inputName'];
}

var nameControl = (splitString, startIndex) => {
  return getClientID(splitString) +  '.' + splitString[startIndex + 2];
}

var nameControlFromObject = (clientID, controlName) => {
  return clientID +  '.' + controlName;
}

var getClientID = (splitString) => {
  return splitString[0];
}

var getClientIcon = (splitString) => {
  return splitString[5];
}
