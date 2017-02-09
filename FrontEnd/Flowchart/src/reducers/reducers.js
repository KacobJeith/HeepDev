import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import * as actions from '../actions/actions'

const initialState = Immutable.Map({
  clients: {},
  positions: {},
  vertexList: {},
  controls: {},
  icons: {},
  url: ''
})

function clients(state = initialState, action) {
  switch (action.type) {
    default:
      return state
  }
}

function url(state = initialState, action) {
  switch (action.type) {
    case 'STORE_URL':      
      return (action.url)
    default:
      return state
  }
}

function icons(state = initialState, action) {
  switch (action.type) {
    case 'ADD_ICON':
      console.log('Adding: ', action.icon);
      return Immutable.Map(state).set(action.clientID, action.icon).toJS();
    default:
      return state
  }
}


function vertexList(state = initialState, action) {
  switch (action.type) {
    case 'SELECT_OUTPUT':
      return Immutable.Map(state).set('selectedOutput', {sourceID: action.sourceID, outputName: action.outputName}).toJS();
    case 'ADD_VERTEX':
      return Immutable.Map(state).set(state.selectedOutput.sourceID + '.' + state.selectedOutput.outputName + '->' + action.destinationID + '.' + action.inputName, 
                                      {sourceID: state.selectedOutput.sourceID,
                                       outputName: state.selectedOutput.outputName,
                                       destinationID: action.destinationID, 
                                       inputName: action.inputName,
                                       destinationIP: action.IPAddress}).toJS();
    case 'DELETE_VERTEX':
      var newMap = Immutable.Map(state).delete(action.vertexID).toJS();
      console.log(Object.keys(newMap));
      return Immutable.Map(state).delete(action.vertexID).toJS();
    default:
      return state
  }
}

function positions(state = initialState, action) {
  switch (action.type) {
    case 'POSITION_CLIENT':
      var newState = {};
      for (var id in state[action.clientID]){
        newState[id] = {top: action.newPosition['top'] + state[action.clientID][id]['top'], 
                        left: action.newPosition['left'] + state[action.clientID][id]['left']}
      }

      return {...state,
              [action.clientID]: newState
            }
    default:
      return state
  }
}

function controls(state = initialState, action) {
  switch (action.type) {
    case 'SELECT_OUTPUT':
      return Immutable.Map(state).set('selectedOutput', {sourceID: action.sourceID, outputName: action.outputName}).toJS();
    case 'UPDATE_CONTROL_VALUE':
      var a = {...state};
      a[action.clientID + '.' + action.controlID]['CurCtrlValue'] = action.newVal;
      return {...state}
    default:
      return state
  }
}


const heepApp = combineReducers({
	clients,
  vertexList,
  positions,
  controls,
  icons,
  url
})

export default heepApp


