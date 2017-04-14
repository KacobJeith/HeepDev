import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import OnOffController from '../components/OnOffController'
import * as Actions from '../redux/actions'

const mapStateToProps = (state, ownProps) => ({
  controlID: state.controls[ownProps.thisControl]['ControlID'],
  ClientID: ownProps.ClientID,
  value: state.controls[ownProps.thisControl]['CurCtrlValue'],
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(OnOffController)

