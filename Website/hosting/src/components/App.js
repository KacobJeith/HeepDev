import React from 'react'
import {BrowserRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'
import ReactGA from 'react-ga'

import AppBar from './AppBar'
import Landing from './Landing'
import Mission from './Mission'
import Store from './store/Store'
import Build from './heep/Build'
import Auth from './account/Auth'
import Logout from './account/Logout'
import Loading from './Loading'
import UserProfile from './account/UserProfile'
import DeviceBuilder from './heep/DeviceBuilder'
import Checkout from './store/Checkout'
import ProductDetails from './store/ProductDetails'
import DownloadPage from './heep/DownloadPage'

import PaperSignalsConsole from './PaperSignals/PaperSignalsConsole'

const mapStateToProps = (state) => ({
	loginStatus: state.loginStatus,
})

class App extends React.Component {
	constructor(props) {
		super(props);
		// ReactGA.initialize('UA-93098480-1');
		this.handleScroll = this.handleScroll.bind(this)
	}


	logPageView() {
	  // ReactGA.set({ page: window.location.pathname });
	  // ReactGA.pageview(window.location.pathname);
	}

	componentDidMount() {
		window.addEventListener('scroll', this.handleScroll);
    }

    handleScroll() {
        this.props.updateScrollPosition(window.scrollY)
    }

	render() {
		this.logPageView();

		const styles = {
	        container : { 
	          height: "100%",
	          width: "100%",
	          marginTop: 0,
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
	    	loggedInRoutes.push(<Route path="/Build" component={Build} key="build"/>);
	    	loggedInRoutes.push(<Route path="/DeviceBuilder" component={DeviceBuilder} key="DeviceBuilder"/>)
	    	loggedInRoutes.push(<Route path="/User" component={UserProfile} key="user"/>);
	    }

	    return(
			<Router >
		    	<div {...inputs.container}>
					<Route path="/" component={AppBar}/>
					<Route exact path="/" component={Mission}/>
					<Route path="/Mission" component={Mission}/>
					<Route path="/Shop" component={Store}/>
					<Route path="/product/:productID" component={ProductDetails}/>
					<Route path="/Checkout" component={Checkout}/>
					<Route exact path="/auth" component={Auth}/>
					<Route exact path="/PaperSignals" component={PaperSignalsConsole}/>
					<Route exact path="/Developers" component={DownloadPage}/>
					{loggedInRoutes}
			    </div>
			</Router>);
	    
	}
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)

