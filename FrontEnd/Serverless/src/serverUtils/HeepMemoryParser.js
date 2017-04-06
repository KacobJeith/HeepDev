

export var ExtractMiscMemory = (splitString, it) => {

    var remainingData = splitString.slice(it);
    var version = remainingData[0];
    var miscMemory = remainingData[1];

    if (VerifyMiscMemory(miscMemory)){
      MemoryCrawl(miscMemory);
    } else {
      console.error('Miscellaneous Memory could not be understood.')
    }
}

var MemoryCrawl = (miscMemory) => {
  var it = 1;
  console.log('memoryarraylength: ', miscMemory.length)
  for (var i = 0 ; i < miscMemory.length; i++){
    console.log('read: ', miscMemory[i].charCodeAt());
  }

  while (it < miscMemory.length) {
    if (miscMemory[it].charCodeAt() == 1){ 
      //console.log("OP CODE: 1, IT: ", it)
      it = ReadXYPosition(miscMemory, it);
    } 
    else if (miscMemory[it].charCodeAt() == 6) {
      //console.log("OP CODE: 6, IT: ", it)
      it = ReadClientName(miscMemory, it);
    }
    else {
      //console.log('Read OP Code: ', miscMemory[it].charCodeAt());
      //it = ReadMiscellaneousClientID(miscMemory, it);
      it = it + 1;
    }
  }

}

var ReadXYPosition = (miscMemory, it) => {
  var clientName = ReadMiscellaneousClientID(miscMemory, it);

  return it + 8
}

var ReadClientName = (miscMemory, it) => {
  var clientName = ReadMiscellaneousClientID(miscMemory, it);

  return it + 5
}

var ReadMiscellaneousClientID = (miscMemory, it) => {
  var clientIDmiscMemory = (miscMemory[it + 1].charCodeAt() << 24) + 
                           (miscMemory[it + 2].charCodeAt() << 16) +
                           (miscMemory[it + 3].charCodeAt() << 8) + 
                           (miscMemory[it + 3].charCodeAt());

  console.log('FINAL: ', clientIDmiscMemory);

  return clientIDmiscMemory
}


var VerifyMiscMemory = (memoryDump) => {
  return memoryDump[0].charCodeAt() == 77
}

