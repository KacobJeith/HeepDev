//Client
export const positionClient = (clientID, newPosition) => ({
  type: 'POSITION_CLIENT',
  clientID,
  newPosition
})

export const sendPositionToServer = (clientID, newPosition) => ({
  type: 'POSITION_CLIENT_SEND',
  clientID,
  newPosition
})

//Icons
export const addIcon = (clientID, icon) => ({
  type: 'ADD_ICON',
  clientID,
  icon
})

//Control
export const updateControlValue = (clientID, controlID, newValue) => ({
  type: 'UPDATE_CONTROL_VALUE',
  clientID, 
  controlID, 
  newValue
})

//URL
export const storeURL = (url) => ({
  type: 'STORE_URL',
  url
})


//Vertex
export const addVertex = (rxClientID, rxControlID, rxIP) => ({
  type: 'ADD_VERTEX',
  rxClientID, 
  rxControlID,
  rxIP
})

export const deleteVertex = (vertexID, vertex) => ({
  type: 'DELETE_VERTEX',
  vertexID,
  vertex
})

export const selectOutput = (txClientID, txControlID) => ({
  type: 'SELECT_OUTPUT',
  txClientID, 
  txControlID
})

