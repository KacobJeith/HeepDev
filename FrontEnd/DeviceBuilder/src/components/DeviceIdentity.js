import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'
import {ButtonGroup, ControlLabel, FormGroup, FormControl, HelpBlock, option} from 'react-bootstrap';

import GenericSelect from './GenericSelect'
import GenericTextInput from './GenericTextInput'

var mapStateToProps = (state, ownProps) => ({
  deviceName: state.deviceName,
  physicalLayer: state.physicalLayer,
  controls: state.controls
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
        options: ["Arduino", "Linux Based", "PIC", "Simulation"],
        onChange: (value) => {this.props.updateSystemType(value)}
      },
      physicalLayer: {
        title: "Select Physical Layer",
        defaultValue: "W5500",
        options: ['W5100', 'W5500', 'ESP8266'],
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
      }
    }

    var optionalInputs = [];

    if (this.props.physicalLayer == 'ESP8266') {
      optionalInputs.push(<GenericTextInput {...inputs.ssid}/>)
      optionalInputs.push(<GenericTextInput {...inputs.ssidPassword}/>)
    }

    return (
          <form>
            <GenericTextInput {...inputs.deviceName}/>
            <GenericSelect {...inputs.systemType}/>
            <GenericSelect {...inputs.physicalLayer}/>
            {optionalInputs}
          </form>  
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(DeviceIdentity))
