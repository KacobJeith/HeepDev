import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import Immutable from 'immutable'
import { createStore, applyMiddleware } from 'redux'
import reducers from './redux/reducers'
// import reducers_classic from './redux/reducers_classic'
import App from './components/App'
import thunk from 'redux-thunk'
import * as auth from './firebase/FirebaseAuth'
import $ from 'jquery'
import { composeWithDevTools } from 'redux-devtools-extension';
import * as actions_classic from './redux/actions_classic'

import loading from './assets/heepwink3_gradient.mov';

const startState = {
  scrollPosition: 0,
  webGLStatus: false,
  loginStatus: false,
  providers: {},
  devices_firebase:{},
  places: {},
  groups: {},

  devices: {deviceArray: []},
  positions: {},
  controls: {controlStructure:{}, connections: {}},
  vertexList: {},
  icons: {},
  url: ''
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

  $.ajax({
    url: url,
    cache: false,
    success: (data) => {
      console.log(data);
      console.log(window.location.origin);

      data.url = window.location.origin;

      var immutableMap = Immutable.Map(data);

      console.log(data);

      store.dispatch(actions_classic.overwriteFromServer(data));

      
    },
    error: (xhr, status, err) => {
      console.error(url, status, err.toString());
      }
    });
}

loadDevicesFromServer(window.location.origin.concat('/api/findDevices'));
