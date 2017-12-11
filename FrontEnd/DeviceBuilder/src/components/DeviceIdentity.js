import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'
import {ButtonGroup, ControlLabel, FormGroup, FormControl, HelpBlock, option} from 'react-bootstrap';

import GenericSelect from './GenericSelect'
import GenericTextInput from './GenericTextInput'

var mapStateToProps = (state, ownProps) => ({
  deviceName: state.deviceName
})

class DeviceIdentity extends React.Component {

  render () {

    var inputs = {
      fieldInputs: {
        style: {
          width: "80%",
          margin: "auto"
        }
      },
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
        title: "Enter System Type",
        defaultValue: "Arduino",
        options: ["Arduino", "Linux Based", "PIC", "Simulation"],
        onChange: (value) => {this.props.updateSystemType(value)},
      }
    }

    return (
        <div {...inputs.fieldInputs}>
          <form>

            <GenericTextInput {...inputs.deviceName}/>
            <GenericSelect {...inputs.systemType}/>
            <GenericSelect {...inputs.numControls}/>

          </form>
        </div>
         
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(DeviceIdentity))
