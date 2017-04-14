
export var ConvertIPAddressToByteArray = (stringIP) => {
  var split = stringIP.split('.');
  var byteArray = [];
  for (var i = 0; i < split.length; i++){
    byteArray.push(parseInt(split[i]));
  }

  return byteArray
}

export var GetClientIDAsByteArray = (value) => {
  var clientID = GetValueAsFixedSizeByteArray(value, 4);
  return clientID
}

export var GetValueAsFixedSizeByteArray = (value, size) => {
  var valueBytes = GetByteArrayFromValue(value);
  var backfill = size - valueBytes.length;
  for (var i = 0; i < backfill; i++){
    valueBytes.unshift(0x00);
  }
  
  return valueBytes
}

export var GetByteArrayFromValue = (value) => {
  var byteArray = [];
  var numBytes = GetNecessaryBytes(value);

  for (var i = 0; i < numBytes; i++){ 
    var hexVal = value % 256;
    byteArray.unshift(hexVal);
    value = value >> 8;
  }

  return byteArray
}

export var GetNecessaryBytes = (value) => {
  var numBytes = 1;
  value = value >> 8;

  while (value > 0) {
    numBytes += 1;
    value = value >> 8;
  }

  return numBytes
}
