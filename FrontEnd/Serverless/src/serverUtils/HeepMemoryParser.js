export var MemoryCrawler = (buffer) => {
  var it = 0;
  var data = [];

  while (it < buffer.length) {
    var nextBlock = ReadOPCode(buffer, it);

    if (it == nextBlock[0]){
      console.log('Encountered an un-implemented OP Code');
      break
    } else {
      console.log('nextBlock: ', nextBlock);
    }

    it = nextBlock[0];
    data.push(nextBlock[1]);
  }

}

var ReadOPCode = (buffer, it) => {
  var thisBlock = {
    op: buffer[it],
    clientID: ReadClientID(buffer, it),
    packetBytes: ReadSizeOfPacket(buffer, it)
  };

  console.log('Encountered OP: ', buffer[it]);

  if (buffer[it] == 1){
    // Client Data
    thisBlock.version = ReadFirmwareVersion(buffer, it);

  } else if (buffer[it] == 2) {
    // Controls

  } else if (buffer[it] == 3) {
    // Vertex

  } else if (buffer[it] == 4) {
    // Icon ID

  } else if (buffer[it] == 5) {
    //Custom Icon Drawing

  } else if (buffer[it] == 6) {
    //Client Name

  } else if (buffer[it] == 7) {
    //FrontEnd Position

  } else if (buffer[it] == 8) {
    //ClientIP

  } else {
    return {null}
  }


  return thisBlock
}

var ReadClientID = (buffer, it) => {
  // it is the counter at the OP Code

  var clientID_1 = (buffer[it + 1] << 24) >>> 0;
  var clientID_2 = (buffer[it + 2] << 16) >>> 0;
  var clientID_3 = (buffer[it + 3] << 8) >>> 0;
  var clientID_4 = (buffer[it + 4]);

  var clientID = clientID_1 + clientID_2 + clientID_3 + clientID_4;

  return clientID
}

var ReadSizeOfPacket = (buffer, it) => {
  // Need to implement expansion logic for values > 255
  return buffer[it + 5]
}

var CalculateSizeOfOPCodeBlock = (bytes) => {
  // total size of block depends on size of bytes, clientID, OPcode, 
  // and number of bytes spent communicating the size in bytes 
  // Since ff -> ff ff -> ff ff ff ff, there is a little bit of play here
  return bytes + 5
}

var ReadFirmwareVersion = (buffer, it) => {
  return buffer[it + 6] 
}

var ReadXYPosition = (buffer, it) => {

  return 
}

var ReadClientName = (buffer, it) => {

  return it + 5
}

