import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Vertex from '../components/Vertex'
import {deleteVertex}  from '../actions/actions'
import * as generalUtils from '../utilities/generalUtilities'

const mapStateToProps = (state, ownProps) => (
{
  url: state.url,
  id: ownProps.vertexID,
  vertex: state.vertexList[ownProps.vertexID],
  inputPosition: getInputPosition(state, ownProps),
  outputPosition: getOutputPosition(state, ownProps),

})

function mapDispatchToProps(dispatch) {
  return bindActionCreators({deleteVertex}, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Vertex)

var getInputPosition = (state, ownProps) => {
	var returnPosition = false;
	try {
		var txControlName = generalUtils.getTxControlNameFromVertex(state.vertexList[ownProps.vertexID])
		var clientID = state.vertexList[ownProps.vertexID].txClientID;
		returnPosition = state.positions[ clientID ][ txControlName ];
	} catch(err){
		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
	}

	return returnPosition
}

var getOutputPosition = (state, ownProps) => {
	var returnPosition = false;
	try {
		var RxControlName = generalUtils.getRxControlNameFromVertex(state.vertexList[ownProps.vertexID]);
		var clientID = state.vertexList[ownProps.vertexID].rxClientID
		returnPosition = state.positions[ clientID ][ RxControlName ];
	} catch(err){
		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
	}

	return returnPosition
}