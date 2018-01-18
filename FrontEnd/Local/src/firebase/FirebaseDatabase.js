import firebase from 'firebase'
import * as firebaseAuth from './FirebaseAuth'
import * as setup from '../index'
import * as actions from '../redux/actions'


export const readUserData = (user) => {

	// firebase.database().ref('/users/' + user.uid + '/devices').on('child_added', function(snapshot) {
		
	// 	retrieveDevices(snapshot);
	// })

	firebase.database().ref('/users/' + user.uid + '/devices').on('value', function(snapshot) {
		retrieveDevices(snapshot);
	})

	// firebase.database().ref('/users/' + user.readUserSignalsuid + '/places').on('child_added', function(snapshot) {
		
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

export const downloadLegacyProfilePicture = (uid, terminal = false, ext = '.png') => {

	firebase.database().ref('/users/' + uid + '/profile/heepID').once('value', function(snapshot) {

		firebase.storage().ref("users").child(String(snapshot.val()) + '/profile' + ext).getDownloadURL().then(function(url) {
			
			firebaseAuth.updateUserProfile({photoURL: url});

		}).catch(function(error) {
			
			if (terminal) {
				console.log("Could not find this image");
			} else {
				downloadLegacyProfilePicture(uid, true, '.jpg');
			}
		});

	});
}

export const associateLegacyProfileName = (uid) => {

	firebase.database().ref('/users/' + uid + '/profile/name').once('value', function(snapshot) {

		firebaseAuth.updateUserProfile({displayName: snapshot.val()});

	});
}

export const updatePlaceName = (placeID, name) => {

	firebase.database().ref('places/' + placeID + '/name').set(name);
}

export const updateGroupName = (groupID, name) => {

	firebase.database().ref('groups/' + groupID + '/name').set(name);
}


