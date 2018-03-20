import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'

import Input, { InputLabel } from 'material-ui/Input';
import { FormControl, FormHelperText } from 'material-ui/Form';
import { Collapse } from 'material-ui'
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

      return (
        <Collapse in={this.props.isRange} timeout={750} unmountOnExit>
          <FormControl style={{margin: 24}}>
            <InputLabel htmlFor="low-input">Range Min</InputLabel>
            <Input id="low-input" 
              value={this.props.currentMin}
              onChange={ (event) => {this.props.updateControlMax(this.props.controlID, event.target.value)}}/>
          </FormControl>

          <FormControl style={{margin: 24}}>
            <InputLabel htmlFor="max-input">Range Max</InputLabel>
            <Input id="max-input" 
              value={this.props.currentMax}
              onChange={ (event) => {this.props.updateControlMin(this.props.controlID, event.target.value)}}/>
          </FormControl>
        </Collapse>)

    
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(RangeOptions)