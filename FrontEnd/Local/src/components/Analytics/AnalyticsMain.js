import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions'

import AnalyticsList from './AnalyticsList'
import SideBar from './SideBar'

const mapStateToProps = (state) => ({
  deviceID: state.displayingAnalytics
})

class AnalyticsMain extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {

    var inputs = {
      builder: {
        style: {
          backgroundColor: "white",
          fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen-Sans,Ubuntu,Cantarell,Helvetica Neue,sans-serif"
        }
      },
      contents: {
        style: {
          position: "relative",
          width: window.innerWidth - 162.5,
          left: 162.5
        }
      },
      spacer: {
        style: {
          height: 20
        }
      },
      lineChart: {
        deviceID: this.props.deviceID,
        filterQuery: 'timeStamp',
        timeStamp: new Date(Date.UTC(2018, 1, 1, 0, 0, 0))
      },
      displayAnalytics: {
        deviceID: this.props.deviceID
      }
    }

    var data = [];

    if (this.props.deviceID == "") {
      data = <div/>
    } else {
      data = <AnalyticsList {...inputs.displayAnalytics}/>
    }

    return (
      <div {...inputs.builder}>
        <SideBar/>
        <div {...inputs.contents}>
          {data}
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
