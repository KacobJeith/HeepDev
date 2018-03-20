import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'

import GenericTextInput from './GenericTextInput'

var mapStateToProps = (state, ownProps) => ({
  isRange: state.designer.controls[ownProps.controlID]["controlType"] == 1,
  controlID: ownProps.controlID,
  currentMax: state.designer.controls[ownProps.controlID]["highValue"],
  currentMin: state.designer.controls[ownProps.controlID]["lowValue"]
})

class RangeOptions extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {

    const inputs = {
      high: {
        title: "Range Max",
        defaultValue: this.props.currentMax,
        onChange: (value) => {this.props.updateControlMax(this.props.controlID, value)}
      },
      low: {
        title: "Range Min",
        defaultValue: this.props.currentMin,
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