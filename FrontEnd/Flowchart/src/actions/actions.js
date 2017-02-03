//Client
export const positionClient = (clientID, newPosition) => ({
  type: 'POSITION_CLIENT',
  clientID,
  newPosition
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

export const deleteVertex = (vertex) => ({
  type: 'DELETE_VERTEX',
  vertex
})

export const positionVertex = (vertex, newPosition) => ({
  type: 'POSITION_VERTEX',
  vertex,
  newPosition
})

