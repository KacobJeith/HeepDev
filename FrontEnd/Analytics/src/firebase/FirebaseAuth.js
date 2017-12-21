import firebase from 'firebase'
import * as database from './FirebaseDatabase'

export const initializeFirebase = () => {
	var config = {
	    apiKey: "AIzaSyCcIyrnqQlM2jX2T4ZujRVhqtjFvoV1JrM",
	    authDomain: "heep-analytics.firebaseapp.com",
	    databaseURL: "https://heep-analytics.firebaseio.com",
	    projectId: "heep-analytics",
	    storageBucket: "heep-analytics.appspot.com",
	    messagingSenderId: "695915635915"
	};

	firebase.initializeApp(config);
	database.readDeviceData();

}
