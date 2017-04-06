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
  var thisBlock = [it, null];
  if (buffer[it] == 1){
    // Client Data

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
  var clientID = (buffer[it + 1] << 24) + 
                 (buffer[it + 2] << 16) +
                 (buffer[it + 3] <<  8) + 
                 (buffer[it + 4]);

  return [it, clientID]
}

var ReadXYPosition = (buffer, it) => {
  var clientName = ReadClientID(buffer, it);

  return it + 8
}

var ReadClientName = (buffer, it) => {
  var clientName = ReadClientID(buffer, it);

  return it + 5
}

