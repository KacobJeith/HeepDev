import firebase from 'firebase'
import * as setup from '../index'
import * as actions from '../redux/actions'

export const logout = () => {
  
  firebase.auth().signOut().then(function() {

    console.log("Logged Out");

  }).catch(function(error) {

    console.log(error);
  });
}


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

	firebase.auth().onAuthStateChanged(function(user) {
	  if (user) {
	    // User is signed in.
	    console.log("Welcome back, ", user.email);
	   
	    // database.readUserData(user);

	  } else {
	    // No user is signed in.
	    console.log("Detected no user signed in");
	    loginUser();
	  }
	});

}

const loginUser = () => {
	firebase.auth().setPersistence(firebase.auth.Auth.Persistence.LOCAL)
		.then(function() {
			
			var provider = new firebase.auth.GoogleAuthProvider();
			return firebase.auth().signInWithRedirect(provider);

		})
		.catch(function(error) {
			console.log(error);
		});
}
