import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import DynamicIcon from '../components/DynamicIcon'
import * as Actions from '../actions/actions'

const mapStateToProps = (state, ownProps) => ({
  ClientID: ownProps.ClientID,
  value: state.controls[ownProps.controlID]['CurCtrlValue'],
  highValue: state.controls[ownProps.controlID]['HighValue'],
  icon: state.icons[ownProps.clientID],
  height: ownProps.height,
  width: ownProps.width,
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(DynamicIcon)
