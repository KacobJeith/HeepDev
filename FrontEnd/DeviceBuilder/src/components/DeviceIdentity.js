import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'
import {Grid, Row, Col, ButtonGroup, ControlLabel, FormGroup, FormControl, HelpBlock, option} from 'react-bootstrap';

import { sys_phy_files } from '../utilities/SystemPHYCompatibilities'
import GenericSelect from './GenericSelect'
import GenericTextInput from './GenericTextInput'
import IconSVGSelect from './IconSVGSelect'
import {iconMappings} from '../assets/iconMappings'
import GenericSVG from './GenericSVG'

var mapStateToProps = (state, ownProps) => ({
  deviceName: state.deviceName,
  systemType: state.systemType,
  physicalLayer: state.physicalLayer,
  controls: state.controls,
  icon: state.iconSelected
})

class DeviceIdentity extends React.Component {

  render () {

    var inputs = {
      numControls: {
        defaultValue: 1,
        onChange: (value) => {this.props.updateNumControls(value)},
        options: Array.from(Array(10).keys()),
        title: "Controls"
      },
      deviceName: {
        title: "Device Name",
        defaultValue: "DefaultName",
        onChange: (value) => {this.props.updateDeviceName(value)}
      },
      systemType: {
        title: "Select System Type",
        defaultValue: "Arduino",
        options: Object.keys(sys_phy_files),
        onChange: (value) => {this.props.updateSystemType(value)}
      },
      physicalLayer: {
        title: "Select Physical Layer",
        defaultValue: sys_phy_files[this.props.systemType][0],
        options: Object.keys(sys_phy_files[this.props.systemType]),
        onChange: (value) => {this.props.updatePhysicalLayer(value)}
      },
      ssid: {
        key: 'ssid',
        title: "Enter WiFi SSID",
        defaultValue: '',
        onChange: (value) => {this.props.updateSSID(value)}
      },
      ssidPassword: {
        key: 'ssidpwd',
        title: "Enter WiFi Password",
        defaultValue: '',
        onChange: (value) => {this.props.updateSSIDPassword(value)}
      },
      iconSVG: {
        height: 150,
        width: 150,
        iconName: iconMappings[this.props.icon]
      },
      iconContainer: {
        style: {
          backgroundColor: "white",
          border: "10px solid white",
          borderRadius: 5,
          cursor: "pointer"
        },
        onClick: () => {this.props.openIconModal()}
      },
      fullWidth: {
        style: {
          width: "100%"
        }
      }
    }

    var optionalInputs = [];

    if (this.props.physicalLayer == 'wifi') {
      optionalInputs.push(<Row> <div {...inputs.fullWidth}> <GenericTextInput {...inputs.ssid}/> </div> </Row>)
      optionalInputs.push(<Row> <div {...inputs.fullWidth}> <GenericTextInput {...inputs.ssidPassword}/> </div> </Row>)
    }

    return (
          <form>
          <Grid>
            <Row>
              <Col md={4} >
                <div {...inputs.iconContainer}>
                  <IconSVGSelect />
                  <GenericSVG {...inputs.iconSVG}/>
                </div>
              </Col>
              <Col md={8}>
                <Row> <div {...inputs.fullWidth}> <GenericTextInput {...inputs.deviceName}/> </div> </Row>
                <Row> <div {...inputs.fullWidth}> <GenericSelect {...inputs.systemType}/> </div> </Row>
                <Row> <div {...inputs.fullWidth}> <GenericSelect {...inputs.physicalLayer}/> </div> </Row>
                {optionalInputs}
              </Col>
            </Row>
          </Grid>
          </form>  
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(DeviceIdentity))
