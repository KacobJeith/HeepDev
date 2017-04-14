import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Control from '../components/Controls'
import * as Actions from '../actions/actions'

const mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.controlID],
  clientID: ownProps.clientID,
  controlID: ownProps.controlID,
  value: state.controls[ownProps.controlID]['CurCtrlValue'],
  ip: state.clients[ownProps.clientID]['IPAddress'],
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Control)

