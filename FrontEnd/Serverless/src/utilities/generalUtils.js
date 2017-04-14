
export var nameVertex = (vertex) => {
    return vertex['txClientID'] + '.' + vertex['txControlID'] + '->' + vertex['rxClientID'] + '.' + vertex['rxControlID'];
}

export var nameControl = (clientID, controlName) => {
  return clientID +  '.' + controlName;
}

export var getTxControlNameFromVertex = (vertex) => {
  return nameControl(vertex.txClientID, vertex.txControlID)
}

export var getRxControlNameFromVertex = (vertex) => {
  return nameControl(vertex.rxClientID, vertex.rxControlID)
}


export var joinAddress = (gateway, ip) => {
  return gateway.join('.') + '.' + ip.toString()
}

