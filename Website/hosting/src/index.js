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
import * as shopify from './shopify/Shopify'
import { composeWithDevTools } from 'redux-devtools-extension';
import ReactGA from 'react-ga';

require('./service-worker-registration.js');

const startState = {
  shopify: {},
  scrollPosition: 0,
  webGLStatus: false,
  loginStatus: false,
  checkoutID: null,
  itemsInCart: 0,
  shoppingCart: {
    lineItems:[]
  },
  cartContext:{},
  providers: {},
  devices: {},
  places: {},
  groups: {},
  signals: {},
  files: {},
  collections: {},
  svgText: 'starting',
}

export const initialState = Immutable.Map(startState)

export const store = createStore(reducers, startState,  composeWithDevTools(applyMiddleware(thunk)));

auth.initializeFirebase();
shopify.InitializeShopify();

render(
  <Provider store={store}>
    <App/>
  </Provider>,

  document.getElementById('root')
);
