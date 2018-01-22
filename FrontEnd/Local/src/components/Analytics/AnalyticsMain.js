import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'

import AnalyticsList from './AnalyticsList'

const mapStateToProps = (state) => ({
  devices: state.devices
})

class AnalyticsMain extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {


    var deviceIDs = Object.keys(this.props.devices);


    if (deviceIDs.length == 0) {
      return <div/>
    }

    var inputs = {
      builder: {
        style: {
          backgroundColor: "white",
          fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen-Sans,Ubuntu,Cantarell,Helvetica Neue,sans-serif"
        }
      },
      contents: {
        style: {
          width: "80%",
          margin: 0,
        }
      },
      spacer: {
        style: {
          height: 20
        }
      },
      lineChart: {
        deviceID: deviceIDs[0],
        filterQuery: 'timeStamp',
        timeStamp: new Date(Date.UTC(2018, 1, 1, 0, 0, 0))
      },
      displayAnalytics: {
        deviceID: deviceIDs[0]
      }
    }

    return (
      <div {...inputs.builder}>
        <div {...inputs.contents}>
          <div {...inputs.spacer}/>
          <AnalyticsList {...inputs.displayAnalytics}/>
          <div {...inputs.spacer}/>
        </div>
     </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(AnalyticsMain))