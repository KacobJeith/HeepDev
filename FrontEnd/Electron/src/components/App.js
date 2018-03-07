import React from 'react'
import {HashRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'

import Header from './Header'
import Auth from './Auth'
import Logout from './Logout'
import UserProfile from './UserProfile'
import DeviceBuilder from './DeviceBuilder'
import Flowchart from './Classic/Flowchart'

const mapStateToProps = (state) => ({
	loginStatus: state.loginStatus,
})

class App extends React.Component {
	constructor(props) {
		super(props);
	}

	render() {

		const styles = {
	        container : { 
	          height: "100%",
	          width: "100%",
	          marginTop: 70,
	          display: "block"
	        }
	      };

	    const inputs = {
	      container: {
	        style: styles.container
	      }
	    }

	    var loggedInRoutes = [];

	    if (this.props.loginStatus) {
	    	loggedInRoutes.push(<Route path="/DeviceBuilder" component={DeviceBuilder} key="DeviceBuilder"/>)
	    	loggedInRoutes.push(<Route path="/User" component={UserProfile} key="user"/>);
	    }

	    return(
			<Router >
		    	<div {...inputs.container}>
					<Route path="/" component={Header}/>
					<Route exact path="/" component={Flowchart} key="Flow"/>
					<Route path="/Classic" component={Flowchart} key="Flowchart"/>
					<Route exact path="/auth" component={Auth}/>
					{loggedInRoutes}
			    </div>
			</Router>);
	    
	}
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)

