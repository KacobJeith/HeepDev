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
      $.ajax({
      url: url,
      cache: false,
      success: (data) => {

        for (var client in initialState.clients){
          if (client != 'clientArray'){
            store.dispatch(Actions.addIcon(client, grabSVGIcon(initialState.clients[client]['IconName'])))
          }
        }


        prepareInitialState(data);

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
      var controlKey = nameControl(data[index]['ClientID'], data[index].ControlList[controlIndex]['ControlName']);
      var controlName = data[index].ControlList[controlIndex]['ControlName'];
      initialState.controls[controlKey] =  {...data[index].ControlList[controlIndex], connectedControls: []};

      // Handle Control Inputs and Outputs
      if (data[index].ControlList[controlIndex]['ControlDirection'] == 0){

        //newClientControls['inputs'][controlName] = data[index].ControlList[controlIndex];
        newClientControls['inputs']['controlsArray'].push(controlKey)
        initialState.positions[id][controlName] = {top: initialState.positions[id]['client']['top'] + 45 + 1.5 + 25/2 + 55*(newClientControls['inputs']['controlsArray'].length - 1), 
                                                  left: initialState.positions[id]['client']['left'] + 10};
      }
      else {

        //newClientControls['outputs'][controlName] = data[index].ControlList[controlIndex];
        newClientControls['outputs']['controlsArray'].push(controlKey);
        initialState.positions[id][controlName] = {top: initialState.positions[id]['client']['top'] + 45 + 1.5 + 25/2 + 55*(newClientControls['outputs']['controlsArray'].length - 1), 
                                                  left: initialState.positions[id]['client']['left'] + 250};
      }

      initialState.controls.controlStructure[id] = newClientControls;
    }

    // Loop through the Vertexes and populate the Vertex Lists
    var vertexName = '';
    for (var vertexIndex = 0; vertexIndex < data[index].VertexList.length;  vertexIndex++){
      vertexName = nameVertex(data[index].VertexList[vertexIndex])
      initialState.vertexList[vertexName] = data[index].VertexList[vertexIndex];

      var sourceID = data[index].VertexList[vertexIndex]['sourceID'];
      var outputName = data[index].VertexList[vertexIndex]['outputName'];
      initialState.controls[nameControl(sourceID, outputName)]['connectedControls'].push(
        nameControl(data[index].VertexList[vertexIndex]['destinationID'], data[index].VertexList[vertexIndex]['inputName'])
        );

    }
  }

  for (var client in initialState.clients){
    if (client != 'clientArray'){
      grabSVGIcon(client, initialState.clients[client]['IconName']);
    }
  }
}


loadClientsFromServer(window.location.protocol.concat('//', window.location.hostname,':3001').concat('/api/clients'))


