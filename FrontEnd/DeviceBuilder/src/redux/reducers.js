import { combineReducers } from 'redux'
import Immutable from 'immutable'
import { initialState } from '../index.jsx'
import {packageSourceFiles} from '../utilities/PackageSourceFiles'
import { sys_phy_files } from '../utilities/SystemPHYCompatibilities'

export default function(state = initialState, action) {
  switch (action.type) {
    case 'UPDATE_DEVICE_NAME' :

      	return Immutable.Map(state).set('deviceName', action.name).toJS()

    case 'UPDATE_NUM_CONTROLS' :

    	var controls = Immutable.List(state.controls).toJS();

    	if (controls.length < action.num) {
    		for (var i = controls.length; i < action.num; i++) {
    			controls.push(initialControlState(i));
    		}
    	}

    	var newMaster = Immutable.Map(state)
    	.set('numControls', action.num)
    	.set('controls', controls)
    	.toJS()

      	return newMaster

    case 'UPDATE_SYSTEM_TYPE' :

    	return Immutable.Map(state)
        .set('systemType', action.system)
        .set('physicalLayer', sys_phy_files[action.system][0])
        .toJS()

    case 'UPDATE_CONTROL_NAME' :

    	var controlID = action.controlID - 1;

    	var newState = Immutable.List(state.controls).toJS();
		newState[controlID]['controlName'] = action.name;

    	return Immutable.Map(state).set('controls', newState).toJS()

    case 'UPDATE_CONTROL_DIRECTION' :

		var controlID = action.controlID - 1;

		var controlDirection = 0;

    	if (action.direction == "output") {
    		controlDirection = 1;
    	}

    	var newState = Immutable.List(state.controls).toJS();
		newState[controlID]['controlDirection'] = controlDirection;


    	return Immutable.Map(state).set('controls', newState).toJS()

    case 'UPDATE_CONTROL_TYPE' :
    	var controlType = 0;

        console.log(action);

    	if (action.controlType == "Range") {
    		controlType = 1;
    	}

    	var newState = Immutable.List(state.controls).toJS();
        console.log(newState);

		newState[action.controlID]['controlType'] = controlType;

    	return Immutable.Map(state).set('controls', newState).toJS()

    case 'PACKAGE_SOURCE_FILES' :

    	var deviceDetails = {
    		deviceName: state.deviceName,
    		systemType: state.systemType,
    		numControls: state.numControls
    	}

    	var currentControls = Immutable.List(state.controls).toJS();

    	var writeTheseControls = currentControls;

    	if (currentControls.length != state.numControls) {
    		writeTheseControls.splice(state.numControls, state.controls.length - state.numControls);
    	}
    	
    	packageSourceFiles(deviceDetails, writeTheseControls);

    	return state

    case 'UPDATE_CONTROL_MAX' :

    	var newState = Immutable.List(state.controls).toJS();
		newState[action.controlID]['highValue'] = parseInteger(action.controlMax);

    	return Immutable.Map(state).set('controls', newState).toJS()

    case 'UPDATE_CONTROL_MIN' :

    	var newState = Immutable.List(state.controls).toJS();
		newState[action.controlID]['lowValue'] = parseInteger(action.controlMin);

    	return Immutable.Map(state).set('controls', newState).toJS()

    case 'ADD_NEW_CONTROL' :

        var controls = Immutable.List(state.controls).toJS();
        controls.push(initialControlState(controls.length));

        var newMaster = Immutable.Map(state)
        .set('numControls', state.numControls + 1)
        .set('controls', controls)
        .toJS()

        console.log(newMaster.controls);

        return newMaster

    case 'UPDATE_PHYSICAL_LAYER' : 

        return Immutable.Map(state).set('physicalLayer', action.physicalLayer).toJS()

    case 'UPDATE_SSID' : 

        return Immutable.Map(state).set('ssid', action.ssid).toJS()

    case 'UPDATE_SSID_PASSWORD' :
        
        return Immutable.Map(state).set('ssidPassword', action.ssidPassword).toJS()

    default:
      return state
  }
}

const initialControlState = (controlID) => ({
    controlName: 'default',
    controlID: controlID,
    controlDirection: 0,
    controlType: 0,
    highValue: 100,
    lowValue: 0,
    curValue: 0
})

const parseInteger = (input) => {
	var setInt = parseInt(input);
    	
	if (isNaN(setInt)) {
		return 0;
	} else {
		return setInt
	}
}
