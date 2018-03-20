import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'

import GenericSelect from './GenericSelect'
import { FormGroup, FormControlLabel } from 'material-ui/Form';
import Checkbox from 'material-ui/Checkbox';

var mapStateToProps = (state, ownProps) => ({
  controlID: ownProps.controlID,
  systemType: state.designer.systemType,
  controlType: state.designer.controls[ownProps.controlID]['controlType'],
  negativeLogic: state.designer.controls[ownProps.controlID]['pinNegativeLogic']
})

class DefinePins extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {

    const inputs = {
      pins: {
        title: "Select Pin",
        options: Array.from(Array(30).keys()),
        defaultValue: 0,
        onChange: (value) => {this.props.updateControlPin(this.props.controlID, value)} 
      },
      negativeLogic: {
        style: {
          color: 'white'
        },
        title: 'Use Negative Logic',
        onChange: (e) => {this.props.updateControlPinPolarity(this.props.controlID, e.target.checked)}
      },
      digitalOrAnalog: {
        title: "Digital or Analog",
        options: ["digital", "analog"],
        defaultValue: "digital",
        onChange: (value) => {this.props.updateControlAnalogOrDigital(this.props.controlID, value)} 
      }
    }

    var polarityBox = <div/>;

    if (this.props.controlType == 0) {
      polarityBox = <Checkbox {...inputs.negativeLogic}> Use Negative Logic </Checkbox>;
    }
    
    switch (this.props.systemType) {
      case "Arduino" :
      case "ESP8266" :
      case "PoE" :

        return (<div>
          <GenericSelect {...inputs.pins}/>
          <GenericSelect {...inputs.digitalOrAnalog}/>
          {this.props.controlType == 0 && (
            <FormControlLabel
                control={
                  <Checkbox
                    checked={this.props.negativeLogic}
                    onChange={(event) => {this.props.updateControlPinPolarity(this.props.controlID, event.target.checked)}}
                    value='pin'
                  />
                }
                label='Use Negative Logic'
              />
          )}
          </div>)

    default :
      return (<div/>)
    }
    
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(DefinePins)