import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import { withRouter } from 'react-router-dom'
import {ButtonGroup, ControlLabel, FormGroup, FormControl, HelpBlock, option} from 'react-bootstrap';

import GenericSelect from './GenericSelect'
import ControlledSelect from './ControlledSelect'
import GenericTextInput from './GenericTextInput'
import RangeOptions from './RangeOptions'

var mapStateToProps = (state) => ({
  numControls: state.numControls,
  controls: state.controls
})

class ControlBuilder extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      selection: "Select..."
    }
  }

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
        defaultValue: this.props.controls[controlIndex].controlName,
        onChange: (value) => {this.props.updateControlName(controlIndex, value)}
      },
      controlType: {
        title: "Control Type",
        options: ["OnOff", "Range"],
        defaultValue: this.props.controls[controlIndex].controlType,
        onChange: (value) => {this.props.updateControlType(controlIndex, value)}
      },
      controlDirection: {
        title: "Control Direction",
        options: ["input", "output"],
        defaultValue: this.props.controls[controlIndex].controlDirection,
        onChange: (value) => {this.props.updateControlDirection(controlIndex, value)}
      },
      rangeOptions: {
        controlID: controlIndex
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

    console.log("Re-rendering Control Builder: ", this.props.numControls);

    var inputs = {
      fieldInputs: {
        style: {
          width: "100%",
          margin: "auto"
        }
      },
      addNewControl: {
        title: "Add New Control",
        value: this.state.selection,
        options: ["Custom", "Servo", "LED", "Select..."],
        onChange: (value) => {this.setState({selection: "Select..."}); this.props.addNewControl(value); },
      }
    }

    var controlInputs = [];

    for (var i = 0; i <= this.props.numControls - 1; i++) {
      controlInputs.push(this.buildControl(i));
    }

    return (
      <div >
        <div {...inputs.fieldInputs}>
          {controlInputs}  
        </div>
        <ControlledSelect {...inputs.addNewControl}/>
      </div>
         
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(ControlBuilder))
