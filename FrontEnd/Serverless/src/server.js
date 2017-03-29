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
  var sock = new net.Socket();
  sock.connect({host: IPAddress, port: port}, () => {
    console.log('Connected to Server!');
    sock.write('IsHeepDevice:');
  });

  sock.on('data', (data) => {
    console.log(data.toString());

    AddClientToMasterState(data.toString());

    sock.end();
  });

  sock.on('end', () => {
    console.log(masterState);
    console.log('disconnected from server');
  });

}

var AddClientToMasterState = (clientString) => {

    var splitString = clientString.split(',');

    SetClientFromString(splitString);
    SetClientIconFromString(splitString);

    var it = 6
    while (it < splitString.length){
      var it = SetControlFromSplitString(splitString, it)
    }
}

var SetClientFromString = (splitString) => {
   var clientID = getClientID(splitString);
   masterState.clients[clientID] = {
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

    masterState.clients.clientArray.push(clientID);

}

var SetClientIconFromString = (splitString) => {
  var clientIconName = getClientIcon(splitString);
  var filepath = path.join(__dirname, './assets/', clientIconName + '.svg');

   fs.readFile(filepath, (err, data) => {
    if (err) {
      console.error('SVG failed');
   } else {
    masterState.icons[getClientID(splitString)] = data.toString();
   }
 });
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

var getClientIcon = (splitString) => {
  return splitString[5];
}
