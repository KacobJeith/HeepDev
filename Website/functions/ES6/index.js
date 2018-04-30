import * as functions from 'firebase-functions'
import * as respond from './responses.js'

const cors = require('cors')({origin: true});
var request = require('request');
var admin = require("firebase-admin");
const placesAPIKey = "AIzaSyAPJ_y32qzI3O-V9Y7oQoCXhML_gbfmm_8";
var mailgun = require('mailgun-js')({apiKey: 'key-ebc016fc47522698662b4f762a9e194b', domain: 'mg.heep.io'});

admin.initializeApp(functions.config().firebase);

exports.msSince2018Jan1 = functions.https.onRequest((request, response) => {
	const date = new Date();
	const currentTimeMs = date.getTime();

	const dateOrigin = new Date('1/1/2018');
	const msAtHeepOrigin = dateOrigin.getTime();

	var msSinceHeepOrigin = currentTimeMs - msAtHeepOrigin;

	response.status(200).send(msSinceHeepOrigin.toString());
});

exports.submitContactForm = functions.https.onRequest((req, res) => {

	var data = {
	  from: 'Heep <jacob@heep.io>',
	  to: 'jacob@heep.io',
	  subject: 'Thank you for Subscribing to Heep!',
	  text: 'Thanks for your interest in Heep! \n\nHere at Heep we are working hard to bring you a better connected world. Stay tuned in the coming months for an announcement about our first batch of product releases. In the meantime, feel free to reach out to me at jacob@heep.io for any additional information or demo requests. \n\nCheers!'
	};

	// data.to = req.body.email; 

	console.log('Sending to:', data.to);
	mailgun.messages().send(data, function(error, body) {
	  console.log(body);
	});

	console.log('Saved: ', req.body);
	res.end("Thank you");
});
