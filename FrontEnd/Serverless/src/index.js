import 'babel-polyfill'
import Immutable from 'immutable'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import heepApp from './reducers/reducers'
import App from './containers/AppContainer'
import * as Actions from './actions/actions'
import thunk from 'redux-thunk';
import $ from 'jquery'


function loadClientsFromServer(url) {

  $.ajax({
    url: url,
    cache: false,
    success: (data) => {

      data.url = window.location.protocol.concat('//', window.location.hostname,':3001');

      var immutableMap = Immutable.Map(data);
      const store = createStore(heepApp, data, applyMiddleware(thunk));

      render(
        <Provider store={store}>
          <App/>
        </Provider>,
        document.getElementById('root')
      )
    },
    error: function(xhr, status, err) {
      console.error(url, status, err.toString());
      }
    });
}

loadClientsFromServer(window.location.protocol.concat('//', window.location.hostname,':3001').concat('/api/clients'));


