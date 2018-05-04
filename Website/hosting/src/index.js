import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import reducers from './redux/reducers'
import App from './components/App'
import thunk from 'redux-thunk'
import * as shopify from './shopify/Shopify'
import WebFont from 'webfontloader'

import { composeWithDevTools } from 'redux-devtools-extension';

 WebFont.load({
   google: {
     families: ['Pangolin']
   }
 });

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
  user: null
}

export const initialState = startState;
export const store = createStore(reducers, startState, composeWithDevTools(applyMiddleware(thunk)));

render(
  <Provider store={store}>
    <App/>
  </Provider>,

  document.getElementById('root')
);

// import(/* webpackChunkName: "firebaseAuth" */ './firebase/FirebaseAuth').then((auth) => auth.initializeFirebase());
shopify.InitializeShopify();
