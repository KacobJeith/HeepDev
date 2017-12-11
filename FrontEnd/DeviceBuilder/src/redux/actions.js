export const updateNumControls = (num) => ({
	type: 'UPDATE_NUM_CONTROLS',
	num
})

export const updateDeviceName = (name) => ({
	type: 'UPDATE_DEVICE_NAME',
	name
})

export const updateSystemType = (system) => ({
	type: 'UPDATE_SYSTEM_TYPE',
	system
})

export const updateControlName = (controlID, name) => ({
	type: 'UPDATE_CONTROL_NAME',
	controlID, 
	name
})

export const updateControlDirection = (controlID, direction) => ({
	type: 'UPDATE_CONTROL_DIRECTION',
	controlID, 
	direction
})

export const updateControlType = (controlID, controlType) => ({
	type: 'UPDATE_CONTROL_TYPE',
	controlID, 
	controlType
})

export const packageSourceFiles = () => ({
	type: 'PACKAGE_SOURCE_FILES'
})
