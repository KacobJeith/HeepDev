import fs from 'fs'
import path from 'path'
import net from 'net'
import express from 'express'
import bodyParser from 'body-parser'

var app = express();
var masterState = {
  clients: {clientArray: []},
  positions: {},
  controls: {controlStructure:{}},
  vertexList: {},
  icons: {},
  url: ''
};

var allClients = [];

app.set('port', (process.env.PORT || 3001));

//CORS middleware
var allowCrossDomain = (req, res, next) => {
    res.header('Access-Control-Allow-Origin', 'http://localhost:8080');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}

app.use(allowCrossDomain);
app.use('/', express.static(__dirname));
app.use('/static', express.static(path.join(__dirname, '../../../Server')))
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));


app.get('/api/clients', (req, res) => {
  console.log('trying connection');
  ConnectToHeepDevice('127.0.0.1', 5000);
  setTimeout(()=>{
        res.json(masterState);
  },500);

});

app.post('/api/commands', (req, res) => {
  const command = req.body["command"];

  res.end("Command sent");
});

app.listen(app.get('port'), (error) => {
  if (error) {
    console.error(error)
  } else {
    console.log('Server started: http://localhost:' + app.get('port') + '/');
  }
});

var ConnectToHeepDevice = (IPAddress, port) => {
  // Need to figure out how to get newClient out of the data socket function
  var sock = new net.Socket();
  sock.connect({host: IPAddress, port: port}, () => {
    console.log('Connected to Server!');
    sock.write('IsHeepDevice:');
  });

  sock.on('data', (data) => {
    console.log(data.toString());
    var newClient = SetClientFromString(data.toString());
    allClients.push(newClient);
    sock.end();
  });

  sock.on('end', () => {
    console.log(masterState);
    console.log('disconnected from server');
  });

}

var SetClientFromString = (clientString) => {

    var splitString = clientString.split(',');

    var thisClient = {
      ClientID: parseInt(splitString[0]),
      IPAddress: splitString[1],
      ClientType: parseInt(splitString[2]),
      ClientName: splitString[3],
      IconCustom: parseInt(splitString[4]),
      IconName: splitString[5],
      ControlList: [],
      Position: {left: 0, top: 0},
      VertexList: []
    }

    SetMasterStateClientFromString(splitString);
    

    var it = 6
    while (it < splitString.length){
      var control = ControlValue();
      var newData = SetControlFromSplitString(splitString, it, control);
      var it_ = SetMasterStateControlFromSplitString(splitString, it)
      thisClient.ControlList.push(newData.thisControl);
      it = newData.it;
    }

    console.log(thisClient);

    return thisClient
}

var SetMasterStateClientFromString = (splitString) => {
   var ID = getClientID(splitString);
   masterState.clients[ID] = {
      ClientID: parseInt(splitString[0]),
      IPAddress: splitString[1],
      ClientType: parseInt(splitString[2]),
      ClientName: splitString[3],
      IconCustom: parseInt(splitString[4]),
      IconName: splitString[5],
      ControlList: [],
      Position: {left: 0, top: 0},
      VertexList: []
    }

    masterState.clients.clientArray.push(ID);

}

var SetControlFromSplitString = (splitString, startIndex, control) => {
    control.ControlDirection = parseInt(splitString[startIndex]);
    control.ControlValueType = parseInt(splitString[startIndex+1]);
    var startIndex = startIndex+1;

    //May need to be modified in the future for string inputs
    control.ControlName = splitString[startIndex + 1];
    control.LowValue = parseInt(splitString[startIndex + 2]);
    control.HighValue = parseInt(splitString[startIndex + 3]);
    return {it: startIndex + 4, thisControl: control}
}


var SetMasterStateControlFromSplitString = (splitString, startIndex) => {

  var controlName = splitString[startIndex + 2];
  var ControlDirection = parseInt(splitString[startIndex]);
  var controlID = nameControl(splitString, startIndex);

  masterState.controls[controlID] = {
    ControlDirection: ControlDirection,
    ControlValueType: parseInt(splitString[startIndex+1]),
    ControlName: controlName,
    LowValue: parseInt(splitString[startIndex + 3]),
    HighValue: parseInt(splitString[startIndex + 4]),
    CurCtrlValue: 0
  }

  SetPositionFromSplitString(splitString, startIndex, controlName, ControlDirection);
  SetControlStructure(splitString, controlID);

  return startIndex + 6
}

var SetPositionFromSplitString = (splitString, startIndex, controlName) => {
  
  var newPosition = {
    client: {top: 0, left: 0}
  }

  newPosition[controlName] = {top: 59, left: 10};

  masterState.positions[getClientID(splitString)] = newPosition;

}

var getControlPosition = () => {

}

var ControlValue = () => {
  return {
    ControlValueType: 1,
    ControlDirection: 1,
    HighValue: 10,
    LowValue: 0,
    CurCtrlValue: 0,
    ControlName: 'None'
  }
}

var ControlStructureTemplate = () => {
  return {
    inputs: {controlsArray: []},
    outputs: {controlsArray: []}
  }
}

var SetControlStructure = (splitString, controlID) => {
  var controlStruct = ControlStructureTemplate();

  if ( masterState.controls[controlID]['ControlDirection']){
    controlStruct.outputs.controlsArray.push(controlID);
  } else {
    controlStruct.inputs.controlsArray.push(controlID);
  }

  masterState.controls.controlStructure[getClientID(splitString)] = controlStruct;

}

var nameVertex = (vertex) => {
    return vertex['sourceID'] + '.' + vertex['outputName'] + '->' + vertex['destinationID'] + '.' + vertex['inputName'];
  }

var nameControl = (splitString, startIndex) => {
  return getClientID(splitString) +  '.' + splitString[startIndex + 2];
}

var getClientID = (splitString) => {
  return splitString[0];
}
