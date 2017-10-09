import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import * as auth from '../redux/FirebaseAuth'
import {Grid, Row, Col, Image, PageHeader, Media, Button} from 'react-bootstrap'
import { LinkContainer } from 'react-router-bootstrap'
import Loading from './Loading'
import UserAnalytics from './UserAnalytics'

var mapStateToProps = (state) => ({
  loginStatus: state.loginStatus,
  providers: state.providers
})

class UserProfile extends React.Component {

  genenerateLinkedAccountsSection() {
    var providers = [];
    var providerOptions = ['facebook.com', 'google.com', 'twitter.com'];

    for (var provider in providerOptions){
      var name = providerOptions[provider];

      if (this.props.providers.hasOwnProperty(name)) {

        providers.unshift(this.generateProviderCard(this.props.providers[name]));
      } else {

        providers.push(this.generateLinkButton(name));
      }

    }

    return providers
  }

  generateLinkButton(provider) {

    switch (provider) {
      case 'google.com': 
        var imageurl = "https://avatars0.githubusercontent.com/u/1342004?v=4&s=400";
        break
      case 'facebook.com' : 
        var imageurl = "https://upload.wikimedia.org/wikipedia/commons/c/c2/F_icon.svg";
        break
      case 'twitter.com': 
        var imageurl = "https://upload.wikimedia.org/wikipedia/en/9/9f/Twitter_bird_logo_2012.svg";
        break
      default : 
        var imageurl = "";
        break
    }

    var inputs = {
      section: {
        key: provider,
        style: {
          marginTop: 10
        }
      },
      linkButton: {
        bsStyle: "primary",
        bsSize: "small",
        onClick: () => {auth.linkAccount(provider)}
      },
      image: {
        width: 64,
        height: 64,
        src: imageurl, 
        alt: "Provider" 
      }
    }

    var providerText = provider.split('.');

    return (
<Row {...inputs.section}>
  <Col xsOffset={1}>
    <Media >
     <Media.Left>
        <img {...inputs.image}/>
      </Media.Left>
      <Media.Body>
        <Media.Heading>{providerText[0]}</Media.Heading>
        <Button {...inputs.linkButton}>Link {providerText[0]}</Button>
      </Media.Body>
    </Media>
  </Col>
</Row>
      )
  }
  
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
          borderRadius: "50%",
          cursor: "pointer"
        },
        onClick: () => {auth.updateProfilePicture(providerData.photoURL)}
      },
      unlinkButton: {
        bsStyle: "primary",
        bsSize: "small",
        onClick: () => {auth.unlinkAccount(providerData.providerId)}
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
        <Button {...inputs.unlinkButton}>Unlink {providerText[0]}</Button>
      </Media.Body>
    </Media>
  </Col>
</Row>

);
  }
  
  loggedIn() {
    var user = auth.currentUser();
    
    var inputs = {
      profilePicture: {
        src: user.photoURL,
        circle: true,
        responsive: true,
        style: {
          maxWidth: '100%',
          width: '100%'
        }
      },
      indented: {
        style: {
          textIndent: 60
        }
      }
    }

    var providers = this.genenerateLinkedAccountsSection();

    

    return (

<Grid>
  <Row>
    <Col md={3} xsOffset={1}>
      <Image {...inputs.profilePicture} />
    </Col>
    <Col md={4}>
      <Row> 
          <PageHeader> {user.displayName}</PageHeader>
      </Row>
      <Row>
        <Col xsOffset={1}>
          <h1><small>{user.email}</small></h1>
        </Col>
      </Row>
    </Col>
    <Col md={4}>
      <Row> 
          <PageHeader>Linked Accounts</PageHeader>
      </Row>
      {providers}
    </Col>
  </Row>
  <UserAnalytics/>
 
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

