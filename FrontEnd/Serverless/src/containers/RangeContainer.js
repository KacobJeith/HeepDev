import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import RangeController from '../components/RangeController'
import * as Actions from '../actions/actions'

const mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.ClientID + '.' + ownProps.controlID],
  ClientID: ownProps.ClientID,
  value: getValue(state, ownProps),
  ip: state.clients[ownProps.ClientID]['IPAddress'],
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(RangeController)


var getValue = (state, ownProps) => {
	return state.controls[ownProps.ClientID + '.' + ownProps.controlID]['CurCtrlValue']
}