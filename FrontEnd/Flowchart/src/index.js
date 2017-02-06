import 'babel-polyfill'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import heepApp from './reducers/reducers'
import App from './containers/AppContainer'
import $ from 'jquery'


var initialState = {
  clients: {},
  positions: {},
  controls: {},
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

  console.log('Original clientList.json: ', data);

  initialState.clients.clientArray = [];
  for (var index = 0; index < data.length;  index++){
    var id = data[index].ClientID;
    initialState.clients.clientArray.push(id);
    initialState.clients[id] = data[index];
    initialState.positions[id] = data[index].Position;

    const controlsTemplate = {inputs: {controlsArray:[]}, outputs: {controlsArray:[]}};

    //controls, indexed by clientID, indexed by inputs/outputs, with an array representing the list of each 
    for (var controlIndex = 0; controlIndex < data[index].ControlList.length;  controlIndex++){
      var newClientControls = {...controlsTemplate};
      var controlName = data[index].ControlList[controlIndex]['ControlName'];

      if (data[index].ControlList[controlIndex]['ControlDirection'] == 0){

        newClientControls['inputs'][controlName] = data[index].ControlList[controlIndex];
        newClientControls['inputs']['controlsArray'].push(controlName)
      }
      else {

        newClientControls['outputs'][controlName] = data[index].ControlList[controlIndex];
        newClientControls['outputs']['controlsArray'].push(controlName);
      }

      initialState.controls[id] = newClientControls;
    }
  }
  
  console.log('Initial Store: ', initialState);

  const store = createStore(heepApp, initialState);

  render(
    <Provider store={store}>
      <App/>
    </Provider>,
    document.getElementById('root')
  )

}


loadClientsFromServer(window.location.protocol.concat('//', window.location.hostname,':3001').concat('/api/clients'))


