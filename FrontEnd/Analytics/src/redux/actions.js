export const addMemoryDump = (deviceID, controlID, MOP) => ({
	type: 'ADD_MEMORY_DUMP',
	deviceID,
	controlID, 
	MOP
})

export const setMinTimeRange = (time) => ({
	type: 'SET_MIN_TIME_RANGE',
	time
})

export const setMaxTimeRange = (time) => ({
	type: 'SET_MAX_TIME_RANGE',
	time
})
