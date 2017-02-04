import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import heepApp from './reducers/reducers'
import App from './containers/AppContainer'
import $ from 'jquery'


var initialState = {
  clientList: {},
  vertexList: {},
  url: ''
};

function loadClientsFromServer(url) {
      $.ajax({
      url: url,
      cache: false,
      success: (data) => {
        prepareInitialState(data);

      },
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
      }
    });

}

var prepareInitialState = (data) => {

  initialState = {...initialState,
                  clientList: data};

  // add all the vertexes

  const store = createStore(heepApp, initialState);
  console.log(initialState);

  render(
    <Provider store={store}>
      <App/>
    </Provider>,
    document.getElementById('root')
  )

}


loadClientsFromServer(window.location.protocol.concat('//', window.location.hostname,':3001').concat('/api/clients'))


