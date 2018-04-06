const path = require('path')
const url = require('url')
var log = require('electron-log');

const express = require('express');
const bodyParser = require('body-parser');
const heepConnect = require('./serverside/heep/HeepConnections');
const heepAccess = require('./serverside/heep/HeepAccessPoints');
const simulationDevice =  require('./serverside/simulationHeepDevice.js');

var app = express();

app.set('port', (process.env.PORT || 3004));

//CORS middleware
var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}

app.use(allowCrossDomain);
app.use('/', express.static(__dirname));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get('/api/findDevices', function(req, res) {
  let simulation = false;
  
  if (simulation) {
    res.json(simulationDevice.simulationDevice);
  } else {
    heepConnect.SearchForHeepDevices(); 
    res.json(heepConnect.GetCurrentMasterState());
  }
    
});

app.get('/api/searchForAccessPoints', (req, res) => {
  console.log("Search for Access Points")

  heepAccess.QueryAvailableAccessPoints((results) => {
    res.json(results);
  });

})

app.get('/api/ResetSystemWifi', (req, res) => {
  console.log("Resetting Wifi")

  heepAccess.ResetSystemWifi((results) => {
    res.json(results);
  });

})

app.get('/api/refreshLocalDeviceState', (req, res) => {
  console.log("Refreshing local device state")
  heepConnect.ResetDevicesActiveStatus();
  heepConnect.SearchForHeepDevices(); 

  setTimeout(() => {
    res.json(heepConnect.GetCurrentMasterState());
  }, 2000);

})

app.get('/api/hardRefreshLocalDeviceState', (req, res) => {
  console.log("Refreshing local device state")
  heepConnect.ResetMasterState(); 
  heepConnect.SearchForHeepDevices(); 

  setTimeout(() => {
    res.json(heepConnect.GetCurrentMasterState());
  }, 2000);

})

app.post('/api/setValue', function(req, res) {
  
  heepConnect.SendValueToHeepDevice(req.body.deviceID, req.body.controlID, req.body.value);
  
  res.end("Value sent to Heep Device");
});

app.post('/api/setVertex', function (req, res) {
  console.log(req.body.vertex)
  
  heepConnect.SendVertexToHeepDevices(req.body.vertex);
  
  res.end("Sending Vertex to Heep Devices");
});

app.post('/api/deleteVertex', function(req, res) {
  console.log(req.body.vertex)
  
  heepConnect.SendDeleteVertexToHeepDevices(req.body.vertex);
  
  res.end("Deleting Vertex on Heep Devices");
});

app.post('/api/setPosition', function(req, res) {
  
  heepConnect.SendPositionToHeepDevice(req.body.deviceID, req.body.position);
  
  res.end("Device Position has been updated");
});

app.post('/api/sendWifiCredsToDevice', function(req, res) {
  
  heepConnect.sendWifiCredsToDevice(req.body.deviceID, req.body.ssid, req.body.password);
  console.log("Sending Wifi Credentials to the Device: " + req.body.deviceID)
  res.end("Sending Wifi Credentials to the Device: " + req.body.deviceID);
});

app.post('/api/connectToAccessPoint', function(req, res) {
  console.log("Connect To Access Point: ", req.body.ssid)

  connectToAccessPoint(req, res, (response) => {
    console.log('First connection succeeded')
    hardResetAP(res, req.body.ssid, response.success);

  }, () => {

    console.log('First connection failed. Trying to connect a second time');

    connectToAccessPoint(req, res, (response) => {
      hardResetAP(res, req.body.ssid, response.success);
    }, (response) => {

      res.json({
        success: response.success,
        ssid: req.body.ssid,
        data: heepConnect.GetCurrentMasterState()
      })
    });
  });

})

const connectToAccessPoint = function(req, res, successCallback, failureCallback) {

  heepAccess.ConnectToAccessPoint(req.body.ssid, 'HeepSecretPassword', (response) => {
    //Perform a hard reset and send results back to UI - should only see 1 device
    if ( response.success ) {
      successCallback(response);
    } else {
      failureCallback(response)
    }
    
  });
}

const hardResetAP = function(res, ssid, success = true) {

  heepConnect.ResetMasterState(); 
  heepConnect.SearchForHeepDevices(); 
  setTimeout(() => {
    res.json({
      success: success,
      ssid: ssid,
      data: heepConnect.GetCurrentMasterState()
    });
  }, 2000);
}

app.listen(app.get('port'), function(error) {
  
  if (error) {
    console.error(error)
  } else {

    log.info('Hello, log');
    log.info('Server started: http://localhost:' + app.get('port') + '/');
  }
});
