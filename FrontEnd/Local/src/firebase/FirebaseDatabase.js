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



/* <-------------------------------------------------------Paper Signals---------------------------------------------------------------------->*/


export const readUserSignals = () => {
	let user = firebase.auth().currentUser

	if (user) {
		firebase.database().ref('/users/' + user.uid + '/signals').on('value', function(snapshot) {
		
			retrieveSignals(snapshot);
		})

		firebase.database().ref('/users/' + user.uid + '/signals').on('child_added', function(snapshot) {
			
			retrieveSignals(snapshot);
		})
	}
	
}


export const addSignal = (newName, intent) => {
  var uid = firebase.auth().currentUser.uid;

  var dataToPush = {
  	name: newName,
  	result: {
  		metadata: {
  			intentName: intent
  		},
  		parameters: {
  			location: {
  				city: "New York City"
  			},
  			Crypto: "Bitcoin"
  		},
  		resolvedQuery: "Try chatting with me from your Google Assistant!"
  	}
  };

  var newKey = firebase.database().ref('signals').push(dataToPush);
  var pushToUser = firebase.database().ref('users/' + uid + '/signals/' + newKey.key).set(true);
};

export const updateName = (signalId, name) => {

	firebase.database().ref('signals/' + signalId + '/name').set(name);
}

export const deleteSignal = (signalId) => {
  var uid = firebase.auth().currentUser.uid;
  var pushToUser = firebase.database().ref('users/' + uid + '/signals/' + signalId).remove();

  firebase.database().ref('signals/' + signalId).off();
  var newKey = firebase.database().ref('signals/' + signalId).remove();
};


export const downloadAssets = () => {
	downloadIconURL('ShortsOrPants');
	downloadIconURL('NFL');
	downloadIconURL('Umbrella');
	downloadIconURL('RocketLaunch');
	downloadIconURL('Weather');

	downloadIntentBackground('NFL');
	downloadIntentBackground('RocketLaunch');
	downloadIntentBackground('CryptoCurrency');
	downloadIntentBackground('Timer');

	setup.store.dispatch(actions.storeIconURL('CryptoCurrency', 'alt'));
	setup.store.dispatch(actions.storeIconURL('Timer', 'alt'));
	setup.store.dispatch(actions.storeIconURL('Generic', 'alt'));
	setup.store.dispatch(actions.storeIconURL('AddSignal', 'alt'));
	setup.store.dispatch(actions.storeIconURL('TestIntent', 'alt'));
	setup.store.dispatch(actions.storeIconURL('Default Welcome Intent', 'alt'));

	downloadFirmwarePackage();
}

const downloadFirmwarePackage = () => {
	downloadFile('APICalls.h');
	downloadFile('APICalls.cpp');
	downloadFile('Credentials.h');
	downloadFile('PaperSignals.ino');
}

const downloadFile = (filename, callback) => {

	var newKey = firebase.storage().ref('/PaperSignals/Firmware/' + filename).getDownloadURL().then(function(url) {
		
		var xhr = new XMLHttpRequest();
		xhr.responseType = 'blob';
		
		xhr.onload = function(event) {
			var blob = xhr.response;
			setup.store.dispatch(actions.storeFile(filename, blob))
		};

		xhr.open('GET', url);
		xhr.send();	

	}).catch(function(error) {
	  // Handle any errors
	});
}

const retrieveSignals = (snapshot) => {

	snapshot.forEach( function(snapChild){
		readSignal(snapChild.key);
	});
}

const readSignal = (signalId) => {
	let dataFromFirebaseRef = firebase.database().ref('/signals/' + signalId).on('value', function(signalSnapshot) {
		
		setup.store.dispatch(actions.populateSignal(signalSnapshot.key, signalSnapshot.val()));
	});
}

const downloadIconURL = (intent) => {
	firebase.storage().ref("/PaperSignals/images/intentIcons").child(intent + '.png').getDownloadURL().then(function(url) {

		setup.store.dispatch(actions.storeIconURL(intent, url));

	}).catch(function(error) {
		
		console.log("Could not find this image");
	});
}

const downloadIntentBackground = (intent) => {

	firebase.storage().ref("/PaperSignals/images/intentBackgrounds").child(intent + '.png').getDownloadURL().then(function(url) {

		setup.store.dispatch(actions.storeIntentBackgroundURL(intent, url));

	}).catch(function(error) {
		
		console.log("Could not find this image");
	});
}


