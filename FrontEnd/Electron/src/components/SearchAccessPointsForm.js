import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { NavLink, withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions_classic'

import { Grid, Typography, Divider } from 'material-ui'
import List, { ListItem, ListItemIcon, ListItemText, ListSubheader } from 'material-ui/List';
import { NetworkWifi } from 'material-ui-icons'

import { withTheme } from 'material-ui/styles';
import VerticalStepper from './utilities/VerticalStepper'

const mapStateToProps = (state, ownProps) => ({
  accessPoints: state.accessPoints
})

class SearchAccessPointsForm extends React.Component {


  componentWillMount() {
    this.searchRef = setInterval(() => this.props.searchForAccessPoints(), 5000);
  }

  componentWillUnmount() {
    clearTimeout(this.searchRef);
  }

  createAPForm() {

    const inputs = {
      stepper: {
        steps: [
          {
            title: 'Select a Device to Connect to',
            description: `Chose from below `,
            form: this.selectAccessPoint()
          },
          {
            title: 'Push WiFi Credentials to this Device?',
            description: `Would you like to let this device know how to log on to your local network?`,
            form: this.selectAccessPoint()
          },
          {
            title: 'Reset Device? ',
            description: `Now that your device knows how to log onto the wifi, would you like to reset it so that it can log on?`
          },
          {
            title:'Jump back to your original wifi?',
            description: `Now that we've configured your Heep Device to log on to your wifi, would you like to do anything else?`
          }
        ],
        completionCallback: () => {
          console.log('Setup Complete!')
        }
      }
    }

    return (
      <div>
        <Typography variant="title" align='center' color="inherit">
            Connect to a Heep Device
        </Typography>
        <VerticalStepper {...inputs.stepper}/>
      </div>
    )
  
  }

  selectAccessPoint() {

    return (
      <List 
        disablePadding 
        dense
        subheader={
          <ListSubheader component="div" style={{padding: 0, backgroundColor: 'white'}}>
            Heep Access Points
          </ListSubheader>}>
        
        <Divider/>

        {Object.keys(this.props.accessPoints).map((accessPointSSID) => (
          <ListItem 
            button 
            onClick={() => this.props.connectToAccessPoint(accessPointSSID)}
            style={{paddingRight: 0}} 
            key={accessPointSSID}>
            <ListItemIcon>
                <NetworkWifi/>
            </ListItemIcon>
            <ListItemText primary={accessPointSSID} />
          </ListItem>

        ))}

      </List>
    )
  }

  render () {

    return (
      <Grid container justify='center' style={{margin: 0, maxWidth: '100%'}}>
        <Grid item xs={10}>
          {this.createAPForm()}
        </Grid>
     </Grid>


    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(SearchAccessPointsForm)))
