import $ from 'jquery';

export var sendVertexToServer = (url, vertex) => {

  const message = 'SetVertex' + ':' + 
          vertex.inputName + ',' + 
          vertex.outputName + ',' +
          vertex.destinationIP + ',' + 
          vertex.destinationID + ',' + 
          vertex.sourceID;

    const messagePacket = {command: message};

  $.ajax({
      url: url,
      type: 'POST',
      data: messagePacket,
      success: (data) => {
      },
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
        console.log('Hitting sendVertexToServer error');
      }
    });
};

export var sendValueToServer = (clientID, controlID, newValue) => {

  var messagePacket = {
    clientID: clientID, 
    controlID: controlID, 
    newValue: newValue};

  var url = '/api/setValue';
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
};


