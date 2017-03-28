import fs from 'fs'
import path from 'path'
import net from 'net'
import express from 'express'
import bodyParser from 'body-parser'

var app = express();
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
        res.json(allClients);
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
    console.log('exiting: ', allClients);
    console.log('disconnected from server');
  });

  // while (1) {
  //   if (isNotEmpty(newClient) > 0){
  //     console.log('returning:', newClient);
  //     return newClient
  //   }
  // }


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
    

    var it = 6
    while (it < splitString.length){
      var control = ControlValue();
      var newData = SetControlFromSplitString(splitString, it, control);
      thisClient.ControlList.push(newData.thisControl);
      it = newData.it;
    }

    //console.log(thisClient);

    return thisClient
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

var isNotEmpty = (obj) => {
    //console.log('Check obj: ', obj);
    return Object.keys(obj).length;
}
