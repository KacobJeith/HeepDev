import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import RangeController from '../components/RangeController'
import * as Actions from '../actions/actions'

const mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.thisControl],
  controlID: state.controls[ownProps.thisControl]['ControlID'],
  value: state.controls[ownProps.thisControl]['CurCtrlValue'],
  ClientID: ownProps.ClientID,
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(RangeController)

