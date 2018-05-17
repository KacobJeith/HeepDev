import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as newActions from '../../redux/actions'

import { TweenLite } from "gsap"
import * as Draggable from 'gsap/Draggable';

var mapStateToProps = (state, ownProps) => ({
  controlInputs: Object.keys(state.controls).filter((thisControl) => state.controls[thisControl].controlDirection == 0),
  devices: state.devices,
  controls: state.controls,
  startingPointDeviceID: state.vertexList.selectedOutput.deviceID,
  startingPointControlID: state.vertexList.selectedOutput.controlID,
  controlID: state.vertexList.selectedOutput.txDeviceID + '.' + state.vertexList.selectedOutput.txControlID,
  scale: 1.0//state.flowchart.scale
})

class DraggableVertex extends React.Component {

  render() {
    console.log('ReRendering Draggable Vertex')
    const inputs = {
      dragDot: {
        id: 'dragDot',
        cx: 0,
        cy: 0,
        r: 13,
        fill: 'blue',
        // visibility: 'hidden',
        onMouseEnter: () => Draggable.get("#deviceContainer").disable(),
        onMouseLeave: () => Draggable.get("#deviceContainer").enable(),
        style: {
          cursor: 'grab',
        }
      },
      dragVertex: {
        id: 'dragVertex',
        stroke: '#455A64',
        strokeWidth: 3,
        fill: 'none'
      }
    }

    this.initializeDraggable()

    return (
      <g>
        <circle {...inputs.dragDot}/>
        <path {...inputs.dragVertex}/>
      </g>
    )
  }

  initializeDraggable() {

    const outputPosition = this.getElementPosition(this.props.controlID)
    const outputElement = document.getElementById(this.props.controlID)
    const controlInputs = this.props.controlInputs

    // this.props.dragVertex()

    TweenLite.set("#dragDot", {
      x: outputPosition.left,
      y: outputPosition.top,
      visibility: 'visible'
    })

    Draggable.create("#dragDot", {
      type: 'x, y',
      trigger: outputElement,
      onDrag: () => this.updatePath(),
      // onDragStart: () => this.props.updateDragging(),
      onDragEnd: () => this.resetDrag(),
    })
  }

  updatePath() {
    const bezierWeight = 0.675
    const dragDotPosition = document.getElementById("dragDot")
    const dragVertexPath = document.getElementById("dragVertex")

    const getOutput = this.getElementPosition(this.props.controlID)
    const getInput = {
      left: dragDotPosition._gsTransform.x,
      top: dragDotPosition._gsTransform.y
    }

    // const data = "M".concat(	String(getInput.left),
    //         " ",
    //         String(getInput.top),
    //         " Q ",
    //         String(Math.round(getInput.left) - 30),
    //         " ",
    //         String(Math.round(getInput.top)),
    //         ", ",
    //         String(Math.round(getInput.left + (getOutput.left - getInput.left)/2)),
    //         " ",
    //         String(Math.round(getInput.top + (getOutput.top - getInput.top)/2)),
    //         " T ",
    //         String(getOutput.left),
    //         " ",
    //         String(getOutput.top))


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

    const data = `M${p1x} ${p1y} C ${p2x} ${p2y} ${p3x} ${p3y} ${p4x} ${p4y}`;

    dragVertexPath.setAttribute("d", data)
  };

  getElementPosition(element) {

    const svgElement = document.getElementById(element)

    if (svgElement == undefined) {
      return  {
        top: 0,
        left: 0,
        bottom: 0,
        right: 0
      }
    }

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

  calculateOverlap(rect1, rect2) {
    let overlap = false

    if( (rect1 != undefined) && (rect2 != undefined)) {
      overlap = !(rect1.right < rect2.left ||
                  rect1.left > rect2.right ||
                  rect1.bottom < rect2.top ||
                  rect1.top > rect2.bottom)
      }

    return overlap
  }

  checkOverlap() {
    const controlInputs = this.props.controlInputs
    const dragDotPosition = this.getElementPosition("dragDot")

    console.log(dragDotPosition)

    for (let i = 0; i < controlInputs.length; i++) {
      let currentInput = controlInputs[i].toString()
      const inputPosition = this.getElementPosition(currentInput)

      if (this.overlapFunction(dragDotPosition, inputPosition)) {

        const deviceID = this.props.controls[currentInput].deviceID
        const ipAddress = this.props.devices[deviceID].ipAddress
        const controlID = this.props.controls[currentInput].controlID

        this.selectInputVertex(deviceID, controlID, ipAddress)
    }}

    this.resetDrag()
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
    // this.props.updateDragging()
    dragVertexPath.removeAttribute("d")
  };


}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(DraggableVertex)
