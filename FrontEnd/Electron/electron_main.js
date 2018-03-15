const electron = require('electron')
const electronApp = electron.app
const BrowserWindow = electron.BrowserWindow
const path = require('path')
const url = require('url')
var log = require('electron-log');
 

// const heep = require('./src/dist/server.js');

const express = require('express');
const bodyParser = require('body-parser');
const heepConnect = require('./dist/heep/HeepConnections');
const simulationDevice =  require('./dist/simulationHeepDevice.js');

let mainWindow

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

app.get('/api/refreshLocalDeviceState', (req, res) => {
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

app.listen(app.get('port'), function(error) {
  if (error) {
    console.error(error)
  } else {
    log.info('Hello, log');

    log.info('Server started: http://localhost:' + app.get('port') + '/');
  }
});

// heepConnect.SearchForHeepDevices();


electronApp.on('ready', function() {
  log.warn('log from the main process');


  mainWindow = new BrowserWindow({width: 800, height: 600})

  mainWindow.loadURL('http://localhost:' + app.get('port'));

  mainWindow.webContents.openDevTools()

  mainWindow.on('closed', function () {
    mainWindow = null
  })
});

electronApp.on('window-all-closed', function () {
  if (process.platform !== 'darwin') {
    electronApp.quit()
  }
})

electronApp.on('activate', function () {
  if (mainWindow === null) {
    createWindow()
  }
})