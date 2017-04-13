//Client
export const positionClient = (clientID, newPosition) => ({
  type: 'POSITION_CLIENT',
  clientID,
  newPosition
})

export const sendPositionToServer = (clientID, newPosition, url) => ({
  type: 'POSITION_CLIENT_SEND',
  clientID,
  newPosition,
  url
})

//Icons
export const addIcon = (clientID, icon) => ({
  type: 'ADD_ICON',
  clientID,
  icon
})

//Control
export const updateControlValue = (clientID, controlID, newValue, url) => ({
  type: 'UPDATE_CONTROL_VALUE',
  clientID, 
  controlID, 
  newValue,
  url
})

//URL
export const storeURL = (url) => ({
  type: 'STORE_URL',
  url
})


//Vertex
export const addVertex = (destinationID, inputName, IPAddress, url) => ({
  type: 'ADD_VERTEX',
  destinationID, 
  inputName,
  IPAddress, 
  url
})

export const deleteVertex = (vertexID, vertex) => ({
  type: 'DELETE_VERTEX',
  vertexID,
  vertex
})

export const selectOutput = (sourceID, outputName) => ({
  type: 'SELECT_OUTPUT',
  sourceID, 
  outputName
})

