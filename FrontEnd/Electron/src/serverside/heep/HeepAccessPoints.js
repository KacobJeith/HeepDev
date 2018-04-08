const heepConnect = require('./HeepConnections');
var wifi = require('node-wifi');

export const QueryAvailableAccessPoints = (callback) => {
  wifi.init({
    iface: null
  });
  
  wifi.scan( function(err, networks) {
    if (err) console.log(err);

    callback(filterForHeepAPs(networks));
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

  var results = wifi.connect( { ssid: ssid, password: password }).then(function () {

    callback({success: true})

  }).catch(function (error) {
    // error

    callback({success: false})
  })

}

export const ResetSystemWifi = (callback) => {

  wifi.disconnect().then( function(response) {

    console.log(response);
    callback(response)

  }).catch(function(error) {
    console.log('FAILED TO DISCONNECT')
  });
}