import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'
import {ButtonGroup, ControlLabel, FormGroup, FormControl, HelpBlock, option} from 'react-bootstrap';

import { sys_phy_files } from '../utilities/SystemPHYCompatibilities'
import GenericSelect from './GenericSelect'
import GenericTextInput from './GenericTextInput'
import IconSVGSelect from './IconSVGSelect'

var mapStateToProps = (state, ownProps) => ({
  deviceName: state.deviceName,
  systemType: state.systemType,
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
      }
    }

    var optionalInputs = [];

    if (this.props.physicalLayer == 'wifi') {
      optionalInputs.push(<GenericTextInput {...inputs.ssid}/>)
      optionalInputs.push(<GenericTextInput {...inputs.ssidPassword}/>)
    }

    return (
          <form>
            <GenericTextInput {...inputs.deviceName}/>
            <IconSVGSelect />
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
