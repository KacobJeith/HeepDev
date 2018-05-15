import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import OnOffContainer from './OnOffController'
import RangeContainer from './RangeController'
import { Grid, Typography } from 'material-ui'
import * as Utils from '../../serverside/utilities/generalUtilities'

import * as Draggable from 'gsap/Draggable'
import { TweenLite } from "gsap"

var mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.controlID],
  controlInputs: Object.keys(state.controls).filter((thisControl) => state.controls[thisControl].controlDirection == 0),
  collapsed: state.flowchart.devices[ownProps.DeviceID] ? state.flowchart.devices[ownProps.DeviceID].collapsed : false,
  deviceID: ownProps.deviceID,
  controlID: ownProps.controlID,
  value: state.controls[ownProps.controlID].valueCurrent,
  ip: state.devices[ownProps.deviceID].ipAddress,
  scale: state.flowchart.scale,
  devices: state.devices,
  controls: state.controls
})


class Control extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 8,
			controlHighlight: 'white',
      pointerEvents: 'all'
		}
		this.direction = this.props.control['controlDirection'];
		this.leftIndent = this.direction == 0 ? 10 : 250;
	};

	selectInputVertex(deviceID, controlID, ipAddr) {
		this.props.addVertex(deviceID, controlID, ipAddr);
	};

	selectOutputVertex() {
		this.props.selectOutput(this.props.deviceID,
								this.props.control['controlID']);
	};

  getElementPosition(element) {
    const svgElement = document.getElementById(element)
    const svgElRect = svgElement.getBoundingClientRect()

    const svgContainer = document.getElementById("deviceContainer")
    const svgConRect = svgContainer.getBoundingClientRect()

    const heightOffset = svgElRect.height / 2
    const widthOffset = svgElRect.width / 2

    const topPosition = svgElRect.top + heightOffset - svgConRect.top
    const leftPosition = svgElRect.left + widthOffset - svgConRect.left


    const returnPosition = {
      top: topPosition / this.props.scale,
      left: leftPosition / this.props.scale,
      bottom: (topPosition + svgElRect.height) / this.props.scale,
      right: (leftPosition + svgElRect.width) / this.props.scale,
    };

    return returnPosition
  };

  updateDragVertexPath() {
    const bezierWeight = 0.675
    const dragDotPosition = document.getElementById("dragDot")
    const dragVertexPath = document.getElementById("dragVertex")

    const getOutput = this.getElementPosition(this.props.controlID)
    const getInput = {
      left: dragDotPosition._gsTransform.x,
      top: dragDotPosition._gsTransform.y
    }

    const data = "M".concat(	String(getInput.left),
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
            String(getOutput.top))


    const x1 = dragDotPosition._gsTransform.x;
    const y1 = dragDotPosition._gsTransform.y;

    const x4 = getOutput.left;
    const y4 = getOutput.top;

    const dx = Math.abs(x1 - x4) * bezierWeight;

    const p1x = x1;
    const p1y = y1;

    const p2x = x1 - dx;
    const p2y = y1;

    const p4x = x4;
    const p4y = y4;

    const p3x = x4 + dx;
    const p3y = y4;

    // const data = `M${p1x} ${p1y} C ${p2x} ${p2y} ${p3x} ${p3y} ${p4x} ${p4y}`;

    dragVertexPath.setAttribute("d", data)
  };

  drawDragVertex() {
    const outputPosition = this.getElementPosition(this.props.controlID)
    const outputElement = document.getElementById(this.props.controlID)
    const controlInputs = this.props.controlInputs

    TweenLite.set("#dragDot", {
      x: outputPosition.left,
      y: outputPosition.top,
      visibility: 'visible'
    })

    Draggable.create("#dragDot", {
      type: 'x, y',
      trigger: outputElement,
      onDrag: () => this.updateDragVertexPath(),
      onDragStart: () => this.selectOutputVertex(),
      // onRelease: () => this.checkDragOverlap(),
      onDragEnd: () => this.checkDragOverlap()
    })
  };

  overlapFunction(rect1, rect2) {
    let overlap = false

    if( (rect1 != undefined) && (rect2 != undefined)) {
      overlap = !(rect1.right < rect2.left ||
                  rect1.left > rect2.right ||
                  rect1.bottom < rect2.top ||
                  rect1.top > rect2.bottom)
      }

    return overlap
  }

  checkDragOverlap() {
    const controlInputs = this.props.controlInputs
    const dragDotPosition = this.getElementPosition("dragDot")

    for (let i = 0; i < controlInputs.length; i++) {
      let currentInput = controlInputs[i].toString()
      const inputPosition = this.getElementPosition(currentInput)

      if (this.overlapFunction(dragDotPosition, inputPosition)) {
        const deviceID = this.props.controls[currentInput].deviceID
        const ipAddress = this.props.devices[deviceID].ipAddress
        const controlID = this.props.controls[currentInput].controlID
        console.log(deviceID, currentInput, ipAddress)
        this.selectInputVertex(deviceID, controlID, ipAddress)
        this.resetDrag()
    }}
  }

  resetDrag() {
    const dragVertexPath = document.getElementById("dragVertex")
    Draggable.get("#dragDot").disable()

    TweenLite.set("#dragDot", {
      clearProps: "transform",
      x: 0,
      y: 0,
      visibility: 'hidden'
    })

    dragVertexPath.removeAttribute("d")
  };

  handleMouseEnter() {
    this.setState({radius: 11}),
    Draggable.get("#_" + this.props.deviceID).disable()
    this.drawDragVertex()
  };

  handleMouseLeave() {
    this.setState({radius: 8}),
    Draggable.get("#_" + this.props.deviceID).enable()
  };

	drawControlKnob(ref) {

		const inputs = {
			vertexKnob: {
				style: {
					width: 10,
					top: 5,
					height: 20,
					position:'absolute',
					right: this.direction == 0 ? null : -13,
					left: this.direction == 0 ? -14 : null
				}
			},
			circleContainer: {
				height: 20,
				width: 12
			},
			circle: {
        id: this.props.controlID,
        className: 'controlCircle',
        // onClick: () => this.handleClick(),
				// onClick: (event) => {this.direction == 0 ?
				// 					 this.selectInputVertex(event) :
				// 					 this.selectOutputVertex(event)},
				onMouseEnter: () => this.direction == 0 ? null : this.handleMouseEnter(),
				onMouseLeave: () => this.direction == 0 ? null : this.handleMouseLeave(),
				cx: this.direction == 0 ? 11 : 0,
				cy: 10,
				r: this.state.radius,
				fill: this.direction == 0 ? "#00baff" : '#00cb7b',
				style: {
					cursor: 'pointer',
				}
			}
		}

		return (
			<div {...inputs.vertexKnob}>
				<svg {...inputs.circleContainer} ref={ref}>
					<circle {...inputs.circle} />
				</svg>
			</div>
		)
	}

	render() {

		const inputs = {
			all: {
				style: {
					top: 0,
					height: 55,
					position: 'relative',
					width: '100%'
				}
			},
			controlContainer:{
				style: {
					height: 35,
					textAlign: 'center',
					display: 'inline-flex',
					alignItems: 'center',
					left: -20
				}
			},
			controller:{
				updateControlValue: this.props.updateControlValue,
				DeviceID: this.props.deviceID,
				controlID: this.props.controlID,
				thisControl: this.props.controlID
			},
      controlTitle: {
        style: {
          userSelect: 'none',
          paddingRight: this.direction == 0 ? 0 : 4,
        }
      }
		}

		var controller = [];

		return (<div {...inputs.all}>

					<Grid container direction='column' justify='center' alignItems='center' spacing={0}>
						<Grid item xs>
							<Typography {...inputs.controlTitle} variant='body2' align='center' noWrap={true}>
								{this.props.control['controlName']}
							</Typography>
						</Grid>
						<Grid item xs style={{height: 35}}>
							{this.props.control.controlType == 0 ? <OnOffContainer {...inputs.controller}/> : <div style={{width:'80%'}}><RangeContainer {...inputs.controller}/></div> }
						</Grid>
					</Grid>

					{this.direction == 1 ?  this.drawControlKnob('output') : this.drawControlKnob('input')}
				</div>
		);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}


export default connect(mapStateToProps, mapDispatchToProps)(Control)
