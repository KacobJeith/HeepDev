import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../redux/actions'
import {Grid, Row, Col, Image, PageHeader, Media, Button} from 'react-bootstrap'

var mapStateToProps = (state, ownProps) => ({
  device: state.devices_firebase[ownProps.deviceID],
  zoom: ownProps.zoom,
  textColor: ownProps.textColor
})

class DeviceCard extends React.Component {

  render() {

    var inputs = {
      container: {
        style: {
          zoom: this.props.zoom
        }
      },
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
        data: '../assets/' + this.props.device.identity.iconName + ".svg"
      },
      backup: {
        width: "auto",
        height: "auto",
        style: {
          maxWidth: 64,
          maxHeight: 64,
          margin: "auto",
          display: "block"
        },
        src: '../assets/' + this.props.device.identity.iconName + ".png" //"../src/assets/" + this.props.device.identity.iconName + ".png"
      },
      imageContainer: {
        style: {
          width: 64,
          height: 64
        }
      },
      text: {
        style: {
          color: this.props.textColor
        }
      }
    }

    var svgs = ['light-bulb-LED', 'cuckoo-clock', 'none', 'outlet', 'power-button', 'switch'];

    if (svgs.indexOf(this.props.device.identity.iconName) != -1) { 

      var icon = <object {...inputs.primary}/>

    } else {

      var icon = <div {...inputs.imageContainer}> <img {...inputs.backup} /></div>;

    }
    
    return (
      <div {...inputs.container}>
<Row {...inputs.section}>
  <Col xsOffset={1}>
    <Media >
     <Media.Left>
        {icon}
      </Media.Left>
      <Media.Body>
        <h1 {...inputs.text}>{this.props.device.identity.name}</h1>
      </Media.Body>
    </Media>
  </Col>
</Row>
</div>);

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(DeviceCard))

