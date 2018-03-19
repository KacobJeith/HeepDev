import React from 'react'
import {BrowserRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'
import ReactGA from 'react-ga'

import AppBar from './AppBar'
import Footer from './Footer'
import Landing from './Landing'
import About from './About'
import Store from './store/Store'
import Build from './heep/Build'
import Auth from './account/Auth'
import Logout from './account/Logout'
import Loading from './Loading'
import UserAccount from './account/UserAccount'
import DeviceBuilder from './heep/DeviceBuilder'
import Checkout from './store/Checkout'
import ProductDetails from './store/ProductDetails'
import DownloadPage from './heep/DownloadPage'
import ManageCart from './store/ManageCart'

import PaperSignalsConsole from './PaperSignals/PaperSignalsConsole'

import Theme from './Theme'
import { MuiThemeProvider, createMuiTheme } from 'material-ui/styles'

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

		const inputs = {
			container : {
				style: {
					height: "100vh",
					width: "100%",
					marginTop: 0,
					display: "flex",
					flexDirection: 'column'
				}

			},
			content: {
				style: {
					flex: '1 0 auto',
					maxWidth:'100%'
				}
			}
	    }

	    var loggedInRoutes = [];

	    if (this.props.loginStatus) {
	    	loggedInRoutes.push(<Route path="/Build" component={Build} key="build"/>);
	    	loggedInRoutes.push(<Route path="/DeviceBuilder" component={DeviceBuilder} key="DeviceBuilder"/>)
	    	loggedInRoutes.push(<Route path="/User" component={UserAccount} key="user"/>);
	    }

	    return(
			<Router >
	    	<MuiThemeProvider theme={Theme}>
					<div {...inputs.container}>
						<div {...inputs.content}>
							<Route path="/" component={AppBar}/>
							<Route exact path="/" component={Landing}/>
							<Route path="/Landing" component={Landing}/>
							<Route path="/About" component={About}/>
							<Route path="/Shop" component={Store}/>
							<Route path="/product/:productID" component={ProductDetails}/>
							<Route path="/Checkout" component={Checkout}/>
							<Route path="/MyCart" component={ManageCart}/>
							<Route exact path="/auth" component={Auth}/>
							<Route exact path="/Developers" component={DownloadPage}/>
							{loggedInRoutes}
						</div>
						<Route path="/" component={Footer}/>
				    </div>
		    </MuiThemeProvider>
			</Router>);

	}
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)
