import firebase from 'firebase'
import * as setup from '../index.jsx'
import * as actions from '../redux/actions'

import * as HAPI from '../heep/HeepConnections.js'


export const retrieveAnalyticData = () => {
	console.log("Reading Data")

	var userID = 'waxjVMMDemMCfPrKKnXKMlhRofo1';

	firebase.database().ref('/users/' + userID + '/devices').on('value', (snapshot) => {

		snapshot.forEach((childSnapshot) => {
	      readDeviceData(childSnapshot.key);
  		});
	});
}

const readDeviceData = (deviceID) => {

	firebase.database().ref('/devices/' + deviceID).on('value', function(snapshot) {

		var buffer = base64ToArrayBuffer(snapshot.val());
		var data = HAPI.ConsumeMemoryDump(buffer);
		
		var analytics = {};

		for (var i = 0; i < data.memory.length; i++) {
			var MOP = data.memory[i];

			if (MOP.op == 31) { 

				setup.store.dispatch(actions.addMemoryDump(MOP.deviceID, MOP.analytics.controlID, MOP));
			}
		}

	})
}

const base64ToArrayBuffer = (base64) => {
    var binary_string =  window.atob(base64);
    var len = binary_string.length;
    var bytes = new Uint8Array( len );
    for (var i = 0; i < len; i++)        {
        bytes[i] = binary_string.charCodeAt(i);
    }

    return bytes;
}




