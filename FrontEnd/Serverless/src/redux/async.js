import $ from 'jquery';

export var sendVertexToServer = (url, vertex) => {
  var url = url.concat('/api/setVertex');

  const messagePacket = {vertex: vertex};

  performAJAX(url, messagePacket);
};

export var sendValueToServer = (clientID, controlID, newValue, url) => {

  var messagePacket = {
    clientID: clientID, 
    controlID: controlID, 
    value: newValue
  };

  var url = url.concat('/api/setValue');
  
  performAJAX(url, messagePacket);
  
};

export var sendPositionToServer = (clientID, position, url) => {

  var messagePacket = {
    clientID: clientID, 
    position: position
  };

  var url = url.concat('/api/setPosition');
  
  performAJAX(url, messagePacket);
  
};

export var sendDeleteVertexToServer = (url, vertex) => {

  var url = url.concat('/api/deleteVertex');
  
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



