import firebase from 'firebase'
import * as setup from '../index'
import * as actions from './actions'


export const readDeviceData = () => {

	firebase.database().ref('/data').on('value', function(snapshot) {

		setup.store.dispatch(actions.addMemoryDump(snapshot.key, snapshot.val()));

	})

}




