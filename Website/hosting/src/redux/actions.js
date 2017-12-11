
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

export const populateShopify = (products) => ({
	type: 'POPULATE_SHOPIFY',
	products
})

export const logout = () => ({
	type: 'LOGOUT'
})

export const updateScrollPosition = (positionY) =>  ({
	type: 'SCROLL',
	positionY
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



/* <-------------------------------------------------------Paper Signals---------------------------------------------------------------------->*/




export const addSignal = (name, intent) => ({
  type: 'ADD_SIGNAL',
  name,
  intent
})

export const deleteSignal = (id) => ({
	type: 'DELETE_SIGNAL', 
	id
})

export const populateSignal = (id, content) => ({
	type: 'POP_SIGNAL',
	id,
  	content
})

export const storeFile = (filename, blob) => ({
	type: 'STORE_FILE',
	filename,
	blob
})

export const updateName = (signalId, name) => ({
	type: 'UPDATE_NAME',
	signalId, 
	name
})

export const storeIconURL = (iconName, url) => ({
	type: 'STORE_ICONURL',
	iconName, 
	url
})

export const storeIntentBackgroundURL = (intent, url) => ({
	type: 'STORE_INTENT_BACKGROUND_URL',
	intent, 
	url
})
