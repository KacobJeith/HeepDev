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
    clientID: ReadClientID(buffer.slice(it + 1,it + 5)),
    packetBytes: packetBytes[0]
  };


  console.log('Encountered OP: ', buffer[it]);

  it += 5;
  var thisBlockData = buffer.slice(it, it + buffer[it] + 1);

  if (thisBlock.op == 0x01){
    // Client Data
    thisBlock.version = ReadFirmwareVersion(thisBlockData);

  } else if (thisBlock.op == 0x02) {
    // Controls
    thisBlock.control = ReadControl(thisBlockData);

  } else if (thisBlock.op == 0x03) {
    // Vertex
    thisBlock.vertex = ReadVertex(thisBlockData);
    thisBlock.vertex.txClientID = thisBlock.clientID;

  } else if (thisBlock.op == 0x04) {
    // Icon ID
    thisBlock.iconName = ReadIconID(thisBlockData);

  } else if (thisBlock.op == 0x05) {
    //Custom Icon Drawing
    thisBlock.iconData = ReadIconCustom(thisBlockData);

  } else if (thisBlock.op == 0x06) {
    //Client Name
    thisBlock.clientName = ReadClientName(thisBlockData);

  } else if (thisBlock.op == 0x07) {
    //FrontEnd Position
    thisBlock.position = ReadPosition(thisBlockData);

  } else if (thisBlock.op == 0x08) {
    //ClientIP

  } else {
    return false
  }

  it += CalculateNextIterator(byteIndicatorBytes, thisBlock.packetBytes);
  return [it, thisBlock]
}

export var ReadClientID = (buffer) => {
  // it is the counter at the OP Code

  var clientID =  ((buffer[0] << 24) >>> 0) + 
                  ((buffer[1] << 16) >>> 0) +
                  ((buffer[2] <<  8) >>> 0) + 
                  ( buffer[3]);

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

 export var ReadPosition = (thisBlockData) => {
  var thisPosition = {
    left: 0,
    top: 0
  }

  thisPosition.left = ((thisBlockData[1] << 8) >>> 0) + thisBlockData[2];
  thisPosition.top = ((thisBlockData[3] << 8) >>> 0) + thisBlockData[4];

  return thisPosition
 }

 export var ReadClientName = (thisBlockData) => {
  return thisBlockData.slice(1).toString('ascii')
 }

 export var ReadIconID = (thisBlockData) => {
  var iconName = 'none';
  if (thisBlockData[1] == 1){
    iconName = 'light-bulb';
  } else if (thisBlockData[1] == 2) {
    iconName = 'switch';
  } else if (thisBlockData[1] == 3) {
    iconName = 'outlet';
  } else if (thisBlockData[1] == 4) {
    iconName = 'power-button';
  } else if (thisBlockData[1] == 5) {
    iconName = 'cuckoo-clock';
  }

  return iconName;
 }

 export var ReadIconCustom = (thisBlockData) => {
  return thisBlockData.slice(1).toString('ascii');
 }

 export var ReadVertex = (thisBlockData) => {
  var thisVertex = {
    rxClientID: ReadClientID(thisBlockData.slice(1, 5)),
    txControlID: thisBlockData[5],
    rxControlID: thisBlockData[6], 
    rxIP: thisBlockData.slice(7).join('.')
  };

  return thisVertex
 }


