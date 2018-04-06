import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { NavLink, withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'

import { Grid } from 'material-ui'
import { withTheme } from 'material-ui/styles';

const mapStateToProps = (state, ownProps) => ({
  
})

class SearchAccessPointsForm extends React.Component {

  render () {

    return (
      <Grid container alignItems='stretch' style={{margin: 0}}>
        <Grid item xs={2} style={{boxShadow: '1px 1px 1px lightgrey', padding: 0}}>
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

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(SearchAccessPointsForm)))
