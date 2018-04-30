import * as functions from 'firebase-functions'

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

	const data = {
	  from: `${req.body.name} <${req.body.email}>`,
	  to: 'inquiries@heep.io',
	  subject: `[${req.body.company}] - New Inquiry`,
	  text: `${req.body.message}`
	};

	console.log('Sending to:', data.to);
	mailgun.messages().send(data, function(error, body) {
	  console.log(body);
	});

	console.log('Saved: ', req.body);
	res.status(200).end("Message Sent");
});
