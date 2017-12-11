import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'
import {ButtonGroup, ControlLabel, FormGroup, FormControl, HelpBlock, option} from 'react-bootstrap';

import GenericSelect from './GenericSelect'
import GenericTextInput from './GenericTextInput'
import RangeOptions from './RangeOptions'

var mapStateToProps = (state) => ({
  numControls: state.numControls
})

class ControlBuilder extends React.Component {

  buildControl (controlIndex) {

    var inputs = {
      controlSection: {
        style: {
          backgroundColor: '#'+((Math.random()/2)*0xFFFFFF<<0).toString(16),
          paddingTop: 10,
          paddingBottom: 10
        },
        key: controlIndex
      },
      formContainer: {
        style: {
          width: "60%",
          marginLeft: "auto",
          marginRight: "auto"
        }
      },
      controlName: {
        title: "Control Name",
        defaultValue: "default",
        onChange: (value) => {this.props.updateControlName(controlIndex, value)}
      },
      controlType: {
        title: "Control Type",
        options: ["OnOff", "Range"],
        defaultValue: "On/Off",
        onChange: (value) => {this.props.updateControlType(controlIndex, value)}
      },
      controlDirection: {
        title: "Control Direction",
        options: ["input", "output"],
        defaultValue: "input",
        onChange: (value) => {this.props.updateControlDirection(controlIndex, value)}
      },
      rangeOptions: {
        controlID: controlIndex - 1
      }
    }

    return (<div {...inputs.controlSection}>
              <div {...inputs.formContainer}>
                <form>
                  <GenericTextInput {...inputs.controlName}/>
                  <GenericSelect {...inputs.controlDirection}/>
                  <GenericSelect {...inputs.controlType}/>
                  <RangeOptions {...inputs.rangeOptions}/>
                </form>
              </div>
            </div>
          );
  }

  render () {

    var inputs = {
      fieldInputs: {
        style: {
          width: "100%",
          margin: "auto"
        }
      }
    }

    var controlInputs = [];

    for (var i = 1; i <= this.props.numControls; i++) {
      controlInputs.push(this.buildControl(i));
    }

    return (
        <div {...inputs.fieldInputs}>
          {controlInputs}
        </div>
         
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(ControlBuilder))
