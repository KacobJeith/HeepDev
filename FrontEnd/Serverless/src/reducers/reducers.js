import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import $ from 'jquery'
import * as actions from '../actions/actions'
import * as async from './async'

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

      return Immutable.Map(state).set('selectedOutput', {txClientID: action.txClientID, txControlID: action.txControlID}).toJS();
    case 'ADD_VERTEX':

      var vertex = {...state.selectedOutput, rxControlID: action.rxControlID,
                                             rxIP: action.rxIP,
                                             rxClientID: action.rxClientID};
      console.log('ThisVertex: ', vertex)
      async.sendVertexToServer(action.url, vertex);

      return Immutable.Map(state).set(state.selectedOutput.txClientID + '.' + state.selectedOutput.txControlID + '->' + action.rxClientID + '.' + action.rxControlID, 
                                      {txClientID: state.selectedOutput.txClientID,
                                       txControlID: state.selectedOutput.txControlID,
                                       rxClientID: action.rxClientID, 
                                       rxControlID: action.rxControlID,
                                       rxIP: action.rxIP}).toJS();
    case 'DELETE_VERTEX':
      var newMap = Immutable.Map(state).delete(action.vertexID).toJS();
      console.log(Object.keys(newMap));

      async.sendDeleteVertexToServer(action.url, action.vertexID, action.vertex);

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
    case 'POSITION_CLIENT_SEND':
      var positionToSend = state[action.clientID].client;
      async.sendPositionToServer(action.clientID, positionToSend, action.url);
      return state

    default:
      return state
  }
}

function controls(state = initialState, action) {
  switch (action.type) {
    case 'SELECT_OUTPUT':
      return Immutable.Map(state).set('selectedOutput', {rxControlID: action.rxControlID, txControlID: action.txControlID}).toJS();
    case 'UPDATE_CONTROL_VALUE':
      console.log(state)
      var a = {...state};
      var identifier = action.clientID + '.' + action.controlID;
      a[identifier]['CurCtrlValue'] = action.newValue;
      async.sendValueToServer(action.clientID, action.controlID, action.newValue, action.url);

      return {...state}
    case 'ADD_VERTEX':
      var newState = Immutable.Map(state).toJS();
      var txName = newState.selectedOutput.txClientID + '.' + newState.selectedOutput.txControlID;
      var rxName = action.rxClientID +'.'+ action.rxControlID;

      newState.connections[txName].push(rxName)
      return newState
    case 'DELETE_VERTEX':

      var newState = Immutable.Map(state).toJS();
      var txName = action.vertex.txClientID +'.'+ action.vertex.txControlID;
      var rxName = action.vertex.rxControlID +'.'+ action.vertex.rxControlID;

      var index = newState.connections[txName].indexOf(rxName)
      if ( index != -1) {
        newState.connections[txName].splice(index, 1);
      }

      return newState
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


