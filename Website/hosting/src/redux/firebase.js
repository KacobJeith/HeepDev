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
            // Do something.
            // Return type determines whether we continue the redirect automatically
            // or whether we leave that to developer to handle.
            console.log("Login FirebaseUI Success!");


            // verifyEmail(currentUser);

            return true;
          },
          uiShown: function() {
            // The widget is rendered.
            // Hide the loader.
            document.getElementById('loader').style.display = 'none';
          }
        },
        credentialHelper: firebaseui.auth.CredentialHelper.ACCOUNT_CHOOSER_COM,
        // Query parameter name for mode.
        queryParameterForWidgetMode: 'mode',
        // Query parameter name for sign in success url.
        queryParameterForSignInSuccessUrl: 'signInSuccessUrl',
        // Will use popup for IDP Providers sign-in flow instead of the default, redirect.
        signInFlow: 'popup',
        signInSuccessUrl: '/User',
        signInOptions: [

          firebase.auth.GoogleAuthProvider.PROVIDER_ID,
          firebase.auth.FacebookAuthProvider.PROVIDER_ID,
          firebase.auth.TwitterAuthProvider.PROVIDER_ID,
          {
            provider: firebase.auth.EmailAuthProvider.PROVIDER_ID,

            requireDisplayName: true
          },
          {
            provider: firebase.auth.PhoneAuthProvider.PROVIDER_ID,

            recaptchaParameters: {
              type: 'image',
              size: 'invisible',
              badge: 'bottomleft'
            }
          }
        ],

        tosUrl: '/TermsOfService'
      };

      var ui = new firebaseui.auth.AuthUI(firebase.auth());

      ui.start('#firebaseui-auth-container', uiConfig);
}

const verifyEmail = (user) => {

	user.sendEmailVerification()
}
