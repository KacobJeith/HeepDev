import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'
import { NavLink, withRouter } from 'react-router-dom';

import DeviceCard from '../DeviceCard'

var mapStateToProps = (state) => ({
  analytics: Object.keys(state.analytics)
})

class Sidebar extends React.Component {

  createDeviceCards(analytics) {
    var devices = [];

    for (var deviceID in analytics) {
      var id = analytics[deviceID];
      console.log("Trying to create a card for: ", id);

      devices.push(<DeviceCard deviceID={id} key={id} zoom={0.35} textColor={"white"}/>)
    }

    return devices

  }

  render () {

    var inputs = {
      sidebar: {
        style: {
          fontSize: 13,
          position: "fixed",
          height: "100%",
          width: 162.5,
          top: 0,
          left: 0,
          bottom: 0,
          display: "block",
          backgroundColor: "#004a8f",
          color: "white",
          fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen-Sans,Ubuntu,Cantarell,Helvetica Neue,sans-serif"
        }
      },
      spacer: {
        style: {
          height: 70
        }
      }
    }

    var devicesWithAnalytics = this.createDeviceCards(this.props.analytics);

    return (
      <div {...inputs.sidebar}>
        <div {...inputs.spacer}/>
        {devicesWithAnalytics}
     </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Sidebar))
