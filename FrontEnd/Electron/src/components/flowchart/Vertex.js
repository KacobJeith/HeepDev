import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as generalUtils from '../../serverside/utilities/generalUtilities'

import { Draggable } from 'gsap'

var mapStateToProps = (state, ownProps) => (
{
  id: ownProps.vertexID,
  vertex: state.vertexList[ownProps.vertexID],
  positions: state.positions

})

class Vertex extends React.Component {
	constructor() {
		super();
		this.state = {
			color: 'black',
			strokeWidth: 3,
		}
	}

	sendDeleteVertexToServer() {
		this.props.deleteVertex(this.props.id, this.props.vertex)
	};

  getInputPosition = () => {
  	let returnPosition = false;
  	try {
      const txControlName = generalUtils.getTxControlNameFromVertex(this.props.vertex)
      const svgElement = document.getElementById(txControlName)
      const svgRect = svgElement.getBoundingClientRect()

      returnPosition = {
        top: svgRect['top'],
        left: svgRect['left'],
      };

  	} catch(err){
  	  }

  	return returnPosition
  };

  getOutputPosition = () => {
  	let returnPosition = false;
  	try {
      const rxControlName = generalUtils.getRxControlNameFromVertex(this.props.vertex)
      const svgElement = document.getElementById(rxControlName)
      const svgRect = svgElement.getBoundingClientRect()

      returnPosition = {
        top: svgRect['top'],
        left: svgRect['left'],
      };

  	} catch(err){
  		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
  	}

  	return returnPosition
  };

	render() {
    const getInput = this.getInputPosition();
    const getOutput = this.getOutputPosition();

		if (getInput == false || getOutput == false) {
      console.log("false")
			return <g/>
		}

		var inputs = {
			vertex: {
        id: this.props.id,
        pointerEvents: 'all',
        display: 'inline-block',
				strokeWidth: this.state.strokeWidth,
				stroke: this.state.color,
				fill: 'transparent',
				d: "M".concat(	String(getInput.left),
								" ",
								String(getInput.top),
								" Q ",
								String(Math.round(getInput.left - 5)),
								" ",
								String(Math.round(getInput.top + 20)),
								", ",
								String(Math.round(getInput.left + (getOutput.left - getInput.left)/2)),
								" ",
								String(Math.round(getInput.top + (getOutput.top - getInput.top)/2)),
								" T ",
								String(getOutput.left + 9),
								" ",
								String(getOutput.top + 14)),
				onMouseEnter: () => this.setState({'color': 'red', 'strokeWidth': 4}),
				onMouseLeave: () => this.setState({'color': 'black', 'strokeWidth': 3}),
				onClick: () => this.sendDeleteVertexToServer(),
				style: {
					cursor: 'pointer'
				}
			}
		}


		return <path {...inputs.vertex}/>
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Vertex)
