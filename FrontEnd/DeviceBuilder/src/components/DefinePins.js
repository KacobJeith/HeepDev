import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import {Checkbox} from 'react-bootstrap';

import GenericSelect from './GenericSelect'

var mapStateToProps = (state, ownProps) => ({
  controlID: ownProps.controlID,
  systemType: state.systemType
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
        onChange: (value) => {console.log("Update pin to: ", value)} //this.props.updateControlDirection(controlIndex, value)}
      },
      negativeLogic: {
        style: {
          color: 'white'
        },
        title: 'Use Negative Logic',
        onChange: (e) => {console.log("checked: ", e.target.checked)}
      }
    }
    
    if (this.props.systemType == "Arduino" || this.props.systemType == "ESP8266") {

      return (<div>
        <GenericSelect {...inputs.pins}/>
        <Checkbox {...inputs.negativeLogic}> Use Negative Logic </Checkbox>
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