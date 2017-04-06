export var MemoryCrawler = (buffer) => {
  var it = 0;
  var data = [];

  while (it < buffer.length) {
    console.log('it: ', it)
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
  console.log(data)
  return data
}

var ReadOPCode = (buffer, it) => {
  var packetBytes = ReadSizeOfPacket(buffer, it);
  var byteIndicatorBytes = packetBytes[1];

  var thisBlock = {
    op: buffer[it],
    clientID: ReadClientID(buffer, it),
    packetBytes: packetBytes[0]
  };


  console.log('Encountered OP: ', buffer[it]);

  it += 5;

  if (buffer[it] == 1){
    // Client Data
    thisBlock.version = ReadFirmwareVersion(buffer, it);

  } else if (thisBlock.op == 2) {
    // Controls
    thisBlock.control = ReadControl(buffer, it);

  } else if (thisBlock.op == 3) {
    // Vertex

  } else if (thisBlock.op == 4) {
    // Icon ID

  } else if (thisBlock.op == 5) {
    //Custom Icon Drawing

  } else if (thisBlock.op == 6) {
    //Client Name

  } else if (thisBlock.op == 7) {
    //FrontEnd Position

  } else if (thisBlock.op == 8) {
    //ClientIP

  } else {
    return {null}
  }

  it += CalculateNextIterator(byteIndicatorBytes, thisBlock.packetBytes);
  return [it, thisBlock]
}

var ReadClientID = (buffer, it) => {
  // it is the counter at the OP Code

  var clientID =  ((buffer[it + 1] << 24) >>> 0) + 
                  ((buffer[it + 2] << 16) >>> 0) +
                  ((buffer[it + 3] <<  8) >>> 0) + 
                  ( buffer[it + 4]);

  return clientID
}

var ReadSizeOfPacket = (buffer, it) => {
  // Need to implement expansion logic for values > 255
  // Currently assume < 255
  return [buffer[it + 5], 1]
}

var CalculateNextIterator = (indicator, bytes) => {
  return bytes + indicator
}

var ReadFirmwareVersion = (buffer, it) => { // OP 1
  return buffer[it + 1] 
}

var ReadControl = (buffer, it) => { // OP 2

  var thisControl = {
    ControlID: buffer[it + 1],
    ControlValueType: buffer[it + 2],
    ControlDirection: buffer[it + 3],
    LowValue: buffer[it + 4],
    HighValue: buffer[it + 5],
    CurCtrlValue: buffer[it + 6],
    ControlName: buffer.slice(it + 7, it + buffer[it] + 1).toString('ascii')
  }

  return thisControl
}


