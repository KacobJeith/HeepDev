import React from 'react'
import {HashRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'

import Header from './AppBar'
import Auth from './Auth'
import Logout from './Logout'
import Loading from './Loading'
import DeviceBuilder from './DeviceBuilder'
import Flowchart from './MaterialUI/Flowchart'
// import Analytics from './Analytics/AnalyticsMain'

const mapStateToProps = (state) => ({
	loginStatus: state.loginStatus,
})

class App extends React.Component {
	render() {

		const inputs = {
			container : {
				style: {
				    flexGrow: 1,
				    height: '100%',
				    zIndex: 1,
				    overflow: 'hidden',
				    position: 'relative',
				    display: 'flex',
				  }
			},
			content: {
				style: {
				    flexGrow: 1,
				    backgroundColor: 'white',
				    marginTop: 64, 
				    width:'100%'
				  }
			}
	    }

	    var loggedInRoutes = [];

	    if (this.props.loginStatus) {
	    	loggedInRoutes.push(<Route path="/DeviceBuilder" component={DeviceBuilder} key="DeviceBuilder"/>)

	    	// loggedInRoutes.push(<Route path="/Analytics" component={Analytics} key="Analytics"/>);
	    }

	    return(
			<Router >
		    	<div {...inputs.container}>
					<Route path="/" component={Header}/>
					<div {...inputs.content} >
						<Route exact path="/" component={Flowchart} key="Flow"/>
						<Route path="/Classic" component={Flowchart} key="Flowchart"/>
						<Route exact path="/auth" component={Auth}/>
						{loggedInRoutes}
					</div>
			    </div>
			</Router>);
	    
	}
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)

