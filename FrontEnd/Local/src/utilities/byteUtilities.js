
export var ConvertIPAddressToByteArray = (stringIP) => {
  var split = stringIP.split('.');
  var byteArray = [];
  for (var i = 0; i < split.length; i++){
    byteArray.push(parseInt(split[i]));
  }

  return byteArray
}

export var GetDeviceIDAsByteArray = (value) => {
  var deviceID = GetValueAsFixedSizeByteArray(value, 4);
  return deviceID
}

export var GetValueAsFixedSizeByteArray = (value, size) => {
  var valueBytes = GetByteArrayFromValue(value, size);
  var backfill = size - valueBytes.length;
  for (var i = 0; i < backfill; i++){
    valueBytes.unshift(0x00);
  }
  
  return valueBytes
}

export var GetByteArrayFromValue = (value, numBytes = GetNecessaryBytes(value)) => {
  var byteArray = [];

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
