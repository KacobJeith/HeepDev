import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Vertex from '../components/Vertex'
import {deleteVertex}  from '../actions/actions'

const mapStateToProps = (state, ownProps) => (
{
  vertex: state.vertexList[ownProps.vertexID],
  url: state.url,
  id: ownProps.vertexID,
  inputPosition: getInputPosition(state, ownProps),
  outputPosition: getOutputPosition(state, ownProps),

})

function mapDispatchToProps(dispatch) {
  return bindActionCreators({deleteVertex}, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Vertex)

var getInputPosition = (state, ownProps) => {
	var returnPosition = {top: -100, left: -100};
	try {
		var clientID = state.vertexList[ownProps.vertexID]['txClientID'];
		var controlID = state.vertexList[ownProps.vertexID]['txControlID'];
		returnPosition = state.positions[ clientID ][  clientID + '.' + controlID  ];
	} catch(err){
		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
	}

	return returnPosition
}

var getOutputPosition = (state, ownProps) => {
	var returnPosition = {top: -100, left: -100};
	try {
		var clientID = state.vertexList[ownProps.vertexID]['rxClientID'];
		var controlID = state.vertexList[ownProps.vertexID]['rxControlID'];
		returnPosition = state.positions[ clientID ][ clientID + '.' + controlID ];
	} catch(err){
		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
	}

	return returnPosition
}