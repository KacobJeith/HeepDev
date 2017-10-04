
export const welcome = (app, presentSignals) => {

	if (presentSignals.length > 0) {

		var responseMessage = "Welcome! Do you want to talk with " + presentSignals[getRandomInt(0, presentSignals.length - 1)] + "?";
		console.log(responseMessage);
		sendWithSignals(app, responseMessage, presentSignals);

	} else {

		var responseMessage = "Welcome! Would you like to add your first signal?";
		sendGenericResponse(app, responseMessage);

	}
	
}

export const requestLogin = (app, user) => {

	console.log("This user is logged in, but not referenced in the directory");
	console.log("surface capabilities: ", app.hasSurfaceCapability(app.SurfaceCapabilities.SCREEN_OUTPUT));

	if (app.hasSurfaceCapability(app.SurfaceCapabilities.SCREEN_OUTPUT)) {

		app.ask(app.buildRichResponse()
		    .addSimpleResponse('Welcome to Paper Signals! Please log in using the link.')
		    .addBasicCard(app.buildBasicCard(`Log in on your Paper Signals Battle Station`)
		    .setTitle('Welcome to Paper Signals')
		      .addButton('Take me to Paper Signals!', 'https://heep-3cddb.firebaseapp.com/PaperSignals' + '?actionsUID=' + user.userId + '&successRoute=PaperSignals')
		    )
		);
	} else {

		var responseMessage = "Greetings! Please download the google assistant app on your phone."
		
		app.ask({
			speech: responseMessage,
    		displayText: responseMessage
    	});
	}
}

export const sendDidNotMatchResponseWithFound = (app, apiResult, presentSignals) => {
	
	var responseMessage = "I couldn't find '" + apiResult.parameters.signal + "'. Here are the signals I could find.";

	console.log(responseMessage, presentSignals);

	sendWithSignals(app, responseMessage, presentSignals);
 	
}

export const sendSuccessfullyMatchedResponse = (response, apiResult) => {

	var responseMessage = "Updated " + apiResult.parameters.signal + "!";

	response.send(JSON.stringify({
					speech: responseMessage,
            		displayText: responseMessage,
            		source: 'paper-signals-firebase-function'}));
}

export const sendGenericResponse = (app, responseMessage) => {
	
	app.ask({
		speech: responseMessage,
		displayText: responseMessage
	});

	console.log(responseMessage);
}

export const sendParamterConfirmation = (app, apiResult, signalId) => {

	var responseMessage = "Updated " + apiResult.parameters.signal + ". ";

	switch (apiResult.metadata.intentName) {
		case "NFL" :
			var customResponse = responseMessage + "Now tracking " + apiResult.parameters.nflTeam + "!";
			break

		case "CryptoCurrency" :
			var customResponse = responseMessage + "Now tracking " + apiResult.parameters.Crypto
			break
			
		case "ShortsOrPants" :
			var customResponse = responseMessage + "Now tracking temperature in " + simpleLocationString(apiResult.parameters.location) + "!";
			break
			
		case "Timer" :
			var customResponse = responseMessage + "Timer set for  " + apiResult.parameters.duration.amount + apiResult.parameters.duration.unit + "!";
			break
			
		case "Umbrella" :
			var customResponse = responseMessage + "Now tracking forecast in " + simpleLocationString(apiResult.parameters.location);
			break
			
		case "RocketLaunch" :
			var customResponse = responseMessage + "Now tracking " + apiResult.parameters.SpaceAgency + " launches!"
			break
			
		default :
			console.log("Failed to identify intent");
			break
	}


	sendGenericResponse(app, customResponse);


}

const sendWithSignals = (app, responseMessage, presentSignals) => {
	var suggestions = [...new Set(presentSignals)]; 

 	while (!app.buildRichResponse().isValidSuggestionText(suggestions)) {
 		suggestions.pop();
 	}

	app.ask(app.buildRichResponse()
		.addSimpleResponse({
			speech: responseMessage,
		  	displayText: responseMessage})
		.addSuggestions(suggestions)
	);
}

const simpleLocationString = (location) => {
	if (location.hasOwnProperty('city')) {
		return location['city']
	} else if (location.hasOwnProperty('admin-area')) {
		return location['admin-area']
	} else if (location.hasOwnProperty('country')) {
		return location['country']
	} else if (location.hasOwnProperty('business-name')) {
		return location['business-name']
	} else if (location.hasOwnProperty('street-address')) {
		return location['street-address']
	} else if (location.hasOwnProperty('zip-code')) {
		return location['zip-code']
	}
}

const getRandomInt = (min, max) => {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

