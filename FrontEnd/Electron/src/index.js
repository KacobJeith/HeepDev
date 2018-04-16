import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import Immutable from 'immutable'
import { createStore, applyMiddleware } from 'redux'
import reducers from './redux/reducers'
import App from './components/App'
import thunk from 'redux-thunk'
import $ from 'jquery'
import { composeWithDevTools } from 'redux-devtools-extension';
import * as actions_classic from './redux/actions_classic'

import { persistStore, persistReducer } from 'redux-persist'
import storage from 'redux-persist/lib/storage' // defaults to localStorage for web and AsyncStorage for react-native
import { PersistGate } from 'redux-persist/integration/react'

import 'firebaseui/dist/firebaseui.css';

require('./service-worker-registration.js');

const startState = {
  webGLStatus: false,
  loginStatus: false,
  providers: {},
  devices_firebase:{},
  places: {},
  groups: {},

  devices: {},
  deviceWiFiCreds: {},
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
  },

  liveModeReference: null,
  detailsPanelDeviceID: null,
  accessPoints: {},
  accessPointData: {
    connectedTo: null,
    currentlyConnecting: null,
    failedAttempt: null,
    deviceID: null
  } 
}

export const initialState = Immutable.Map(startState);

const persistConfig = {
  key: 'root',
  storage,
}
 
const persistedReducer = persistReducer(persistConfig, reducers)
export const store = createStore(persistedReducer, startState, composeWithDevTools(applyMiddleware(thunk)));

let persistor = persistStore(store);

import(/* webpackChunkName: "firebaseAuth" */ './firebase/FirebaseAuth').then((auth) => auth.initializeFirebase());

render(
  <Provider store={store}>
    <PersistGate loading={null} persistor={persistor}>
      <App/>
    </PersistGate>
  </Provider>,
  document.getElementById('root')
)

// var loadDevicesFromServer = (url) => {
//   console.log("Loading from server...");

//   $.ajax({
//     url: url,
//     cache: false,
//     success: (data) => {
      
//       try {
//         data.url = window.location.origin;
//         var immutableMap = Immutable.Map(data);
//         store.dispatch(actions_classic.mergeFromServer(data));

//       } 
//       catch (err) {
//         console.log("Running on Dev server, cannot update url or feed classic data");
//       }
      
//     },
//     error: (xhr, status, err) => {
//       console.error(url, status, err.toString());
//       }
//     });
// }

// var timeoutRef = setInterval(() => loadDevicesFromServer(window.location.origin.concat('/api/findDevices')), 1000)

// setTimeout(() => clearTimeout(timeoutRef), 5000);

