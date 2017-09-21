
export const addSignal = (name) => ({
  type: 'ADD_SIGNAL',
  name
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

export const populateShopify = (products) => ({
	type: 'POPULATE_SHOPIFY',
	products
})

export const logout = () => ({
	type: 'LOGOUT'
})