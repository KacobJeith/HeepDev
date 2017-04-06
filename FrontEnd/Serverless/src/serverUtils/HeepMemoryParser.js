var MemoryCrawler = (buffer) => {
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
  var thisBlock = {};
  thisBlock.clientID = ReadClientID(buffer, it);
  thisBlock.bytes = ReadSizeOfPacket(buffer, it);


  if (buffer[it] == 1){
    // Client Data
    thisBlock.op = buffer[it];
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

  } 

  return thisBlock
}

var ReadClientID = (buffer, it) => {
  // it is the counter at the OP Code

  var clientID = (buffer[it + 1] << 24) + 
                 (buffer[it + 2] << 16) +
                 (buffer[it + 3] <<  8) + 
                 (buffer[it + 4]);

  return clientID
}

var ReadSizeOfPacket = (buffer, it) => {
  return buffer[it + 5]
}

var CalculateSizeOfOPCodeBlock = (bytes) => {
  // total size of block depends on size of bytes, clientID, OPcode, 
  // and number of bytes spent communicating the size in bytes 
  // Since ff -> ff ff -> ff ff ff ff, this might not be straightforward
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

