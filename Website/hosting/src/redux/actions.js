
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
