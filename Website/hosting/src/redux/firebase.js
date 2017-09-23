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

export const checkLoginStatus = () => {

	if ( firebase.auth().currentUser ) {

	  return true

	} else {

	  return false
	}
}

export const currentUser = () => {

	return firebase.auth().currentUser
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
	    setup.store.dispatch(actions.updateLoginStatus(true));
	    // database.readUserData(user);

	  } else {
	    // No user is signed in.
	    console.log("Detected no user signed in");
	    setup.store.dispatch(actions.updateLoginStatus(false));

	  }
	});

}

export const loginUser = () => {
	firebase.auth().setPersistence(firebase.auth.Auth.Persistence.LOCAL)
		.then(function() {
			
			var provider = new firebase.auth.GoogleAuthProvider();
			return firebase.auth().signInWithRedirect(provider);
			// firebase.auth().signInWithPopup(provider);

		})
		.catch(function(error) {
			console.log(error);
		});
}
