import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import * as actions from '../actions/actions'

const initialState = Immutable.Map({
  clients: {},
  positions: {},
  vertexList: {},
  controlStructure: {},
  controls: {},
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


function vertexList(state = initialState, action) {
  switch (action.type) {
    case 'ADD_VERTEX':
      return (action.vertex)
    case 'DELETE_VERTEX':
      var newMap = Immutable.Map(state).delete(action.vertexID).toJS();
      console.log(Object.keys(newMap));
      return Immutable.Map(state).delete(action.vertexID).toJS();
    case 'UPDATE_CONTROL_VALUE':
      return state
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
    case 'UPDATE_CONTROL_VALUE':
      var direction = action.direction == 0 ? 'inputs' : 'outputs'; 
      var a = {...state};
      console.log(a);
      a[action.clientID + '.' + action.controlID]['CurCtrlValue'] = action.newVal;
      return {...state, a}
    default:
      return state
  }
}

function controlStructure(state = initialState, action) {
  switch (action.type) {
    default:
      return state
  }
}


const heepApp = combineReducers({
	clients,
  vertexList,
  positions,
  controls,
  controlStructure,
  url
})

export default heepApp


