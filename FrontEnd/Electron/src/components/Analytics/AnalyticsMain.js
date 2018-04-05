import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { NavLink, withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions'

import { Grid } from 'material-ui'
import { withTheme } from 'material-ui/styles';
import List, { ListItem, ListItemIcon, ListItemText, ListSubheader } from 'material-ui/List';

import AnalyticsList from './AnalyticsList'
import DailyActivityGraph from './DailyActivityGraph'
import BusyTimesGraph from './BusyTimesGraph'

const mapStateToProps = (state, ownProps) => ({
  deviceID: ownProps.match.params.deviceID,
  devicesWithAnalytics: Object.keys(state.analytics),
  deviceNames: Array.from(Object.keys(state.analytics), deviceID => state.devices[deviceID].name)
})

class AnalyticsMain extends React.Component {

  availableDevices() {

    return (
      <List component="nav"
        subheader={
          <ListSubheader component="div" style={{
            padding: 0, 
            paddingLeft: this.props.theme.spacing.unit,
            backgroundColor: 'white'
          }}>
            Heep Analytics
          </ListSubheader>
      }>
          
        {this.props.devicesWithAnalytics.map((deviceID, index) => (
          this.deviceAnalyticsLink(deviceID, index)
        ))}
      </List>
    )
  }

  deviceAnalyticsLink(deviceID, index) {

    const highlight = this.props.deviceID ? this.props.deviceID : this.props.devicesWithAnalytics[0] ;

    return (
      <NavLink 
        to={"/Analytics/" + deviceID}
        key={'analytics' + deviceID} 
        style={{
          textDecoration: 'none',
          outline: 'none'
        }}>
        <ListItem button >
          <ListItemText primary={this.props.deviceNames[index]} />
        </ListItem>
      </NavLink>
    )
  }

  render () {

    var inputs = {
      displayAnalytics: {
        deviceID: this.props.deviceID ? this.props.deviceID : this.props.devicesWithAnalytics[0] 
      }
    }

    return (
      <Grid container alignItems='stretch'>
        <Grid item xs={2}>
          {this.availableDevices()}
        </Grid>
        <Grid item xs>
          {inputs.displayAnalytics.deviceID && (
            <div>
              <AnalyticsList {...inputs.displayAnalytics}/> 
              <DailyActivityGraph {...inputs.displayAnalytics}/> 
              <BusyTimesGraph {...inputs.displayAnalytics}/>
            </div>
          )}
          
        </Grid>
     </Grid>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(AnalyticsMain)))
