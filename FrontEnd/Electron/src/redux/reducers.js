import { combineReducers } from 'redux'
import Immutable from 'immutable'
import { initialState } from '../index'
import * as actions from './actions'
import * as async from './async'
import * as utils from '../serverside/utilities/generalUtilities'
import * as auth from '../firebase/FirebaseAuth'
import * as database from '../firebase/FirebaseDatabase'
import reducersDesigner from './reducers_designer'

export default function(state = initialState, action) {
  switch (action.type) {
    case 'LOGIN' :

      setTimeout(() => {auth.handleLogin()}, 100);

      return state

    case 'UPDATE_WEBGL_STATUS':

      return Immutable.Map(state).set('webGLStatus', action.status).toJS()
      
    case 'LOGOUT':

      auth.logout();

      return initialState

    case 'LOGIN_STATUS' :

      return Immutable.Map(state).set('loginStatus', action.status).toJS()

    case 'LOAD_PROVIDER' :

      var newState = Immutable.Map(state.providers).set(action.provider.providerId, action.provider).toJS();

      return Immutable.Map(state).set('providers', newState).toJS()

    case 'UNLINK_PROVIDER' :

      var newState = Immutable.Map(state.providers).delete(action.providerId).toJS();

      return Immutable.Map(state).set('providers', newState).toJS()

    case 'ADD_DEVICE' : 

      var newState = Immutable.Map(state.devices_firebase).set(action.deviceID, action.device).toJS();

      return Immutable.Map(state).set('devices_firebase', newState).toJS()

    case 'ADD_PLACE' : 

      var newState = Immutable.Map(state.places).set(action.placeID, action.place).toJS();

      return Immutable.Map(state).set('places', newState).toJS()

    case 'ADD_GROUP' : 

      var newState = Immutable.Map(state.groups).set(action.groupID, action.group).toJS();

      return Immutable.Map(state).set('groups', newState).toJS()

    case 'CLAIM_DEVICE' :

      var deviceIdentity = Immutable.Map(state.devices[action.deviceID]).toJS();
      var deviceControlStruct = state.controls.controlStructure[action.deviceID];
      var controls = [];

      for (var i = 0; i < deviceControlStruct.inputs.length; i++) {
        var controlKey = deviceControlStruct.inputs[i];
        var thisControl = Immutable.Map(state.controls[controlKey]).toJS();
        controls.push(thisControl);
      }

      for (var i = 0; i < deviceControlStruct.outputs.length; i++) {
        var controlKey = deviceControlStruct.outputs[i];
        var thisControl = Immutable.Map(state.controls[controlKey]).toJS();
        controls.push(thisControl);
      }

      var device = {
        controls: controls,
        identity: deviceIdentity
      }

      setTimeout(() => {database.associateDeviceWithAccount(device)}, 100);

      return state

    case 'ADD_MEMORY_DUMP' :

      var newData = Immutable.Map(state.analytics).toJS();
      var pushPacket = action.MOP.analytics;
      pushPacket.deviceID = action.deviceID;
      var thisDeviceData = newData[action.deviceID.toString()];
      var analyticsDeviceList = Immutable.List(state.analyticsDeviceList).toJS();

      if (thisDeviceData != undefined) {

        var analyticsList = Immutable.List(thisDeviceData).push(pushPacket).toJS();
        var newDeviceData = Immutable.Map(state.analytics).set(action.deviceID.toString(), analyticsList).toJS();

        return Immutable.Map(state).set('analytics', newDeviceData).toJS();


      } else {
        console.log("Start analytics device");

        var analyticsList = Immutable.List([]).push(pushPacket).toJS();
        analyticsDeviceList.push(action.MOP.deviceID.toString());
        var newDeviceData = Immutable.Map(state.analytics).set(action.deviceID.toString(), analyticsList).toJS();

        return Immutable.Map(state).set('analytics', newDeviceData).set('analyticsDeviceList', analyticsDeviceList).set('displayingAnalytics', action.deviceID.toString()).toJS();

      }

    case 'ADD_MEMORY_DUMP_BATCH' :

      var newData = Immutable.Map(state.analytics).toJS();

      newData[action.deviceID] = action.MOParray;


      var analyticsDeviceList = Immutable.List(state.analyticsDeviceList).toJS();

      analyticsDeviceList.indexOf(action.deviceID) === -1 ? analyticsDeviceList.push(action.deviceID) : console.log("This item already exists");

      return Immutable.Map(state).set('analytics', newData).set('analyticsDeviceList', analyticsDeviceList).set('displayingAnalytics', action.deviceID.toString()).toJS();


    case 'SELECT_DEVICE_FOR_ANALYTICS' :

      return Immutable.Map(state).set('displayingAnalytics', action.deviceID).toJS()

      






//<----------------------------------------------------------------------------------------------------------------------------------->

    case 'OVERWRITE_WITH_SERVER_DATA':

      return Immutable.Map(state).set('devices', action.fromServer.devices)
                                 .set('analytics', action.fromServer.analytics)
                                 .set('positions', action.fromServer.positions)
                                 .set('controls', action.fromServer.controls)
                                 .set('vertexList', action.fromServer.vertexList)
                                 .set('icons', action.fromServer.icons)
                                 .set('deviceWiFiCreds', action.fromServer.deviceWiFiCreds).toJS()
    case 'STORE_URL':  
      
      return Immutable.Map(state).set('url', action.url).toJS()

    case 'ADD_ICON':

      console.log('Adding: ', action.icon);
      var newState = Immutable.Map(state.icons).set(action.deviceID, action.icon).toJS();

      return Immutable.Map(state).set('icons', newState).toJS();

    case 'SELECT_OUTPUT':

      var newState = Immutable.Map(state.vertexList).set('selectedOutput', {txDeviceID: action.txDeviceID, txControlID: action.txControlID}).toJS();
      return Immutable.Map(state).set('vertexList', newState).toJS();

    case 'ADD_VERTEX':

      var vertex = {...state.vertexList.selectedOutput, rxControlID: action.rxControlID,
                                                        rxIP: action.rxIP,
                                                        rxDeviceID: action.rxDeviceID};
      
      async.sendVertexToServer(vertex);

      var newVertex = {txDeviceID: state.vertexList.selectedOutput.txDeviceID,
                       txControlID: state.vertexList.selectedOutput.txControlID,
                       rxDeviceID: action.rxDeviceID, 
                       rxControlID: action.rxControlID,
                       rxIP: action.rxIP}

      var newVertexName = utils.nameVertex(newVertex);

      var newState = Immutable.Map(state.vertexList).set(newVertexName, newVertex).toJS();

      //CONTROL CHANGES
      var newStateControls = Immutable.Map(state.controls).toJS();

      console.log("STATE CONTROLS: ", newStateControls);
      var txName = utils.nameControl(state.vertexList.selectedOutput.txDeviceID, state.vertexList.selectedOutput.txControlID);
      var rxName = utils.nameControl(action.rxDeviceID, action.rxControlID);

      newStateControls.connections[txName].push(rxName);

      return Immutable.Map(state).set('vertexList', newState).set('controls', newStateControls).toJS();

    case 'DELETE_VERTEX':

      async.sendDeleteVertexToServer(action.vertex);

      var newState = Immutable.Map(state.vertexList).delete(action.vertexID).toJS();

      //CONTROLS
      var newStateControls = Immutable.Map(state.controls).toJS();

      var txName = utils.getTxControlNameFromVertex(action.vertex);
      var rxName = utils.getRxControlNameFromVertex(action.vertex);

      var index = newStateControls.connections[txName].indexOf(rxName);

      if ( index != -1) {
        newStateControls.connections[txName].splice(index, 1);
      }

      return Immutable.Map(state).set('vertexList', newState).set('controls', newStateControls).toJS();

    case 'POSITION_DEVICE':
      var newState = Immutable.Map(state.positions).toJS();

      for (var id in state.positions[action.deviceID]){

        newState[action.deviceID][id] = {
          top: action.newPosition['top'] + state.positions[action.deviceID][id]['top'], 
          left: action.newPosition['left'] + state.positions[action.deviceID][id]['left']
        }
      }

      return Immutable.Map(state).set('positions', newState).toJS()


    case 'POSITION_DEVICE_SEND':
    
      var positionToSend = state.positions[action.deviceID].device;
      async.sendPositionToServer(action.deviceID, positionToSend);

      return state
   
    case 'UPDATE_CONTROL_VALUE':

      console.log(action)

      var newState = Immutable.Map(state.controls).toJS();
      var identifier = utils.nameControl(action.deviceID, action.controlID);

      console.log(identifier)
      console.log(newState[identifier])

      newState[identifier]['valueCurrent'] = action.newValue;
      async.sendValueToServer(action.deviceID, action.controlID, action.newValue);

      var connectedControl = '';
      for (var i = 0; i < newState.connections[identifier].length; i++){
        connectedControl = newState.connections[identifier][i];
        
        if (newState[connectedControl]) {
          newState[connectedControl]['valueCurrent'] = action.newValue;
          async.sendValueToServer(newState[connectedControl].deviceID, newState[connectedControl].controlID, action.newValue);
        }
      }

      return Immutable.Map(state).set('controls', newState).toJS()

    case 'REFRESH_FLOWCHART' :

      console.log("Refreshing Flowchart");

      async.refreshLocalDeviceState();

      return state

    case 'SAVE_NEW_PLACE' :

      setTimeout(() => {
        database.saveNewPlace(action.placeName, action.placeSSID, action.placeSSIDPassword)
      }, 100);

      return state

    case 'DELETE_PLACE_FROM_FIREBASE' :

      setTimeout(() => {
        database.deletePlace(action.placeID)
      }, 1000);

      return state

    case 'DELETE_PLACE':

      var newState = Immutable.Map(state.places).delete(action.placeID).toJS();

      return Immutable.Map(state).set('places', newState).toJS()

    case 'START_LIVE_MODE': 
      var liveModeRef = async.startLiveMode();

      return Immutable.Map(state).set('liveModeReference', liveModeRef).toJS();
                                  
    case 'STOP_LIVE_MODE': 

      async.stopLiveMode(state.liveModeReference);

      return Immutable.Map(state).set('liveModeReference', null).toJS();

    case 'SET_DETAILS_DEVICE_ID' :

      return Immutable.Map(state).set('detailsPanelDeviceID', action.deviceID).toJS()

    case 'SEND_WIFI_CRED_TO_DEVICE' :
      var newState = Immutable.Map(state.deviceWiFiCreds).toJS();

      const ssid = state.places[action.placeKey].networks.wifi.ssid;
      const password = state.places[action.placeKey].networks.wifi.password;

      if (newState[action.deviceID] == undefined) {
        newState[action.deviceID] = {}
      }
      
      newState[action.deviceID][ssid] = true;

      async.sendWifiCredsToServer(action.deviceID, ssid, password);

      return Immutable.Map(state).set('deviceWiFiCreds', newState).toJS();

    default:
      console.log('Passed through first Switch');
  }

  const builderStartingState = Immutable.Map(state.designer).toJS();
  const builderState = reducersDesigner(builderStartingState, action, state);

  if (builderState !== builderStartingState) {
    return  Immutable.Map(state).set('designer', builderState).toJS()
  }

  return state

}
