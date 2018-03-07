import React from 'react'
import {BrowserRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'
import ReactGA from 'react-ga'

import AppBar from './AppBar'
import Footer from './Footer'
import Store from './store/Store'
import FulfillmentQueue from './store/FulfillmentQueue'
import Auth from './account/Auth'
import Logout from './account/Logout'
import UserAccount from './account/UserAccount'
import DeviceBuilder from './heep/DeviceBuilder'
import ProductDetails from './store/ProductDetails'
import DownloadPage from './heep/DownloadPage'


import Theme from './Theme'
import { MuiThemeProvider, createMuiTheme } from 'material-ui/styles'
import Reboot from 'material-ui/Reboot';

const mapStateToProps = (state) => ({
	loginStatus: state.loginStatus,
})

class App extends React.Component {

	render() {

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
	    	loggedInRoutes.push(<Route path="/DeviceBuilder" component={DeviceBuilder} key="DeviceBuilder"/>)
	    	loggedInRoutes.push(<Route path="/User" component={UserAccount} key="user"/>);
	    }

	    return(
			<Router >
					<Reboot>
			    	<MuiThemeProvider theme={Theme}>
							<div {...inputs.container}>
								<div {...inputs.content}>
									<Route path="/" component={AppBar}/>
									<Route exact path="/" component={FulfillmentQueue}/>
									<Route exact path="/Queue" component={FulfillmentQueue}/>
									<Route path="/product/:productID" component={ProductDetails}/>

									<Route exact path="/auth" component={Auth}/>
									{loggedInRoutes}
								</div>
						    </div>
				    </MuiThemeProvider>
					</Reboot>
			</Router>);

	}
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(App)
