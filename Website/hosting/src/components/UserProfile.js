import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import * as database from '../redux/firebase'
import {Grid, Row, Col, Image, PageHeader} from 'react-bootstrap'
import { LinkContainer } from 'react-router-bootstrap'
import Loading from './Loading'

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus
})

class UserProfile extends React.Component {
  
  
  loggedIn() {
    var user = database.currentUser();
    
    var inputs = {
      profilePicture: {
        src: user.photoURL,
        circle: true,
        style: {
          maxWidth: '100%'
        }
      },
      indented: {
        style: {
          textIndent: 60
        }
      }
    }

    return (

<Grid>
  <Row>
    <Col md={3} xsOffset={1}>
      <Image {...inputs.profilePicture} />
    </Col>
    <Col md={8}>
      <Row> 
          <PageHeader> {user.displayName}</PageHeader>
      </Row>
      <Row>
        <Col xsOffset={1}>
          <h1><small>{user.email}</small></h1>
        </Col>
      </Row>
    </Col>
  </Row>
 
</Grid>


    );  
  }

  render() {
    if (this.props.loginStatus) {
      return this.loggedIn()
    } else {
      return <Loading/>
    }
  }
  
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(UserProfile))

