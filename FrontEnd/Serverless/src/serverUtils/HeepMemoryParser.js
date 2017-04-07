export var MemoryCrawler = (buffer) => {
  var it = 0;
  var data = [];

  while (it < buffer.length) {
    var nextBlock = GetNextBlock(buffer, it);

    if (nextBlock == false){
      console.log('Encountered an un-implemented OP Code');
      return false
    } else {
      //console.log('nextBlock: ', nextBlock);
    }

    it = nextBlock[0];
    data.push(nextBlock[1]);
  }
  return data
}

var GetNextBlock = (buffer, it) => {
  var packetBytes = ReadSizeOfPacket(buffer, it);
  var byteIndicatorBytes = packetBytes[1];

  var thisBlock = {
    op: buffer[it],
    clientID: ReadClientID(buffer, it),
    packetBytes: packetBytes[0]
  };


  console.log('Encountered OP: ', buffer[it]);

  it += 5;
  var thisBlockData = buffer.slice(it, it + buffer[it] + 1);

  if (buffer[it] == 0x01){
    // Client Data
    thisBlock.version = ReadFirmwareVersion(thisBlockData);

  } else if (thisBlock.op == 0x02) {
    // Controls
    thisBlock.control = ReadControl(thisBlockData);

  } else if (thisBlock.op == 0x03) {
    // Vertex

  } else if (thisBlock.op == 0x04) {
    // Icon ID

  } else if (thisBlock.op == 0x05) {
    //Custom Icon Drawing

  } else if (thisBlock.op == 0x06) {
    //Client Name

  } else if (thisBlock.op == 0x07) {
    //FrontEnd Position

  } else if (thisBlock.op == 0x08) {
    //ClientIP

  } else {
    return false
  }

  it += CalculateNextIterator(byteIndicatorBytes, thisBlock.packetBytes);
  return [it, thisBlock]
}

export var ReadClientID = (buffer, it) => {
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

export var ReadFirmwareVersion = (thisBlockData) => { // OP 1
  return thisBlockData[1] 
}

export var ReadControl = (thisBlockData) => { // OP 2

  var thisControl = {
    ControlID: thisBlockData[1],
    ControlValueType: thisBlockData[2],
    ControlDirection: thisBlockData[3],
    LowValue: thisBlockData[4],
    HighValue: thisBlockData[5],
    CurCtrlValue: thisBlockData[6],
    ControlName: thisBlockData.slice(7).toString('ascii')
  }

  return thisControl
}


