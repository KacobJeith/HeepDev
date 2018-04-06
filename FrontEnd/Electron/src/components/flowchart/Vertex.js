import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as generalUtils from '../../serverside/utilities/generalUtilities'

var mapStateToProps = (state, ownProps) => (
{
  id: ownProps.vertexID,
  vertex: state.vertexList[ownProps.vertexID],
  positions: state.positions,
  activeState:  state.devices[state.vertexList[ownProps.vertexID].rxDeviceID] && 
                state.devices[state.vertexList[ownProps.vertexID].txDeviceID] && 
                state.devices[state.vertexList[ownProps.vertexID].rxDeviceID].active && 
                state.devices[state.vertexList[ownProps.vertexID].txDeviceID].active
})

class Vertex extends React.Component {
	constructor() {
		super();
		this.state = {
			color: '#455a64',
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

      const heightOffset = svgRect.height / 2
      const widthOffset = svgRect.width / 2

      returnPosition = {
        top: svgRect.top + heightOffset + window.scrollY,
        left: svgRect.left + widthOffset + window.scrollX,
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

      const heightOffset = svgRect.height / 2
      const widthOffset = svgRect.width / 2

      returnPosition = {
        top: svgRect.top + heightOffset + window.scrollY,
        left: svgRect.left + widthOffset + window.scrollX,
      }

  	} catch(err){
  		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
  	}

  	return returnPosition
  };

	render() {
    const getInput = this.getInputPosition();
    const getOutput = this.getOutputPosition();

		if (getInput == false || getOutput == false) {
      // console.log("false")
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
                String(Math.round(getInput.left) + 30),
                " ",
                String(Math.round(getInput.top)),
                ", ",
                String(Math.round(getInput.left + (getOutput.left - getInput.left)/2)),
                " ",
                String(Math.round(getInput.top + (getOutput.top - getInput.top)/2)),
                " T ",
                String(getOutput.left),
                " ",
                String(getOutput.top)),
				onMouseEnter: () => this.setState({'color': '#d40000', 'strokeWidth': 4}),
				onMouseLeave: () => this.setState({'color': '#455a64', 'strokeWidth': 3}),
				onClick: () => this.sendDeleteVertexToServer(),
				style: {
					cursor: 'pointer',
          opacity: this.props.activeState ? 1.0 : 0.2
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
