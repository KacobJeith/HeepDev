import React, { Component, PropTypes } from 'react';
import { Navbar, Nav, NavItem, Button, Image } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';
import * as auth from '../redux/FirebaseAuth'
import { withRouter } from 'react-router-dom'
import { connect } from 'react-redux'
import * as actions from '../redux/actions'
import { bindActionCreators } from 'redux'

var mapStateToProps = (state) => ({
	loginStatus: state.loginStatus
})

class Header extends React.Component {

	notLoggedOn() {
		return(
			<LinkContainer to="/auth" key="NoUser">
	          <NavItem>
	          	<Button bsStyle="primary" bsSize="xsmall"> Login </Button>
	  		  </NavItem>
	        </LinkContainer>);
	}

	loggedOn() {
		var userNavElements = [];
		userNavElements.push(	<LinkContainer to="/Build" key="build">
						          <NavItem>Build</NavItem>
						        </LinkContainer>);
		
		userNavElements.push(this.profilePicture());
		userNavElements.push(this.logOffButton());

  		return userNavElements
	}

	profilePicture() {
		var inputs = {
			profilePicture: {
				width: 26,
				height: 26,
				style: {
					borderRadius:"50%"
				},
				src: auth.getMyUserImagePath()
			}
		};

		return(
			<LinkContainer to="/User" key="UserPic">
				<NavItem>
      				<img {...inputs.profilePicture}/>
	  		  	</NavItem>
  		  	</LinkContainer>)
	}

	logOffButton() {
		var inputs = {
			logout: {
				onClick: () => {auth.logout()},
				bsStyle:"primary",
				bsSize:"xsmall"
			}
		}

		return(<NavItem>
	          		<Button {...inputs.logout}> Logout </Button>
	  		  	</NavItem>
	        );
	}

	render() {

		var styles = {
			Header: {
				opacity: 1,
				display: "block"
			},
			Logo: {
				marginTop: -10,
				display: 'inline'
			},
			brandText: {				
				display: 'inline'
			}
		}

		var inputs = {
			Header: {
				style: styles.Header,
			},
			Navbar: {
				collapseOnSelect: true,
				fixedTop: true
			},
			Logo: {
				src: "https://firebasestorage.googleapis.com/v0/b/heep-3cddb.appspot.com/o/assets%2FLogo%2FSideBySide.png?alt=media&token=fa835081-275d-445e-be34-8241b08d687a",
				height: 50,
				style: styles.Logo
			},
			brandText: {
				style: styles.brandText

			},
			login: {
				bsStyle:"primary",
				bsSize:"xsmall"
			}
		}

		var loggedInNavs = [];

		if (this.props.loginStatus) {
			loggedInNavs.push(this.loggedOn());
		} else {
			loggedInNavs = this.notLoggedOn();
		}

		return (<div {...inputs.Header}>
				  <Navbar {...inputs.Navbar}>
				    <Navbar.Header>
				      
				      <Navbar.Brand>
				        <LinkContainer to="/">
				        	<a href="/"> 
				        		<img {...inputs.Logo}/> 
				        	</a>
				        </LinkContainer>
				      </Navbar.Brand>
				      <Navbar.Toggle />
				    </Navbar.Header>
				    <Navbar.Collapse>
				      <Nav pullRight>
				      	<LinkContainer to="/PaperSignals">
				      		<NavItem>Paper Signals</NavItem>
				      	</LinkContainer>
				        <LinkContainer to="/Shop">
				          <NavItem>Shop</NavItem>
				        </LinkContainer>
				        <LinkContainer to="/Mission">
				          <NavItem>Mission</NavItem>
				        </LinkContainer>
				        {loggedInNavs}
				      </Nav>
				    </Navbar.Collapse>
				  </Navbar>
				</div>
		)
	}
}


var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Header))