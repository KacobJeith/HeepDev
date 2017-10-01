import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import Immutable from 'immutable'
import { createStore, applyMiddleware } from 'redux'
import reducers from './redux/reducers'
import App from './components/App'
import thunk from 'redux-thunk'
import * as auth from './redux/FirebaseAuth'
import * as shopify from './redux/Shopify'

import loading from './assets/heepwink3_gradient.mov';

const startState = {
  shopify: {},
  scrollPosition: 0,
  webGLStatus: false,
  loginStatus: false,
  providers: {},
  devices: {},
  places: {},
  groups: {},
  signals: {},
  files: {},
  iconURLs: {
    Weather: "",
    ShortsOrPants: "",
    Timer: "",
    NFL: "",
    CryptoCurrency: "",
    Umbrella: "",
    RocketLaunch: "",
    alt: ""
  },
  intentBackgrounds: {
    Weather: "",
    ShortsOrPants: "",
    Timer: "",
    NFL: "",
    CryptoCurrency: "",
    Umbrella: "",
    RocketLaunch: ""
  }
}

export const initialState = Immutable.Map(startState)

export const store = createStore(reducers, startState, applyMiddleware(thunk));

auth.initializeFirebase();
shopify.InitializeShopify();

render(
  <Provider store={store}>
    <App/>
  </Provider>,

  document.getElementById('root')
);

