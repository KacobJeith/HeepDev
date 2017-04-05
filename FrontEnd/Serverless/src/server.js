import express from 'express'
import bodyParser from 'body-parser'
import * as heepConnect from './server/HeepConnections'

var app = express();

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
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get('/api/clients', (req, res) => {
  heepConnect.SearchForHeepDevices(); 
  res.json(heepConnect.GetCurrentMasterState());  
});


app.post('/api/commands', (req, res) => {
  const command = req.body["command"];
  var stripFirst = command.split(':');

  if (stripFirst[0] == 'SetCommand'){
    heepConnect.SendCommandToHeepDevice('SetVal', stripFirst[1]);
  } else if (stripFirst[0] == 'SetPosition'){
    heepConnect.SendCommandToHeepDevice('SetXY', stripFirst[1]);
  }
  res.end("Command sent");
});

app.listen(app.get('port'), (error) => {
  if (error) {
    console.error(error)
  } else {
    console.log('Server started: http://localhost:' + app.get('port') + '/');
  }
});

heepConnect.SearchForHeepDevices();