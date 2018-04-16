import $ from 'jquery';
import * as setup from '../index';
import * as actions_classic from './actions_classic'

var urlPrefix = '';

export var saveURL = (url) => {
  urlPrefix = url;
}

export var sendVertexToServer = (vertex) => {
  var url = urlPrefix.concat('/api/setVertex');

  const messagePacket = {vertex: vertex};

  performAJAX(url, messagePacket);
};

export var sendValueToServer = (deviceID, controlID, newValue) => {

  var messagePacket = {
    deviceID: deviceID, 
    controlID: controlID, 
    value: newValue
  };

  var url = urlPrefix.concat('/api/setValue');
  
  performAJAX(url, messagePacket);
  
};

export var sendPositionToServer = (deviceID, position) => {

  var messagePacket = {
    deviceID: deviceID, 
    position: position
  };

  var url = urlPrefix.concat('/api/setPosition');
  
  performAJAX(url, messagePacket);
  
};

export var sendWifiCredsToServer = (deviceID, ssid, password) => {

  var messagePacket = {
    deviceID: deviceID, 
    ssid: ssid,
    password: password
  };

  var url = urlPrefix.concat('/api/sendWifiCredsToDevice');
  
  performAJAX(url, messagePacket);
  
};

export var rehydrateServerState = (state) => {

  var url = urlPrefix.concat('/api/rehydrateDeviceState');
  
  performAJAX(url, state);
}

export var sendDeleteVertexToServer = (vertex) => {

  var url = urlPrefix.concat('/api/deleteVertex');
  
  const messagePacket = {vertex: vertex};

  performAJAX(url, messagePacket);

}

export var refreshLocalDeviceState = () => {
  var url = urlPrefix.concat('/api/refreshLocalDeviceState');

  performAJAX(url, {}, 'GET', (data) => {
    
    setup.store.dispatch(actions_classic.overwriteFromServer(data));
  })
}

export var hardRefreshLocalDeviceState = () => {
  var url = urlPrefix.concat('/api/hardRefreshLocalDeviceState');

  performAJAX(url, {}, 'GET', (data) => {
    
    setup.store.dispatch(actions_classic.overwriteFromServer(data));
  })
}

export const searchForAccessPoints = () => {
  
  var url = urlPrefix.concat('/api/searchForAccessPoints');

  performAJAX(url, {}, 'GET', (data) => {
    
    setup.store.dispatch(actions_classic.setAccessPoints(data));
  })

}

export const connectToAccessPoint = (ssid) => {

  const messagePacket = {ssid: ssid};

  var url = urlPrefix.concat('/api/connectToAccessPoint');

  performAJAX(url, messagePacket, 'POST', (response) => {

    if (response.success) {
      const deviceID = Object.keys(response.data.devices)[0];

      setup.store.dispatch(actions_classic.overwriteFromServer(response.data));
      
      const accessData = {
        connectedTo: response.ssid,
        currentlyConnecting: null,
        failedAttempt: null,
        deviceID: deviceID
      }

      setup.store.dispatch(actions_classic.setAccessData(accessData));
      setup.store.dispatch(actions_classic.setDetailsPanelDeviceID(deviceID));

    } else {

      const accessData = {
        connectedTo: null,
        currentlyConnecting: null,
        failedAttempt: response.ssid,
        deviceID: deviceID
      }

      setup.store.dispatch(actions_classic.setAccessData(accessData));
    }
    
  })

}

export const resetDeviceAndOSWifi = (deviceID) => {

  const accessData = {
    connectedTo: null,
    currentlyConnecting: null,
    failedAttempt: null,
    deviceID: null
  }
  
  setTimeout(() => setup.store.dispatch(actions_classic.setDetailsPanelDeviceID(null)), 100);
  setTimeout(() => setup.store.dispatch(actions_classic.setAccessData(accessData)), 200);
  
  var url = urlPrefix.concat('/api/resetDeviceAndOSWifi');

  performAJAX(url, {deviceID: deviceID}, 'POST', (response) => {

    setup.store.dispatch(actions_classic.overwriteFromServer(response));    
    
  })

}


export var performAJAX = (url, messagePacket, type = 'POST', callback = (data) => {} ) => {
  $.ajax({
    url: url,
    type: type,
    data: messagePacket,
    success: (data) => {
      callback(data)
    },
    error: function(xhr, status, err) {
      console.error(url, status, err.toString());
      console.log('Hitting Commands sendDataToServer error')
    }
  });
}

export const startLiveMode = () => {
  var liveModeRef = setInterval(refreshLocalDeviceState, 4000);

  return liveModeRef
}

export const stopLiveMode = (liveModeReference) => {
  clearTimeout(liveModeReference);
}




