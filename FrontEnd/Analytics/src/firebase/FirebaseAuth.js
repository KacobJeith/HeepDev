import firebase from 'firebase'
import * as database from './FirebaseDatabase'

export const initializeFirebase = () => {
	var config = {
		apiKey: "AIzaSyBR81Af8kOY1A1c1JDypaehxkeM89chtLU",
		authDomain: "heep-3cddb.firebaseapp.com",
		databaseURL: "https://heep-3cddb.firebaseio.com",
		projectId: "heep-3cddb",
		storageBucket: "heep-3cddb.appspot.com",
		messagingSenderId: "832186256119"
	};

	firebase.initializeApp(config);
	database.retrieveAnalyticData();

}
