var WiFiControl = require('wifi-control');
 

export const QueryAvailableAccessPoints = (callback) => {
  WiFiControl.init({
    debug: true
  });
  
  WiFiControl.scanForWiFi( function(err, response) {
    if (err) console.log(err);
    console.log(response);

    callback(filterForHeepAPs(response.networks));
  })
}

const filterForHeepAPs = (allNetworks) => {

  return allNetworks.filter(apObject => apObject.ssid.length == 8 && apObject.ssid.indexOf('Heep') == 0)
} 
