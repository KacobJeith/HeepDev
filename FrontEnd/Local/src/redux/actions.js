
export const addDevice = (deviceID, device) => ({
  type: 'ADD_DEVICE',
  deviceID, 
  device
})

export const addPlace = (placeID, place) => ({
  type: 'ADD_PLACE',
  placeID, 
  place
})

export const addGroup = (groupID, group) => ({
  type: 'ADD_GROUP',
  group, 
  groupID
})

export const logout = () => ({
	type: 'LOGOUT'
})

export const updateWebGLStatus = (status) => ({
	type: 'UPDATE_WEBGL_STATUS',
	status
})

export const updateLoginStatus = (status) => ({
	type: 'LOGIN_STATUS',
	status
})

export const loadLinkedAccount = (provider) => ({
	type: 'LOAD_PROVIDER',
	provider
})

export const unlinkAccount = (providerId) => ({
	type: 'UNLINK_PROVIDER',
	providerId
})

export const initPaperSignals = () => ({
	type: 'INIT_PAPER_SIGNALS'
})

export const addMemoryDump = (deviceID, controlID, MOP) => ({
	type: 'ADD_MEMORY_DUMP',
	deviceID,
	controlID, 
	MOP
})

export const selectDeviceToDisplay = (deviceID) => ({
	type: 'SELECT_DEVICE_FOR_ANALYTICS',
	deviceID
})





