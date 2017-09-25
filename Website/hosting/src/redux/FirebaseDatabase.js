import firebase from 'firebase'
import * as setup from '../index'
import * as actions from './actions'


export const readUserData = (user) => {

	// firebase.database().ref('/users/' + user.uid + '/devices').on('child_added', function(snapshot) {
		
	// 	retrieveDevices(snapshot);
	// })

	firebase.database().ref('/users/' + user.uid + '/devices').on('value', function(snapshot) {
		retrieveDevices(snapshot);
	})

	// firebase.database().ref('/users/' + user.uid + '/places').on('child_added', function(snapshot) {
		
	// 	// retrievePlaces(snapshot);
	// })

	firebase.database().ref('/users/' + user.uid + '/places').on('value', function(snapshot) {
		
		retrievePlaces(snapshot);
	})

	// firebase.database().ref('/users/' + user.uid + '/groups').on('child_added', function(snapshot) {
		
	// 	retrieveGroups(snapshot);
	// })

	firebase.database().ref('/users/' + user.uid + '/groups').on('value', function(snapshot) {
		
		retrieveGroups(snapshot);
	})
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

	snapshot.forEach( function(snapChild) {
		readPlace(snapChild.key);
	});
}

const readPlace = (placeID) => {
	let dataFromFirebaseRef = firebase.database().ref('/places/' + placeID).on('value', function(placeSnapshot) {

		setup.store.dispatch(actions.addPlace(placeSnapshot.key, placeSnapshot.val()));
	});
}

const retrieveGroups = (snapshot) => {
	snapshot.forEach( function(snapChild){
		readGroup(snapChild.key);
	});
}

const readGroup = (groupID) => {
	let dataFromFirebaseRef = firebase.database().ref('/groups/' + groupID).on('value', function(groupSnapshot) {

		setup.store.dispatch(actions.addGroup(groupSnapshot.key, groupSnapshot.val()));
	});
}

export const downloadGroupImage = (groupID) => {
	firebase.storage().ref("groups").child(String(groupID) + '/background.png').getDownloadURL().then(function(url) {
		
		document.getElementById(String(groupID)).src = url;

	}).catch(function(error) {
		
		console.log("Could not find this image");
	});
}

