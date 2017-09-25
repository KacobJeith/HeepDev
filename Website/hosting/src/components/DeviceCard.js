import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import {Grid, Row, Col, Image, PageHeader, Media, Button} from 'react-bootstrap'

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
      image: {
        width: 64,
        height: 64,
        src: "http://www.iconhot.com/icon/png/devine-icons-part-2/256/device-and-hardware.png", 
        alt: "DevicePic" 
      }
    }
    
    return (
<Row {...inputs.section}>
  <Col xsOffset={1}>
    <Media >
     <Media.Left>
        <img {...inputs.image}/>
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

