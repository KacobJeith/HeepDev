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
