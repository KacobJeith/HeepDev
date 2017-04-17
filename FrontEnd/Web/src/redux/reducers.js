import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import * as actions from './actions'
import * as async from './async'
import * as utils from '../utilities/generalUtilities'

const initialState = Immutable.Map({
  devices: {},
  positions: {},
  vertexList: {},
  controls: {},
  icons: {},
  url: ''
})

function devices(state = initialState, action) {
  switch (action.type) {
    default:
      return state
  }
}

function url(state = initialState, action) {
  switch (action.type) {
    case 'STORE_URL':  
      async.saveURL(action.url);    
      return (action.url)
    default:
      return state
  }
}

function icons(state = initialState, action) {
  switch (action.type) {
    case 'ADD_ICON':
      console.log('Adding: ', action.icon);
      return Immutable.Map(state).set(action.deviceID, action.icon).toJS();
    default:
      return state
  }
}

function vertexList(state = initialState, action) {
  switch (action.type) {
    case 'SELECT_OUTPUT':

      return Immutable.Map(state).set('selectedOutput', {txDeviceID: action.txDeviceID, txControlID: action.txControlID}).toJS();
    case 'ADD_VERTEX':

      var vertex = {...state.selectedOutput, rxControlID: action.rxControlID,
                                             rxIP: action.rxIP,
                                             rxDeviceID: action.rxDeviceID};
      
      async.sendVertexToServer(vertex);

      var newVertex = {txDeviceID: state.selectedOutput.txDeviceID,
                       txControlID: state.selectedOutput.txControlID,
                       rxDeviceID: action.rxDeviceID, 
                       rxControlID: action.rxControlID,
                       rxIP: action.rxIP}

      var newVertexName = utils.nameVertex(newVertex);

      return Immutable.Map(state).set(newVertexName, newVertex).toJS();
    case 'DELETE_VERTEX':

      async.sendDeleteVertexToServer(action.vertex);

      return Immutable.Map(state).delete(action.vertexID).toJS();
    default:
      return state
  }
}

function positions(state = initialState, action) {
  switch (action.type) {
    case 'POSITION_DEVICE':
      var newState = Immutable.Map(state).toJS();
      for (var id in state[action.deviceID]){
        newState[action.deviceID][id] = {
          top: action.newPosition['top'] + state[action.deviceID][id]['top'], 
          left: action.newPosition['left'] + state[action.deviceID][id]['left']
        }
      }

      return newState
    case 'POSITION_DEVICE_SEND':
    
      var positionToSend = state[action.deviceID].device;
      async.sendPositionToServer(action.deviceID, positionToSend);
      return state

    default:
      return state
  }
}

function controls(state = initialState, action) {
  switch (action.type) {
    case 'SELECT_OUTPUT':
      return Immutable.Map(state).set('selectedOutput', {txDeviceID: action.txDeviceID, txControlID: action.txControlID}).toJS();
    case 'UPDATE_CONTROL_VALUE':

      var newState = Immutable.Map(state).toJS();
      var identifier = utils.nameControl(action.deviceID, action.controlID);
      newState[identifier]['CurCtrlValue'] = action.newValue;
      async.sendValueToServer(action.deviceID, action.controlID, action.newValue);

      var connectedControl = '';
      for (var i = 0; i < newState.connections[identifier].length; i++){
        connectedControl = newState.connections[identifier][i];
        newState[connectedControl]['CurCtrlValue'] = action.newValue;
        async.sendValueToServer(newState[connectedControl].deviceID, newState[connectedControl].ControlID, action.newValue);
      }

      return newState
    case 'ADD_VERTEX':
      var newState = Immutable.Map(state).toJS();
      var txName = utils.nameControl(newState.selectedOutput.txDeviceID, newState.selectedOutput.txControlID);
      var rxName = utils.nameControl(action.rxDeviceID, action.rxControlID);

      var theseConnections = newState.connections[txName].push(rxName);

      return newState
    case 'DELETE_VERTEX':

      var newState = Immutable.Map(state).toJS();

      var txName = utils.getTxControlNameFromVertex(action.vertex);
      var rxName = utils.getRxControlNameFromVertex(action.vertex);

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
	devices,
  vertexList,
  positions,
  controls,
  icons,
  url
})

export default heepApp


