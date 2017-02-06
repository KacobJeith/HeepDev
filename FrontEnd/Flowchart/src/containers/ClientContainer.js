import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Client from '../components/Client'
import {positionClient} from '../actions/actions'
import React from 'react'

const mapStateToProps = (state, ownProps) => ({
  client: state.clients[ownProps.ClientID],
  position: state.positions[ownProps.ClientID]['client'],
  controlInputs: state.controls[ownProps.ClientID]['inputs']['controlsArray'],
  controlOutputs: state.controls[ownProps.ClientID]['outputs']['controlsArray'],  
  url: state.url
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators({positionClient}, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Client);