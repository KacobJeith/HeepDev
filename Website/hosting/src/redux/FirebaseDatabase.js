import firebase from 'firebase'
import * as setup from '../index'
import * as actions from './actions'


export const readUserData = (user) => {

	firebase.database().ref('/users/' + user.uid + '/devices').on('child_added', function(snapshot) {
		
		retrieveDevices(snapshot);
	})

	firebase.database().ref('/users/' + user.uid + '/devices').on('value', function(snapshot) {
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

const readDevice = (deviceID) => {
	let dataFromFirebaseRef = firebase.database().ref('/devices/' + deviceID).on('value', function(deviceSnapshot) {

		setup.store.dispatch(actions.addDevice(deviceSnapshot.key, deviceSnapshot.val()));
	});
}

const retrievePlaces = (snapshot) => {
	snapshot.forEach( function(snapChild){
		readPlace(snapChild.key);
	});
}

const readPlace = (placeID) => {
	let dataFromFirebaseRef = firebase.database().ref('/places/' + placeID).on('value', function(placeSnapshot) {

		setup.store.dispatch(actions.addPlace(placeSnapshot.key, placeSnapshot.val()));
	});
}

