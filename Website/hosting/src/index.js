import 'babel-polyfill'
import Immutable from 'immutable'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import app from './redux/reducers'
import Sidebar from './components/Sidebar'
import Store from './components/Store'
import Build from './components/Build'
import thunk from 'redux-thunk'
import firebase from 'firebase'
import * as actions from './redux/actions'
import * as database from './redux/firebase'
import * as shopify from './redux/Shopify'
import $ from 'jquery'
import { BrowserRouter as Router, Route, Match } from 'react-router-dom'
import createBrowserHistory from 'history/createBrowserHistory'


const initializeFirebase = () => {
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
	   
	    database.readUserData(user);

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

var renderApp = () => {


    var inputs = {
      app: {
        style: {
	        fontSize: 13,
	        height: "100%",
	        display: "block",
	        position: "relative",
	        marginLeft: 260
	    }
      },
      router: {
      	basename: "r",
      	forceReference: false
      }
    }

	render(
	  <Provider store={store}>
	    <Router >
	    	<div>
			  <Route path="/" component={Sidebar}/>
			  <div {...inputs.app}>
		      	<Route exact path="/" component={Store}/>
		      	<Route exact path="/build" component={Build}/>
		      	<Route exact path="/store" component={Store}/>
		      </div>
		    </div>
		</Router>
	  </Provider>,

	  document.getElementById('root')
	);
}

export const store = createStore(app, applyMiddleware(thunk));

initializeFirebase();
shopify.InitializeShopify();
renderApp();

