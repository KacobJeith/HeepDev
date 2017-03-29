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


var initialState = {
  clients: {},
  positions: {},
  controls: {controlStructure:{}},
  vertexList: {},
  icons: {},
  url: window.location.protocol.concat('//', window.location.hostname,':3001')
};

var counter = 0;
//var thisIcon = '';

function loadClientsFromServer(url) {
  console.log('requesting data')

      $.ajax({
      url: url,
      cache: false,
      success: (data) => {

        console.log('Got the data!');
        console.log(data);

        for (var client in initialState.clients){
          if (client != 'clientArray'){
            store.dispatch(Actions.addIcon(client, grabSVGIcon(initialState.clients[client]['IconName'])))
          }
        }


        //prepareInitialState(data);
        data.url = window.location.protocol.concat('//', window.location.hostname,':3001');
        initialState = data;
        grabClientIcons();

      },
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
      }
    });

}

function nameVertex(vertex) {
    return vertex['sourceID'] + '.' + vertex['outputName'] + '->' + vertex['destinationID'] + '.' + vertex['inputName'];
  }

function nameControl(clientID, controlName) {
  return clientID +  '.' + controlName;
}

function grabSVGIcon(client, iconName) {

    var svgurl = initialState.url.concat('/static/assets/') + 'default' + '/' + iconName + '.svg';
    
    $.get(svgurl, (svg) => {
      var parsed = $(svg);
      var thisIcon = parsed[parsed.length-1];
    }, 'text').done( (thisIcon) => {

        if (counter < Object.keys(initialState.clients).length - 2){
          
          initialState.icons[client] = thisIcon;
          counter++;
        }
        else {

          initialState.icons[client] = thisIcon;
          console.log('Initial State: ', initialState)
          var immutableMap = Immutable.Map(initialState);
          const store = createStore(heepApp, initialState, applyMiddleware(thunk));

          render(
            <Provider store={store}>
              <App/>
            </Provider>,
            document.getElementById('root')
          )
        } 

      }
    );
}

var grabClientIcons = () => {
  console.log('grabbing clients');
  for (var client in initialState.clients){
    if (client != 'clientArray'){
      grabSVGIcon(client, initialState.clients[client]['IconName']);
    }
  }
}

loadClientsFromServer(window.location.protocol.concat('//', window.location.hostname,':3001').concat('/api/clients'))


