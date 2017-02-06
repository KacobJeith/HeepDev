import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Vertex from '../components/Vertex'
import {deleteVertex}  from '../actions/actions'

const mapStateToProps = (state, ownProps) => ({
  vertex: state.vertexList[ownProps.vertexID],
  inputPosition: state.positions[ state.vertexList[ownProps.vertexID]['sourceID'] ][ state.vertexList[ownProps.vertexID]['outputName'] ],
  outputPosition: state.positions[ state.vertexList[ownProps.vertexID]['destinationID'] ][ state.vertexList[ownProps.vertexID]['inputName'] ],

})

function mapDispatchToProps(dispatch) {
  return bindActionCreators({deleteVertex}, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Vertex)

