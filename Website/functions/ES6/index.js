import * as functions from 'firebase-functions'
import * as respond from './responses.js'

const cors = require('cors')({origin: true});
var request = require('request');
var admin = require("firebase-admin");
const ApiAiApp = require('actions-on-google').ApiAiApp;
const placesAPIKey = "AIzaSyAPJ_y32qzI3O-V9Y7oQoCXhML_gbfmm_8";

admin.initializeApp(functions.config().firebase);

exports.incoming = functions.https.onRequest((request, response) => {
	
	const app = new ApiAiApp({request: request, response: response});
	const user = app.getUser();

	var body = request.body;
	console.log("Request Body: ", body);

	if (user) {
		admin.database().ref("googleAssistantUsers/" + user.userId).once("value", function(directorySnapshot) {
			var uid = directorySnapshot.val()

			if (uid) {

				processRequest(app, uid, body);

			} else {
				
				respond.requestLogin(app, user);
			}
		});

	} else {

		var responseMessage = "Welcome! Call from Google Home to program a Paper Signal.";
		
		respond.sendGenericResponse(app, responseMessage);
	}
	
});

exports.verifyUser = functions.https.onRequest((request, response) => {

    admin.auth().getUser(request.query.uid)
	  .then(function(userRecord) {
	    console.log("Successfully fetched user data:", userRecord.toJSON());
	    
	    admin.database().ref('googleAssistantUsers/'+ request.query.actionsUID).set(request.query.uid);
		console.log("Saved association to googleAssistantUsers");

	    response.send("success");
	  })
	  .catch(function(error) {
	    console.log("Error fetching user data:", error);
	    response.send("fail");
	  });

});


const processRequest = (app, uid, body) => {

	switch (body.result.metadata.intentName) {
		case "AddSignal" :
			addSignal(app, uid, body.result);
			break

		case "Default Welcome Intent" :

			console.log("User Began a new conversation");

			getAllMySignals(uid, (signals) => {

				respond.welcome(app, signals)
			});

			break

		default :

			saveResultToSignal(app, uid, body);

			break
	}
}

const saveResultToSignal = (app, uid, body) => {
	var apiResult = body.result;
	var presentSignals = [];
	var foundFlag = false;
	
	admin.database().ref("users/" + uid + "/signals").once("value", function(userSnapshot) {


		userSnapshot.forEach( (snapChild, index, map) => {

			let signalId = snapChild.key;

			admin.database().ref('/signals/' + signalId).once('value').then( function(signalSnapshot) {
				let signalFinally = signalSnapshot.val();

				presentSignals.push(signalFinally.name);

				if (signalFinally.name.toLowerCase() == apiResult.parameters.signal.toLowerCase()) {
					
					foundFlag = true;

					respond.sendParamterConfirmation(app, apiResult, signalId);
					
					setLocationContexts(apiResult, signalId);

					admin.database().ref('signals/'+ signalId + "/result/parameters").set(apiResult.parameters);
					admin.database().ref('signals/'+ signalId + "/result/metadata").set(apiResult.metadata);
					admin.database().ref('signals/'+ signalId + "/result/resolvedQuery").set(apiResult.resolvedQuery);
					admin.database().ref('signals/'+ signalId + "/result/timestamp").set(body.timestamp);

				} else {

					if (!foundFlag && userSnapshot.numChildren() == presentSignals.length ) {

						respond.sendDidNotMatchResponseWithFound(app, apiResult, presentSignals);
					}
				}

			});
		});
	});
}

const setLocationContexts = (apiResult, signalId) => {

	switch (apiResult.metadata.intentName) {
		case "ShortsOrPants" :
		case "Umbrella" :
			queryLocationImage(apiResult, signalId);
		default :
			break
	}
}

const getAllMySignals = (uid, callback) => {
	var presentSignals = [];
	
	admin.database().ref("users/" + uid + "/signals").once("value", function(userSnapshot) {

		userSnapshot.forEach( (snapChild, index, map) => {

			let signalId = snapChild.key;

			admin.database().ref('/signals/' + signalId).once('value').then( function(signalSnapshot) {
				let signalFinally = signalSnapshot.val();

				presentSignals.push(signalFinally.name);
				
				if (userSnapshot.numChildren() == presentSignals.length ) {

					console.log("Found: ", presentSignals);

					callback(presentSignals);
				}

			});
		});
	});
}

const addSignal = (app, uid, apiResult) => {

	var dataToPush = {
	  	name: apiResult.parameters.signal,
	  	result: {
	  		metadata: {
	  			intentName: "RocketLaunch"
	  		},
	  		parameters: {
	  			location: {
	  				city: "New York City"
	  			}
	  		},
	  		resolvedQuery: "Try chatting with me from your Google Assistant!"
	  	}
	  };


	let newSignalKey = admin.database().ref('signals/').push(dataToPush);
	var pushToUser = admin.database().ref('users/' + uid + '/signals/' + newSignalKey.key).set(true);

	var responseMessage = "Adding new signal name " + apiResult.parameters.signal + "!";

	respond.sendGenericResponse(app, responseMessage);

	console.log(responseMessage);
}

const queryLocationImage = (apiResult, signalId) => {

	let query = processLocation(apiResult);
	let imageRequest = "https://maps.googleapis.com/maps/api/place/textsearch/json?key=" + placesAPIKey + "&query=" + query.join("+");
	
	request(imageRequest, function (error, response, body) {
		
	    if (!error && response.statusCode == 200) {
	        console.log("PLACE: ", body);
			saveLocationImageURL(JSON.parse(body), signalId);
	
	    } else {
	    	console.log("ERROR: ", error);
	    }
	})
}

const processLocation = (apiResult) => {

	if (apiResult.parameters && apiResult.parameters.location) {
		let locationJSON = apiResult.parameters.location;
		var dataArray = [];

		for (var key in locationJSON) {
		    dataArray.push(locationJSON[key].split(" ")); 
		}

		return dataArray
	} else {
		console.log("Did not find a location");
		return ["Ahu+Akivi+Hanga+Roa+Chile"]
	}
	
}

const saveLocationImageURL = (body, signalId) => {
	
	if (body.results && body.results[0] && body.results[0].photos && body.results[0].photos[0] && body.results[0].photos[0].photo_reference) { 
		let reference = body.results[0].photos[0].photo_reference;
		let url = "https://maps.googleapis.com/maps/api/place/photo?key=" + placesAPIKey + "&photoreference=" + reference + "&maxwidth=1000";

		admin.database().ref('signals/'+ signalId + "/locationImage").set(url);
	} else {
		console.log("Failed to write to database");
	}
	
}



