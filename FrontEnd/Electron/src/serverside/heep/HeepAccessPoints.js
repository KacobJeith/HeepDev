const heepConnect = require('./HeepConnections');

if (process.env.NODE_ENV == 'dev') {
  var WiFiControl = require('wifi-control');
} else {
  var WiFiControl = __non_webpack_require__('wifi-control');
}

export const QueryAvailableAccessPoints = (callback) => {
  WiFiControl.init({
    debug: true
  });
  
  WiFiControl.scanForWiFi( function(err, response) {
    if (err) console.log(err);

    callback(filterForHeepAPs(response.networks));
  })
}

const filterForHeepAPs = (allNetworks) => {
  const heepNetworks = allNetworks.filter(apObject => apObject.ssid.length == 8 && apObject.ssid.indexOf('Heep') == 0);

  var heepNetworksObject = {};

  for (var i in heepNetworks) {
    heepNetworksObject[heepNetworks[i].ssid] = heepNetworks[i];
  }
  
  return heepNetworksObject
} 

export const ConnectToAccessPoint = (ssid, password, callback = () => ('success')) => {

  var _ap = {
    ssid: ssid,
    password: password
  };

  var results = WiFiControl.connectToAP( _ap, function(err, response) {
    if (err) console.log(err);
    console.log(response);
    callback(response);
  });
}

export const ResetSystemWifi = (callback) => {

  WiFiControl.resetWiFi( function(err, response) {
    if (err) console.log(err);
    console.log(response);
    callback(response)
  } );
}