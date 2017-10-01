import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import * as auth from '../redux/FirebaseAuth'
import Loading from './Loading'

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus
})

class Auth extends React.Component {

  componentDidMount() {
    auth.firebaseAuthUI();
  }
  
  checkLoginStatus() {

    if (!auth.checkLoginStatus()) {
      auth.loginUser();
    }
  }

  render() {
    
      return  ( <div> 
                  <div id="firebaseui-auth-container"></div>
                  <Loading/>
                </div>);
    
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Auth))

