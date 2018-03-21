import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'
import { withRouter } from 'react-router-dom'

import GenericSelect from '../utilities/GenericSelect'
import GenericTextInput from '../utilities/GenericTextInput'
import RangeOptions from './RangeOptions'
import DefinePins from './DefinePins'

import { Divider } from 'material-ui'

var mapStateToProps = (state) => ({
  numControls: state.designer.numControls,
  controls: state.designer.controls
})

class ControlBuilder extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      selection: "Select..."
    }
  }

  buildControl (thisControl, controlIndex) {

    var inputs = {
      controlSection: {
        style: {
          // backgroundColor: '#'+((Math.random()/2)*0xFFFFFF<<0).toString(16),
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
        title: "Enter Control Name",
        width: '100%',
        defaultValue: thisControl.controlName,
        onChange: (value) => {this.props.updateControlName(controlIndex, value)}
      },
      controlType: {
        title: "Control Type",
        width: '45%',
        options: {
          OnOff: 0, 
          Range: 1
        },
        defaultValue: thisControl.controlType,
        onChange: (value) => {this.props.updateControlType(controlIndex, value)}
      },
      controlDirection: {
        title: "Control Direction",
        width: '45%',
        options: {
          input: 0, 
          output: 1
        },
        defaultValue: thisControl.controlDirection,
        onChange: (value) => {this.props.updateControlDirection(controlIndex, value)}
      },
      rangeOptions: {
        controlID: controlIndex
      },
      pinOptions: {
        controlID: controlIndex
      }
    }

    return (<div {...inputs.controlSection}>
              <div {...inputs.formContainer}>
                  <Divider/>
                  <GenericTextInput {...inputs.controlName}/>
                  <GenericSelect {...inputs.controlDirection}/>
                  <GenericSelect {...inputs.controlType}/>
                  <RangeOptions {...inputs.rangeOptions}/>
                  <DefinePins {...inputs.pinOptions}/>

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
        value:this.state.selection,
        defaultValue: this.state.selection,
        width: '33%',
        options: ["Custom", "Servo", "LED", "Select..."],
        onChange: (value) => {this.setState({selection: "Select..."}); this.props.addNewControl(value); },
      },
      spacer: {
        style: {
          height: 20
        }
      }
    }

    return (
      <div style={{margin:24}}>
        <div {...inputs.fieldInputs}>
          {this.props.controls.map((thisControl, index) => this.buildControl(thisControl, index))}  
        </div>
        <div {...inputs.spacer}/>
        <GenericSelect {...inputs.addNewControl}/>
      </div>
         
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(ControlBuilder))
