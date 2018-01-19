import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as generalUtils from '../../utilities/generalUtilities'

var mapStateToProps = (state, ownProps) => (
{
  id: ownProps.vertexID,
  vertex: state.vertexList[ownProps.vertexID],
  inputPosition: getInputPosition(state, ownProps),
  outputPosition: getOutputPosition(state, ownProps)
})

class Vertex extends React.Component {
	constructor() {
		super();
		this.state = {
			color: 'black',
			strokeWidth: 3
		}
	}

	sendDeleteVertexToServer() {
		
		this.props.deleteVertex(this.props.id, this.props.vertex)
	}

	render() {

		if (this.props.inputPosition == false || this.props.outputPosition == false) {
			return <g/>
		}

		var inputs = {
			vertex: {
				strokeWidth: this.state.strokeWidth,
				stroke: this.state.color,
				fill: 'transparent',
				d: "M".concat(	String(this.props.inputPosition['left']), 
								" ", 
								String(this.props.inputPosition['top']), 
								" Q ", 
								String(Math.round(this.props.inputPosition['left'] + 30)),
								" ",
								String(Math.round(this.props.inputPosition['top'])),
								", ",
								String(Math.round(this.props.inputPosition['left'] + (this.props.outputPosition['left'] - this.props.inputPosition['left'])/2)),
								" ", 
								String(Math.round(this.props.inputPosition['top'] + (this.props.outputPosition['top'] - this.props.inputPosition['top'])/2)),
								" T ", 
								String(this.props.outputPosition['left']), 
								" ", 
								String(this.props.outputPosition['top'])),
				onMouseEnter: () => this.setState({'color': 'red', 'strokeWidth': 4}),
				onMouseLeave: () => this.setState({'color': 'black', 'strokeWidth': 3}),
				onClick: () => this.sendDeleteVertexToServer(),
			}
		}
		

		return <path {...inputs.vertex}/>;
	}
}

var getInputPosition = (state, ownProps) => {
	var returnPosition = false;
	try {
		var txControlName = generalUtils.getTxControlNameFromVertex(state.vertexList[ownProps.vertexID])
		var deviceID = state.vertexList[ownProps.vertexID].txDeviceID;
		returnPosition = state.positions[ deviceID ][ txControlName ];
	} catch(err){
		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
	}

	return returnPosition
}

var getOutputPosition = (state, ownProps) => {
	var returnPosition = false;
	try {
		var RxControlName = generalUtils.getRxControlNameFromVertex(state.vertexList[ownProps.vertexID]);
		var deviceID = state.vertexList[ownProps.vertexID].rxDeviceID
		returnPosition = state.positions[ deviceID ][ RxControlName ];
	} catch(err){
		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
	}

	return returnPosition
}


var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Vertex)
