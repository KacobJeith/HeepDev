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

  componentDidMount() {
    this.createDraggable();
  }

	sendDeleteVertexToServer() {
		this.props.deleteVertex(this.props.id, this.props.vertex)
	};

  getInputPosition = () => {
  	var returnPosition = false;
  	try {
  		//var deviceID = state.vertexList[ownProps.vertexID].txDeviceID;
      var txControlName = generalUtils.getTxControlNameFromVertex(this.props.vertex)
      const svgElement = document.getElementById(txControlName)
      const svgRect = svgElement.getBoundingClientRect()
      returnPosition = {
        top: svgRect['top'],
        left: svgRect['left'],
      };
      //var boxElements = svgelement.getBoundingClientRect()
  		//returnPosition = state.positions[ deviceID ][ txControlName ];
      //console.log(txControlName, boxElements['top'])
  	} catch(err){
  		//console.log('Found a dangling vertex: ', state.vertexList[ownProps.vertexID]);
  	}

  	return returnPosition
  };

  getOutputPosition = () => {
  	var returnPosition = false;
  	try {
      var rxControlName = generalUtils.getRxControlNameFromVertex(this.props.vertex)
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

  createDraggable = () => {
    console.log("creating draggable")
    var txControlName = generalUtils.getTxControlNameFromVertex(this.props.vertex)
    var rxControlName = generalUtils.getRxControlNameFromVertex(this.props.vertex)
    const svgTX = document.getElementById(txControlName)
    const svgRX = document.getElementById(rxControlName)

    //Draggable.create((txControlName, rxControlName), {
    //  onDrag: this.updatePath(svgTX, svgRX)
    //})

    console.log("draggable made")
  };

  updatePath() {
    const svgTX = document.getElementById(txControlName)
    const svgRX = document.getElementById(rxControlName)
    console.log("updating path")
    var x1 = TX._gsTransform.x;
    console.log(x1)
    var y1 = TX._gsTransform.y;
    var x4 = RX._gsTransform.x;
    var y4 = RX._gsTransform.y;

    var dx = Math.abs(x4 - x1) * this.state.strokeWidth;

    var x2 = x1 - dx;
    var x3 = x4 + dx;

    var data = `M${x1} ${y1} C ${x2} ${y1} ${x3} ${y4} ${x4} ${y4}`;
    console.log(data)

    return data
  }

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
        pointerEvents: 'visible',
				strokeWidth: this.state.strokeWidth,
				stroke: this.state.color,
				fill: 'transparent',
				d: "M".concat(	String(getInput.left),
								" ",
								String(getInput.top),
								" Q ",
								String(Math.round(getInput.left + 30)),
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
        //d: this.updatePath(),
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
