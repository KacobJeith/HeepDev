import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import {Grid, Row, Col, Image, PageHeader, Media, Button} from 'react-bootstrap'
import "../assets/light_off.png"

var mapStateToProps = (state, ownProps) => ({
  device: state.devices[ownProps.deviceID]
})

class DeviceCard extends React.Component {

  render() {

    var inputs = {
      section: {
        key: this.props.device.identity.deviceID,
        style: {
          marginTop: 10
        }
      },
      linkButton: {
        bsStyle: "primary",
        bsSize: "small",
        onClick: () => {}
      },
      primary: {
        width: 64,
        height: 64,
        type:"image/svg+xml",
        data: "../src/assets/" + this.props.device.identity.iconName + ".svg"
      },
      backup: {
        width: 64,
        height: 64,
        src: "../src/assets/light_off.png" //"../src/assets/" + this.props.device.identity.iconName + ".png"
      }
    }

    var svgs = ['light-bulb-LED', 'cuckoo-clock', 'none', 'outlet', 'power-button', 'switch'];

    if (svgs.indexOf(this.props.device.identity.iconName) != -1) { 

      var icon = <object {...inputs.primary}/>

    } else {

      var icon = <img {...inputs.backup} />;

    }
    
    return (
<Row {...inputs.section}>
  <Col xsOffset={1}>
    <Media >
     <Media.Left>
        {icon}
      </Media.Left>
      <Media.Body>
        <h1><small>{this.props.device.identity.name}</small></h1>
      </Media.Body>
    </Media>
  </Col>
</Row>);

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(DeviceCard))

