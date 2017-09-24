import firebase from 'firebase'
import firebaseui from 'firebaseui'
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

export const loadUserProviders = () => {
	
	firebase.auth().currentUser.providerData.forEach((provider) => {

	    setup.store.dispatch(actions.loadLinkedAccount(provider));

	});
}

export const updateProfilePicture = (newURL) => {
	var user = firebase.auth().currentUser;
	console.log("Updating Image");

	user.updateProfile({
	  photoURL: newURL
	}).then(function() {
	  // Update successful.
	  setup.store.dispatch(actions.updateLoginStatus(false));
	  setup.store.dispatch(actions.updateLoginStatus(true));

	}).catch(function(error) {
	  // An error happened.
	  console.log("Failed to Update");

	});
}

export const getMyUserImagePath = () => {
	if  (checkLoginStatus()) {
		console.log(firebase.auth().currentUser.photoURL);
		return firebase.auth().currentUser.photoURL
	} else {
		console.log(firebase.auth().currentUser.photoURL);
		return "../src/assets/Happy.jpg"
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

	    loadUserProviders()
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

export const firebaseAuthUI = () => {
	var uiConfig = {
        callbacks: {
          signInSuccess: function(currentUser, credential, redirectUrl) {

            return true;
          },
          uiShown: function() {

            document.getElementById('loader').style.display = 'none';
          }
        },
        credentialHelper: firebaseui.auth.CredentialHelper.ACCOUNT_CHOOSER_COM,

        queryParameterForWidgetMode: 'mode',

        queryParameterForSignInSuccessUrl: 'signInSuccessUrl',

        signInFlow: 'popup',
        signInSuccessUrl: '/User',
        signInOptions: [

          {
            provider: firebase.auth.EmailAuthProvider.PROVIDER_ID,

            requireDisplayName: true
          },
          firebase.auth.GoogleAuthProvider.PROVIDER_ID,
          firebase.auth.FacebookAuthProvider.PROVIDER_ID,
          firebase.auth.TwitterAuthProvider.PROVIDER_ID
        ],

        tosUrl: '/TermsOfService'
    };


	var instance = firebaseui.auth.AuthUI.getInstance();

	if (instance != null) {

		instance.delete().then(() => {

			var ui = new firebaseui.auth.AuthUI(firebase.auth());
			ui.start('#firebaseui-auth-container', uiConfig);

		});
	} else {

		var ui = new firebaseui.auth.AuthUI(firebase.auth());
		ui.start('#firebaseui-auth-container', uiConfig);
	}
	 
      	
}

export const linkAccount = (newProvider) => {

	switch (newProvider) {
		case 'google.com': 
			var provider = new firebase.auth.GoogleAuthProvider();
			break
		case 'facebook.com' : 
			var provider = new firebase.auth.FacebookAuthProvider();
			break
		case 'twitter.com': 
			var provider = new firebase.auth.TwitterAuthProvider();
			break
		case 'github.com': 
			var provider = new firebase.auth.GithubAuthProvider();
			break
		default : 
			console.log("Please select a provider");
			return
	}


	firebase.auth().currentUser.linkWithPopup(provider).then(function(result) {

	  var credential = result.credential;
	  var user = result.user;
	  loadUserProviders();

	}).catch(function(error) {

	  alert(error.message);
	});
}

export const unlinkAccount = (providerId) => {

	firebase.auth().currentUser.unlink(providerId).then(function() {

	  setup.store.dispatch(actions.unlinkAccount(providerId));
	
	}).catch(function(error) {

	  alert(error.message);

	});
}

const verifyEmail = (user) => {

	user.sendEmailVerification()
}

const launchFirebaseUI = () => {


}


