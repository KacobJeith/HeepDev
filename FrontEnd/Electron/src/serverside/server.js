import express from 'express'
import bodyParser from 'body-parser'
import * as heepConnect from './heep/HeepConnections'

import { simulationDevice } from './simulationHeepDevice.js'


export var StartHeepServer = () => {
  var app = express();

  app.set('port', (process.env.PORT || 3003));

  //CORS middleware
  var allowCrossDomain = (req, res, next) => {
      res.header('Access-Control-Allow-Origin', '*');
      res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
      res.header('Access-Control-Allow-Headers', 'Content-Type');
      next();
  }


  app.use(allowCrossDomain);
  app.use('/', express.static(__dirname));
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({extended: true}));

  app.get('/api/findDevices', (req, res) => {
    let simulation = false;
    
    if (simulation) {
      res.json(simulationDevice);
    } else {
      heepConnect.SearchForHeepDevices(); 
      res.json(heepConnect.GetCurrentMasterState());
    }
      
  });

  app.post('/api/setValue', (req, res) => {
    
    heepConnect.SendValueToHeepDevice(req.body.deviceID, req.body.controlID, req.body.value);
    
    res.end("Value sent to Heep Device");
  });

  app.post('/api/setVertex', (req, res) => {
    console.log(req.body.vertex)
    
    heepConnect.SendVertexToHeepDevices(req.body.vertex);
    
    res.end("Sending Vertex to Heep Devices");
  });

  app.post('/api/deleteVertex', (req, res) => {
    console.log(req.body.vertex)
    
    heepConnect.SendDeleteVertexToHeepDevices(req.body.vertex);
    
    res.end("Deleting Vertex on Heep Devices");
  });

  app.post('/api/setPosition', (req, res) => {
    
    heepConnect.SendPositionToHeepDevice(req.body.deviceID, req.body.position);
    
    res.end("Device Position has been updated");
  });

  app.listen(app.get('port'), (error) => {
    if (error) {
      console.error(error)
    } else {
      console.log('Server started: http://localhost:' + app.get('port') + '/');
    }
  });

  heepConnect.SearchForHeepDevices();
}

