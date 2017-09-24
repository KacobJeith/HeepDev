import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import reducers from './redux/reducers'
import App from './components/App'
import thunk from 'redux-thunk'
import * as database from './redux/firebase'
import * as shopify from './redux/Shopify'

import loading from './assets/heepwink3_gradient.mov';

export const store = createStore(reducers, applyMiddleware(thunk));

database.initializeFirebase();
shopify.InitializeShopify();

render(
  <Provider store={store}>
    <App/>
  </Provider>,

  document.getElementById('root')
);

