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
// import $ from 'jquery'

import loading from './assets/heepwink3_gradient.mov';

const startState = {
  scrollPosition: 0,
  webGLStatus: false,
  loginStatus: false,
  providers: {},
  devices: {},
  places: {},
  groups: {}
}

export const initialState = Immutable.Map(startState)

export const store = createStore(reducers, startState, applyMiddleware(thunk));

auth.initializeFirebase();

render(
  <Provider store={store}>
    <App/>
  </Provider>,

  document.getElementById('root')
);

