import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import Immutable from 'immutable'
import { createStore, applyMiddleware } from 'redux'
import reducers from './redux/reducers'
import App from './components/App'
import thunk from 'redux-thunk'
import * as auth from './firebase/FirebaseAuth'
import $ from 'jquery'
import { composeWithDevTools } from 'redux-devtools-extension';
import * as actions_classic from './redux/actions_classic'



const startState = {
  webGLStatus: false,
  loginStatus: false,
  providers: {},
  devices_firebase:{},
  places: {},
  groups: {},

  devices: {
    deviceArray: []
  },
  positions: {},
  controls: {
    controlStructure:{}, 
    connections: {}
  },
  vertexList: {},
  icons: {},
  url: '',
  analytics: {},
  analyticsDeviceList: [],
  displayingAnalytics: '',

  designer: {
    deviceName: '',
    numControls: 0,
    physicalLayer: 'wifi',
    selectedPlace: 'Enter New WiFi',
    ssid: '',
    ssidPassword: '',
    systemType: 'ESP8266',
    iconSelected: 1,
    selectingIcon: false,
    controls: {}
  }
}

export const initialState = Immutable.Map(startState)

export const store = createStore(reducers, startState, composeWithDevTools(applyMiddleware(thunk)));

auth.initializeFirebase();

render(
  <Provider store={store}>
    <App/>
  </Provider>,
  document.getElementById('root')
)

var loadDevicesFromServer = (url) => {
  console.log("Loading from server...");

  $.ajax({
    url: url,
    cache: false,
    success: (data) => {
      
      try {
        data.url = window.location.origin;
        var immutableMap = Immutable.Map(data);
        store.dispatch(actions_classic.overwriteFromServer(data));

      } 
      catch (err) {
        console.log("Running on Dev server, cannot update url or feed classic data");
      }
      
    },
    error: (xhr, status, err) => {
      console.error(url, status, err.toString());
      }
    });
}

var timeoutRef = setInterval(() => loadDevicesFromServer(window.location.origin.concat('/api/findDevices')), 1000)

setTimeout(() => clearTimeout(timeoutRef), 3000);