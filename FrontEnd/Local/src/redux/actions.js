//Device
export const positionDevice = (deviceID, newPosition) => ({
  type: 'POSITION_DEVICE',
  deviceID,
  newPosition
})

export const sendPositionToServer = (deviceID, newPosition) => ({
  type: 'POSITION_DEVICE_SEND',
  deviceID,
  newPosition
})

//Icons
export const addIcon = (deviceID, icon) => ({
  type: 'ADD_ICON',
  deviceID,
  icon
})

//Control
export const updateControlValue = (deviceID, controlID, newValue) => ({
  type: 'UPDATE_CONTROL_VALUE',
  deviceID, 
  controlID, 
  newValue
})

//URL
export const storeURL = (url) => ({
  type: 'STORE_URL',
  url
})


//Vertex
export const addVertex = (rxDeviceID, rxControlID, rxIP) => ({
  type: 'ADD_VERTEX',
  rxDeviceID, 
  rxControlID,
  rxIP
})

export const deleteVertex = (vertexID, vertex) => ({
  type: 'DELETE_VERTEX',
  vertexID,
  vertex
})

export const selectOutput = (txDeviceID, txControlID) => ({
  type: 'SELECT_OUTPUT',
  txDeviceID, 
  txControlID
})

