import $ from 'jquery';

function sendVertexToServer(url, vertex) {

    const message = 'SetVertex' + ':' + 
            vertex.inputName + ',' + 
            vertex.outputName + ',' +
            vertex.destinationIP + ',' + 
            vertex.destinationID + ',' + 
            vertex.sourceID + '\n';

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

export default sendVertexToServer;
