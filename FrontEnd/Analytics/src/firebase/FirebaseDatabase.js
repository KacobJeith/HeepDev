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

		console.log("Read: ", snapshot.val());

		var buffer = base64ToArrayBuffer(snapshot.val());
		var data = HAPI.ConsumeMemoryDump(buffer);
		
		setup.store.dispatch(actions.addMemoryDump(snapshot.key, buffer));

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




