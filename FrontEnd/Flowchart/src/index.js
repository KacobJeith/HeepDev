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
  vertexList: [],
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

function nameVertex(sourceID, outputName, destinationID, inputName) {
    return sourceID + '.' + outputName + '->' + destinationID + '.' + inputName;
  }

var prepareInitialState = (data) => {

  console.log('Original clientList.json: ', data);

  initialState.clients.clientArray = [];
  // Loop through the Clients
  for (var index = 0; index < data.length;  index++){
    var id = data[index].ClientID;
    initialState.clients.clientArray.push(id);
    initialState.clients[id] = data[index];
    initialState.positions[id] = {client: data[index].Position};

    const controlsTemplate = {inputs: {controlsArray:[]}, outputs: {controlsArray:[]}};

    //controls, indexed by clientID, indexed by inputs/outputs, with an array representing the list of each 
    var controlPosition = 0;

    // Loop through the Controls
    for (var controlIndex = 0; controlIndex < data[index].ControlList.length;  controlIndex++){
      var newClientControls = {...controlsTemplate};
      var controlName = data[index].ControlList[controlIndex]['ControlName'];

      // Handle Control Inputs and Outputs
      if (data[index].ControlList[controlIndex]['ControlDirection'] == 0){

        newClientControls['inputs'][controlName] = data[index].ControlList[controlIndex];
        newClientControls['inputs']['controlsArray'].push(controlName)
        initialState.positions[id][controlName] = {top: initialState.positions[id]['client']['top'] + 45 + 1.5 + 25/2 + 55*(newClientControls['inputs']['controlsArray'].length - 1), 
                                                  left: initialState.positions[id]['client']['left'] + 10};
      }
      else {

        newClientControls['outputs'][controlName] = data[index].ControlList[controlIndex];
        newClientControls['outputs']['controlsArray'].push(controlName);
        initialState.positions[id][controlName] = {top: initialState.positions[id]['client']['top'] + 45 + 1.5 + 25/2 + 55*(newClientControls['outputs']['controlsArray'].length - 1), 
                                                  left: initialState.positions[id]['client']['left'] + 250};
      }
      initialState.controls[id] = newClientControls;
    }

    // Loop through the Vertexes and populate the Vertex Lists
    for (var vertexIndex = 0; vertexIndex < data[index].VertexList.length;  vertexIndex++){
      initialState.vertexList.push(data[index].VertexList[vertexIndex]);
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


