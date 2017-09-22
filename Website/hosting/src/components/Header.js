import React, { Component, PropTypes } from 'react';
import { Navbar, Nav, NavItem } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

export default class Header extends React.Component {

	render() {

		var styles = {
			Header: {
				opacity: 1
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

			}
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
				        <LinkContainer to="/Build">
				          <NavItem>Build</NavItem>
				        </LinkContainer>
				        <LinkContainer to="/Shop">
				          <NavItem>Shop</NavItem>
				        </LinkContainer>
				        <LinkContainer to="/Mission">
				          <NavItem>Mission</NavItem>
				        </LinkContainer>
				      </Nav>
				    </Navbar.Collapse>
				  </Navbar>
				</div>
		)
	}
}