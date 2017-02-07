//Client
export const positionClient = (clientID, newPosition) => ({
  type: 'POSITION_CLIENT',
  clientID,
  newPosition
})

//Control
export const updateControlValue = (clientID, direction, controlID, newVal) => ({
  type: 'UPDATE_CONTROL_VALUE',
  clientID, 
  direction,
  controlID, 
  newVal
})

//URL
export const storeURL = (url) => ({
  type: 'STORE_URL',
  url
})


//Vertex
export const addVertex = (vertex) => ({
  type: 'ADD_VERTEX',
  vertex
})

export const deleteVertex = (vertexID) => ({
  type: 'DELETE_VERTEX',
  vertexID
})

