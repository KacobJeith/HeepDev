import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import heepApp from './reducers/reducers'
import App from './containers/AppContainer'
import $ from 'jquery'

var initialState = {
  clientList: [],
  vertexList: [],
  url: ''
};

function loadClientsFromServer(url) {
      $.ajax({
      url: url,
      cache: false,
      success: (data) => {
        initialState = {...initialState,
                        clientList: data};

        
		const store = createStore(heepApp, initialState);
		console.log(store.getState());

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

loadClientsFromServer(window.location.protocol.concat('//', window.location.hostname,':3001').concat('/api/clients'))


