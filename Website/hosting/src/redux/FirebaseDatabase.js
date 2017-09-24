import firebase from 'firebase'
import * as setup from '../index'
import * as actions from './actions'


export const readUserData = (user) => {

	firebase.database().ref('/users/' + user.uid + '/devices').on('child_added', function(snapshot) {
		
		retrieveDevices(snapshot);
	})

	// firebase.database().ref('/users/' + user.uid + '/places').on('child_added', function(snapshot) {
		
	// 	retrievePlaces(snapshot);
	// })

	// firebase.database().ref('/users/' + user.uid + '/places').on('value', function(snapshot) {
		
	// 	retrievePlaces(snapshot);
	// })

	// firebase.database().ref('/users/' + user.uid + '/groups').on('child_added', function(snapshot) {
		
	// 	retrieveGroups(snapshot);
	// })

	// firebase.database().ref('/users/' + user.uid + '/groups').on('value', function(snapshot) {
		
	// 	retrieveGroups(snapshot);
	// })
}

const retrieveDevices = (snapshot) => {
	snapshot.forEach( function(snapChild){
		readDevice(snapChild.key);
	});
}

const readSignal = (signalId) => {
	let dataFromFirebaseRef = firebase.database().ref('/signals/' + signalId).on('value', function(signalSnapshot) {
		
		setup.store.dispatch(actions.addDevice(signalSnapshot.key, signalSnapshot.val()));
	});
}

