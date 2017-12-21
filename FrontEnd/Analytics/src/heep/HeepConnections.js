import os from 'os' 
import * as HAPIParser from './HAPIMemoryParser'
import * as iconUtils from '../utilities/iconUtilities'
import * as generalUtils from '../utilities/generalUtilities'
import * as byteUtils from '../utilities/byteUtilities'

var masterState = {
  devices: {deviceArray: []},
  positions: {},
  controls: {controlStructure:{}, connections: {}},
  vertexList: {},
  icons: {},
  url: ''
};

export var GetCurrentMasterState = () => {
  return masterState
}

export var ResetMasterState = () => {
  masterState = {
    devices: {deviceArray: []},
    positions: {},
    controls: {controlStructure:{}},
    vertexList: {},
    icons: {},
    url: ''
  };

  return masterState
}

export var ConsumeMemoryDump = (data) => {
  console.log('Stringified Data: ', data.toString());
  console.log('Raw inbound Data: ', data);
  
  var HeepResponse = HAPIParser.ReadHeepResponse(data);

  if (HeepResponse != false){
    if (HeepResponse.op == 0x0F) {
      //Memory Dump
      AddMemoryChunksToMasterState(HeepResponse.memory);

    } else if ( HeepResponse.op == 0x10) {
      //Success
      console.log('Heep Device SUCCESS with a HAPI message: ', HeepResponse.message);

    } else if (HeepResponse.op == 0x11){
      //Error 
      console.log('Heep Device ERROR with an unHAPI message: ', HeepResponse.message);
    } else {
      console.error('Did not receive a known Response Code from Heep Device');
    }
  } else {
    console.error('Heep Response Invalid');
  }
}

var AddMemoryChunksToMasterState = (heepChunks) => {
  console.log(heepChunks)

  for (var i = 0; i < heepChunks.length; i++) {
    try {
      if (heepChunks[i].op == 1){
        AddDevice(heepChunks[i]);

      } else if (heepChunks[i].op == 2){
        AddControl(heepChunks[i]);

      } else if (heepChunks[i].op == 3){
        AddVertex(heepChunks[i].vertex)
        
      } else if (heepChunks[i].op == 4){
        SetIconFromID(heepChunks[i]);

      } else if (heepChunks[i].op == 5){
        SetCustomIcon(heepChunks[i]);
        
      } else if (heepChunks[i].op == 6){
        SetDeviceName(heepChunks[i])

      } else if (heepChunks[i].op == 7){
        SetDevicePosition(heepChunks[i])
        
      } else if (heepChunks[i].op == 8){
        
      }
    } catch (err) {
      console.log(err.toString());
    }
    
  }
}

var AddDevice = (heepChunk, IPAddress) => {
  var deviceID = heepChunk.deviceID;
  var deviceName = 'unset';
  var iconName = 'none';
  iconUtils.SetDeviceIconFromString(deviceID, deviceName, iconName);

  masterState.devices[deviceID] = {
    DeviceID: deviceID,
    IPAddress: IPAddress,
    DeviceName: deviceName
  }

  if( masterState.devices.deviceArray.indexOf(deviceID) == -1){
    masterState.devices.deviceArray.push(deviceID);
  }

  SetNullPosition(deviceID);
  masterState.controls.controlStructure[deviceID] = {inputs: [], outputs: []};
  masterState.icons = iconUtils.GetIconContent();
}

var SetDeviceName = (heepChunk) => {
  masterState.devices[heepChunk.deviceID].DeviceName = heepChunk.deviceName;
  if ((heepChunk.deviceID in masterState.icons)){
    var currentIcon = masterState.icons[heepChunk.deviceID];
  } 
  else {
    var currentIcon = 'none';
  }
  iconUtils.SetDeviceIconFromString(heepChunk.deviceID, heepChunk.deviceName, currentIcon);
  masterState.icons = iconUtils.GetIconContent()
}

var AddControl = (heepChunk) => {
  // Transition this to use new ControlID throughout frontend 
  var tempCtrlName = generalUtils.nameControl(heepChunk.deviceID, heepChunk.control.ControlID) 
  masterState.controls[tempCtrlName] = heepChunk.control;
  masterState.controls[tempCtrlName].deviceID = heepChunk.deviceID;
  var currentIndex = SetControlStructure(heepChunk.deviceID, tempCtrlName)

  masterState.positions[heepChunk.deviceID][tempCtrlName] = {top: 0, left: 0};
  masterState.controls.connections[tempCtrlName] = [];
}

var SetIconFromID = (heepChunk) => {
  var deviceName = masterState.devices[heepChunk.deviceID].deviceName;
  iconUtils.SetDeviceIconFromString(heepChunk.deviceID, deviceName, heepChunk.iconName);
  masterState.icons = iconUtils.GetIconContent()
}

var SetCustomIcon = (heepChunk) => {
  iconUtils.setCustomIcon(heepChunk.deviceID, heepChunk.iconData);
}

var SetNullPosition = (deviceID) => {
  
  var newPosition = {
    device: {top: 0, left: 0}
  }

  masterState.positions[deviceID] = newPosition;
}

var SetControlStructure = (deviceID, controlID) => {

  if ( masterState.controls[controlID]['ControlDirection'] == 0){
    var inputs = masterState.controls.controlStructure[deviceID].inputs;
    inputs.push(controlID);
    return inputs.length

  } else {
    var outputs = masterState.controls.controlStructure[deviceID].outputs;
    outputs.push(controlID);
    return outputs.length

  }

}

var AddVertex = (vertex) => {
  var vertexName = generalUtils.nameVertex(vertex);
  var txControl = generalUtils.getTxControlNameFromVertex(vertex);
  var rxControl = generalUtils.getRxControlNameFromVertex(vertex);
  masterState.vertexList[vertexName] = vertex;
  masterState.controls.connections[txControl].push(rxControl);

}

var DeleteVertex = (vertex) => {
  delete masterState.vertexList[generalUtils.nameVertex(vertex)];

  var txControl = generalUtils.getTxControlNameFromVertex(vertex);
  var rxControl = generalUtils.getRxControlNameFromVertex(vertex);
  var index = masterState.controls.connections[txControl].indexOf(rxControl)
  if ( index != -1) {
    masterState.controls.connections[txControl].splice(index, 1);
  }

}


