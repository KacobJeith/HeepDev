require('./heepServer')
const electron = require('electron')
const electronApp = electron.app
const BrowserWindow = electron.BrowserWindow
var log = require('electron-log');


const autoUpdater = require('electron-updater').autoUpdater;
autoUpdater.logger = log;
autoUpdater.logger.transports.file.level = "info";

let mainWindow


electronApp.on('ready', function() {

  mainWindow = new BrowserWindow({
      width: 800, 
      height: 600,
      webPreferences: {
        webSecurity: false
      }
    })

  mainWindow.loadURL('http://localhost:3004/');
  mainWindow.setMenu(null);
  // mainWindow.webContents.openDevTools()

  mainWindow.on('closed', function () {
    mainWindow = null
  })

  log.info('Main Electron function');
  autoUpdater.checkForUpdatesAndNotify();

  autoUpdater.on('checking-for-update', function(info) {
    log.info("inside checking for update: ", info);
  });
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
