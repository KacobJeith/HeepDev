
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

export const createCheckout = (checkoutID) => ({
	type: 'CREATE_CHECKOUT',
	checkoutID
})

export const setCheckout = (checkoutID) => ({
	type: 'SET_CHECKOUT',
	checkoutID
})

export const addProductToCart = (productID) => ({
	type: 'ADD_PRODUCT_TO_CART',
	productID
})

export const updateProductQuantity = (lineItemID, newQuantity) => ({
	type: 'UPDATE_QUANTITY_IN_CART',
	lineItemID,
	newQuantity
})

export const removeProductFromCart = (variantID) => ({
	type: 'REMOVE_PRODUCT_FROM_CART',
	variantID
})

export const saveCartLocally = (cart) => ({
	type: 'SAVE_CART_LOCALLY',
	cart
})


export const saveNewPlace = (placeName, placeSSID, placeSSIDPassword) => ({
	type: 'SAVE_NEW_PLACE',
	placeName, 
	placeSSID, 
	placeSSIDPassword
})

export const deletePlaceFromAccount = (placeID) => ({
	type: 'DELETE_PLACE_FROM_FIREBASE',
	placeID
})

export const deletePlace = (placeID) => ({
	type: 'DELETE_PLACE',
	placeID
})

export const updateCartContext = (variantID, placeID) => ({
	type: 'UPDATE_CART_CONTEXT',
	variantID, 
	placeID
})

export const pushCartToFulfillmentQueue = () => ({
	type: 'PUSH_CART_TO_QUEUE'
})

export const saveQueueToRedux = (queue) => ({
	type: 'SAVE_QUEUE', 
	queue
})

export const saveUser = (uid, userData) => ({
	type: 'SAVE_USER',
	uid, 
	userData
})

export const saveCheckoutForQueue = (checkoutID, checkoutData) => ({
	type: 'SAVE_CHECKOUT_FOR_QUEUE',
	checkoutID, 
	checkoutData
})

export const downloadSourceForVariant = (variantID, placeID) => ({
	type: 'DOWNLOAD_SOURCE',
	variantID, 
	placeID
})
