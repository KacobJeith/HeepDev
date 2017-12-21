import firebase from 'firebase'
import * as setup from '../index.jsx'
import * as actions from '../redux/actions'


export const readDeviceData = () => {
	console.log("Reading Data")

	firebase.database().ref('/data').on('value', function(snapshot) {

		console.log("Read: ", snapshot.val())

		setup.store.dispatch(actions.addMemoryDump(snapshot.key, snapshot.val()));

	})

}




