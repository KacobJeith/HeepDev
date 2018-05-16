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
                state.devices[state.vertexList[ownProps.vertexID].txDeviceID].active,
  display: state.vertexList[ownProps.vertexID].timeSinceDiscovered <= 1,
  dragging: state.flowchart.dragVertex,
  scale: state.flowchart.scale,
  txDeviceID: state.vertexList[ownProps.vertexID].txDeviceID,
  rxDeviceID: state.vertexList[ownProps.vertexID].rxDeviceID,
  txCollapsed: state.flowchart.devices[state.vertexList[ownProps.vertexID].txDeviceID] && state.flowchart.devices[state.vertexList[ownProps.vertexID].txDeviceID].collapsed ? state.flowchart.devices[state.vertexList[ownProps.vertexID].txDeviceID].collapsed : false,
  rxCollapsed: state.flowchart.devices[state.vertexList[ownProps.vertexID].rxDeviceID] && state.flowchart.devices[state.vertexList[ownProps.vertexID].rxDeviceID].collapsed ? state.flowchart.devices[state.vertexList[ownProps.vertexID].rxDeviceID].collapsed : false,
})

class Vertex extends React.Component {
	constructor() {
		super();
		this.state = {
			color: '#455a64',
			strokeWidth: 3,
      collapsedColor: '#9fa1a2'
		}
	}

	sendDeleteVertexToServer() {
		this.props.deleteVertex(this.props.id, this.props.vertex)
	};

  getInputPosition = () => {
  	let returnPosition = false;
  	try {

      let txControlName

      if (this.props.txCollapsed == true) {
        txControlName = this.props.txDeviceID + "_tx"
      } else {
        txControlName = generalUtils.getTxControlNameFromVertex(this.props.vertex)
      }

      const svgElement = document.getElementById(txControlName)
      const svgElRect = svgElement.getBoundingClientRect()

      const svgContainer = document.getElementById("deviceContainer")
      const svgConRect = svgContainer.getBoundingClientRect()

      const heightOffset = svgElRect.height / 2
      const widthOffset = svgElRect.width / 2

      returnPosition = {
        top: (svgElRect.top + heightOffset - svgConRect.top) / this.props.scale,
        left: (svgElRect.left + widthOffset - svgConRect.left) / this.props.scale,
      };

  	} catch(err){
  	  }

  	return returnPosition
  };

  getOutputPosition = () => {
  	let returnPosition = false;
  	try {

      let rxControlName

      if (this.props.rxCollapsed == true) {
        rxControlName = this.props.rxDeviceID + "_rx"
      } else {
        rxControlName = generalUtils.getRxControlNameFromVertex(this.props.vertex)
      }

      const svgElement = document.getElementById(rxControlName)
      const svgElRect = svgElement.getBoundingClientRect()

      const svgContainer = document.getElementById("deviceContainer")
      const svgConRect = svgContainer.getBoundingClientRect()

      const heightOffset = svgElRect.height / 2
      const widthOffset = svgElRect.width / 2

      returnPosition = {
        top: (svgElRect.top + heightOffset - svgConRect.top) / this.props.scale,
        left: (svgElRect.left + widthOffset - svgConRect.left) / this.props.scale,
      }

  	} catch(err){
  		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
  	}

  	return returnPosition
  };

  checkCollapsed() {
    if (this.props.rxCollapsed || this.props.txCollapsed) {
      return true
    } else {
      return false
    }
  }

	render() {
    const getInput = this.getInputPosition();
    const getOutput = this.getOutputPosition();

		if (!this.props.display || getInput == false || getOutput == false) {
      // console.log("false")
			return <g/>
		}

    const rxClassName = 'vertex' + this.props.rxDeviceID.toString()
    const txClassName = 'vertex' + this.props.txDeviceID.toString()

		var inputs = {

			vertex: {
        id: this.props.id,
        className: [rxClassName, txClassName, "test"].join(" "),
        pointerEvents: 'all',
        display: 'inline-block',
				strokeWidth: this.state.strokeWidth,
				stroke: this.checkCollapsed() ? this.state.collapsedColor : this.state.color,
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
				onMouseEnter: () => this.checkCollapsed() ? this.setState({'strokeWidth': 3}) : this.setState({'color': '#d40000', 'strokeWidth': 5}),
				onMouseLeave: () => this.checkCollapsed() ? this.setState({'strokeWidth': 3}) : this.setState({'color': '#455a64', 'strokeWidth': 3}),
				onClick: () => this.checkCollapsed() ? null : this.sendDeleteVertexToServer(),
				style: {
					cursor: this.checkCollapsed() ? 'move' : 'pointer',
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
