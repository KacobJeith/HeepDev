import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Client from '../components/Client'
import * as Actions from '../redux/actions'
import React from 'react'

const mapStateToProps = (state, ownProps) => ({
  client: state.clients[ownProps.ClientID],
  position: state.positions[ownProps.ClientID]['client'],
  controlInputs: state.controls.controlStructure[ownProps.ClientID]['inputs'],
  controlOutputs: state.controls.controlStructure[ownProps.ClientID]['outputs'],  
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Client);