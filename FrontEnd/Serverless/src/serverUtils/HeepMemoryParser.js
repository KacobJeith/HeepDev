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

  if (buffer[it] == 1){
    // Client Data
    thisBlock.version = ReadFirmwareVersion(thisBlockData);

  } else if (thisBlock.op == 2) {
    // Controls
    thisBlock.control = ReadControl(thisBlockData);

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
    return false
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

var ReadFirmwareVersion = (thisBlockData) => { // OP 1
  return thisBlockData[1] 
}

var ReadControl = (thisBlockData) => { // OP 2
  console.log(thisBlockData)

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


