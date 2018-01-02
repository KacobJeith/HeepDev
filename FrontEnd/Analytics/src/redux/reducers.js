import { combineReducers } from 'redux'
import Immutable from 'immutable'
// import 'babel-polyfill'
import { initialState } from '../index.jsx'

export default function(state = initialState, action) {
  switch (action.type) {
    case 'ADD_MEMORY_DUMP' :

    	var pushPacket = action.MOP.analytics;
      pushPacket.deviceID = action.deviceID;

      var analyticsList = Immutable.List(state.data).push(pushPacket).toJS();

      return Immutable.Map(state).set('data', analyticsList).toJS();

    case 'SET_MAX_TIME_RANGE' :

    	return Immutable.Map(state).set('maxTime', action.time).toJS();

    case 'SET_MIN_TIME_RANGE' :

    	return Immutable.Map(state).set('mInTime', action.time).toJS();

    default:
      return state
  }
}
