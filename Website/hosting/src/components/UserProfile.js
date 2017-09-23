import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import * as database from '../redux/firebase'
import {Grid, Row, Col, Image, PageHeader, Media} from 'react-bootstrap'
import { LinkContainer } from 'react-router-bootstrap'
import Loading from './Loading'

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus,
  providers: state.providers
})

class UserProfile extends React.Component {
  
  generateProviderCard(providerData) {

    var providerText = providerData.providerId.split('.');
    var inputs = {
      section: {
        key: providerData.providerId,
        style: {
          marginTop: 10
        }
      },
      image: {
        width: 64,
        height: 64,
        src: providerData.photoURL,
        alt: "Image",
        style: {
          borderRadius: "50%"
        }
      }
    }

    return (
<Row {...inputs.section}>
  <Col xsOffset={1}>
    <Media >
     <Media.Left>
        <img {...inputs.image}/>
      </Media.Left>
      <Media.Body>
        <Media.Heading>{providerText[0]}</Media.Heading>
        <p>Thanks for linking this account!</p>
      </Media.Body>
    </Media>
  </Col>
</Row>

);
  }
  
  loggedIn() {
    var user = database.currentUser();
    
    var inputs = {
      profilePicture: {
        src: user.photoURL,
        circle: true,
        responsive: true,
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

    var providers = [];

    for (var provider in this.props.providers){
      providers.push(this.generateProviderCard(this.props.providers[provider]));
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
      <Row> 
          <PageHeader>Linked Accounts</PageHeader>
      </Row>
      
      {providers}
        
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

