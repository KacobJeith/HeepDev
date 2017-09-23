import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import * as database from '../redux/firebase'

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus
})

class Auth extends React.Component {
  
  checkLoginStatus() {
    console.log("checking...");
    if (!database.checkLoginStatus()) {
      database.loginUser();
    }
  }

  render() {
    console.log("STATUS: ", this.props.loginStatus);

    if (this.props.loginStatus) {

      return <div>Logged in Success!</div>

    } else {

      setTimeout(()=> {this.checkLoginStatus();}, 5000);

      return <div>logging in...</div>
    }
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Auth))

