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

    if (!database.checkLoginStatus()) {
      database.loginUser();
    }
  }

  render() {

    if (this.props.loginStatus) {

      return <div>Logged in Success!</div>

    } else {

      setTimeout(()=> {this.checkLoginStatus();}, 5000);

      var inputs = {
        video: {
          src: "../src/assets/heepwink3_gradient.mov",
          loop: true, 
          autoPlay: true,
          height: 400,
          width: 400,
          style: {
            position: 'fixed',
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)'
          }
        }
      }

      return  <video {...inputs.video}/>
    }
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Auth))

