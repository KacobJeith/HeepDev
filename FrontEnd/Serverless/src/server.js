import express from 'express'
import bodyParser from 'body-parser'
import * as heepConnect from './serverUtils/HeepConnections'

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

app.post('/api/setValue', (req, res) => {
  
  heepConnect.SendValueToHeepDevice(req.body.clientID, req.body.controlID, req.body.value);
  
  res.end("Value sent to Heep Client");
});

app.post('/api/setVertex', (req, res) => {
  console.log(req.body.vertex)
  
  heepConnect.SendVertexToHeepDevices(req.body.vertex);
  
  res.end("Sending Vertex to Heep Devices");
});

app.post('/api/setPosition', (req, res) => {
  
  heepConnect.SendPositionToHeepDevice(req.body.clientID, req.body.position);
  
  res.end("Client Position has been updated");
});

app.listen(app.get('port'), (error) => {
  if (error) {
    console.error(error)
  } else {
    console.log('Server started: http://localhost:' + app.get('port') + '/');
  }
});

heepConnect.SearchForHeepDevices();