import { combineReducers } from 'redux'
import Immutable from 'immutable'
import { initialState } from '../index.jsx'
import {packageSourceFiles} from '../utilities/PackageSourceFiles'

export default function(state = initialState, action) {
  switch (action.type) {
    case 'UPDATE_DEVICE_NAME' :

      	return Immutable.Map(state).set('deviceName', action.name).toJS()

    case 'UPDATE_NUM_CONTROLS' :

    	var controls = Immutable.List(state.controls).toJS();

    	if (controls.length < action.num) {
    		for (var i = controls.length; i < action.num; i++) {
    			controls.push(initialControlState());
    		}
    	}

    	var newMaster = Immutable.Map(state)
    	.set('numControls', action.num)
    	.set('controls', controls)
    	.toJS()

      	return newMaster

    case 'UPDATE_SYSTEM_TYPE' :

    	return Immutable.Map(state).set('systemType', action.system).toJS()

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
    	var controlID = action.controlID - 1;
    	var controlType = 0;

    	if (action.controlType == "Range") {
    		controlType = 1;
    	}

    	var newState = Immutable.List(state.controls).toJS();
		newState[controlID]['controlType'] = controlType;

    	return Immutable.Map(state).set('controls', newState).toJS()

    case 'PACKAGE_SOURCE_FILES' :

    	var deviceDetails = {
    		deviceName: state.deviceName,
    		systemType: state.systemType,
    		numControls: state.numControls
    	}

    	packageSourceFiles(deviceDetails, state.controls);

    	return state

    default:
      return state
  }
}


const initialControlState = () => ({
    controlName: 'default',
    controlID: 0,
    controlDirection: 0,
    controlType: 1,
    highValue: 100,
    lowValue: 0,
    curValue: 0
})
