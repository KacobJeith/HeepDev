import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'

import GenericTextInput from './GenericTextInput'

var mapStateToProps = (state, ownProps) => ({
  isRange: state.controls[ownProps.controlID]["controlType"] == 1,
  controlID: ownProps.controlID,
  currentMax: state.controls[ownProps.controlID]["highValue"],
  currentLow: state.controls[ownProps.controlID]["lowValue"]
})

class RangeOptions extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {

    const inputs = {
      high: {
        title: "Range Max",
        placeholder: this.props.currentMax,
        onChange: (value) => {this.props.updateControlMax(this.props.controlID, value)}
      },
      low: {
        title: "Range Min",
        placeholder: this.props.currentMin,
        onChange: (value) => {this.props.updateControlMin(this.props.controlID, value)}
      }
    }
    
    if (this.props.isRange) {

      return (<div>
        <GenericTextInput {...inputs.low}/>
        <GenericTextInput {...inputs.high}/>
        </div>)

    } else {
      return (<div/>)
    }
    
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(RangeOptions)