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

  console.log(messagePacket);

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

export var sendDeleteVertexToServer = (vertex) => {

  var url = urlPrefix.concat('/api/deleteVertex');
  
  const messagePacket = {vertex: vertex};

  performAJAX(url, messagePacket);

}

export var refreshLocalDeviceState = () => {
  var url = urlPrefix.concat('/api/refreshLocalDeviceState');

  performAJAX(url, {}, 'GET', (data) => {
    console.log("Received Data: ", data);
    setup.store.dispatch(actions_classic.overwriteFromServer(data));
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




