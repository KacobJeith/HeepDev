import $ from 'jquery';

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


export var performAJAX = (url, messagePacket ) => {
  $.ajax({
    url: url,
    type: 'POST',
    data: messagePacket,
    success: (data) => {
    },
    error: function(xhr, status, err) {
      console.error(url, status, err.toString());
      console.log('Hitting Commands sendDataToServer error')
    }
  });
}




