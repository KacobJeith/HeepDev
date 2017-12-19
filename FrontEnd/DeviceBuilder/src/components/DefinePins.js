import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import {Checkbox} from 'react-bootstrap';

import GenericSelect from './GenericSelect'

var mapStateToProps = (state, ownProps) => ({
  controlID: ownProps.controlID,
  systemType: state.systemType,
  controlType: state.controls[ownProps.controlID]['controlType']
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
      }
    }

    var polarityBox = <div/>;

    if (this.props.controlType == 0) {
      polarityBox = <Checkbox {...inputs.negativeLogic}> Use Negative Logic </Checkbox>;
    }
    
    if (this.props.systemType == "Arduino" || this.props.systemType == "ESP8266") {

      return (<div>
        <GenericSelect {...inputs.pins}/>
        {polarityBox}
        </div>)

    } else {
      return (<div/>)
    }
    
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(DefinePins)