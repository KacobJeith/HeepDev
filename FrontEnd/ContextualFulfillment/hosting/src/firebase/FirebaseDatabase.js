import firebase from 'firebase'
import * as firebaseAuth from './FirebaseAuth'
import * as setup from '../index'
import * as actions from '../redux/actions'
// import * as HAPI from '../serverside/heep/HAPIMemoryParser.js'


export const readUserData = (user) => {

	firebase.database().ref('/users/' + user.uid + '/devices').on('value', function(snapshot) {
		retrieveDevices(snapshot);
	})

	firebase.database().ref('/users/' + user.uid + '/places').on('value', function(snapshot) {
		
		retrievePlaces(snapshot);
	})


	firebase.database().ref('/users/' + user.uid + '/groups').on('value', function(snapshot) {
		
		retrieveGroups(snapshot);
	})

	firebase.database().ref('/users/' + user.uid + '/store').on('value', function(snapshot) {
		
		setup.store.dispatch(actions.setCheckout(snapshot.val().checkoutID));
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

export const readPlace = (placeID) => {
	let dataFromFirebaseRef = firebase.database().ref('/places/' + placeID).on('value', function(placeSnapshot) {

		if (placeSnapshot.val()) {
			
			setup.store.dispatch(actions.addPlace(placeSnapshot.key, placeSnapshot.val()));

		}  else {
			setup.store.dispatch(actions.deletePlace(placeSnapshot.key));
		}
		
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

export const saveNewPlace = (placeName, placeSSID, placeSSIDPassword) => {
	const placeRef = firebase.database().ref('/places').push();

	const placeObject = {
		name: placeName,
		placeID:  placeRef.key,
		networks: {
			wifi:{
				ssid: placeSSID,
				password: placeSSIDPassword
			}
		}
	}

	const placeUserObject = {
		numDevices: 0,
		placeID:  placeRef.key,
		radius: 100,
		x: 120,
		y:120
	}

	var user = firebaseAuth.currentUser();

	firebase.database().ref('/places/' + placeRef.key).set(placeObject);
	firebase.database().ref('/users/' + user.uid + '/places/' + placeRef.key).set(placeUserObject);

	console.log('Saved new Place: ', placeName);
}

export const deletePlace = (placeID) => {

	var user = firebaseAuth.currentUser();

	firebase.database().ref('/places/' + placeID).remove();
	firebase.database().ref('/users/' + user.uid + '/places/' + placeID).remove();

	console.log('Deleted Place: ', placeID);
}

export const updatePlaceName = (placeID, name) => {

	firebase.database().ref('places/' + placeID + '/name').set(name);
}

export const saveCheckoutID = (checkoutID) => {

	var user = firebaseAuth.currentUser();

	if ( user && user.uid ) {
		console.log("Saving checkoutID to user");
		firebase.database().ref('users/' + user.uid + '/store/checkoutID').set(checkoutID);
	} else {
		console.log("Cannot save checkout until user logs in");
	}
	
}

export const updateGroupName = (groupID, name) => {

	firebase.database().ref('groups/' + groupID + '/name').set(name);
}

export const associateDeviceWithAccount = (deviceData) => {
	firebase.database().ref('devices/' + deviceData.identity.deviceID).set(deviceData);

	var user = firebaseAuth.currentUser();
	var userDeviceObj = {};
	userDeviceObj[deviceData.identity.deviceID] = true;

	firebase.database().ref('users/' + user.uid + '/devices/' + deviceData.identity.deviceID).set(userDeviceObj);
}

export const retrieveAnalyticData = (user) => {
	console.log("Reading Analytics Data");

	firebase.database().ref('/users/' + user.uid + '/devices').on('value', (snapshot) => {

		snapshot.forEach((childSnapshot) => {
	      readDeviceData(childSnapshot.key);
  		});
	});
}

const readDeviceData = (deviceID) => {

	console.log("Reading: ", deviceID);

	firebase.database().ref('/analytics/' + deviceID).on('value', function(snapshot) {

		var buffer = base64ToArrayBuffer(snapshot.val());
		var data = [];//HAPI.ReadHeepResponse(buffer);
		
		var analytics = [];

		for (var i = 0; i < data.length; i++) {
			var MOP = data[i];

			if (MOP.op == 31) { 

				analytics.push(MOP.analytics);
			}
		}

		if (analytics.length > 0) {
			setup.store.dispatch(actions.addMemoryDumpBatch(deviceID, analytics))
		}
		;

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


export const retrieveFulfillmentQueue = () => {
	
	firebase.database().ref('/store/queue/').on('value', function(snapshot) {
		setup.store.dispatch(actions.saveQueueToRedux(snapshot.val()));
	})
}

export const retrieveUserPublicProfile = (uid) => {


	firebase.database().ref('/users/' + uid + '/profile').on('value', function(snapshot) {

		if (snapshot.val()) {

		} else {
			const defaultUser = {
				displayName: 'Jenny Hu',
				photoURL: 'data:image/jpeg;base64,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',
				uid: null
			}

			setup.store.dispatch(actions.saveUser(uid, defaultUser));
		}
	})
}


