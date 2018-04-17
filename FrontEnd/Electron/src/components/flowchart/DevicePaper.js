import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as newActions from '../../redux/actions'
import Control from './Controls';
import DynamicIcon from './DynamicIcon';
import { Paper, Button, Typography, Grid, Tooltip } from 'material-ui'

import * as Draggable from 'gsap/Draggable'
import { ThrowPropsPlugin } from 'gsap'

import Device from './Device'

var mapStateToProps = (state, ownProps) => ({
  deviceID: ownProps.DeviceID,
  position: state.positions[ownProps.DeviceID]['device'],
  activeState: state.devices[ownProps.DeviceID].active
})


class DevicePaper extends React.Component {

  constructor(props) {
    super(props)
    this.initialPosition = {top: props.position.top, left: props.position.left};
    this.newPosition = {top:  0, left: 0};
  }

  componentDidMount() {
    this.createDraggable()
    // this.initialPosition = {top: this.props.position.top, left: this.props.position.left};
    this.newPosition = {top: this.props.position.top, left: this.props.position.left};
  }

  calculateNewPosition() {
    const dragElement = document.getElementById("_" + this.props.DeviceID)
    const x1 = dragElement._gsTransform.x
    const y1 = dragElement._gsTransform.y

    this.newPosition = {top: Math.round(this.initialPosition.top + y1), left: Math.round(this.initialPosition.left + x1)}
  }

  sendPositionToServer() {
    this.calculateNewPosition()
		this.props.sendPositionToServer(this.props.deviceID, this.newPosition);
	}

  createDraggable () {
    Draggable.create("#_" + this.props.DeviceID, {
      type: "x,y",
      bounds: "#flowchart",
      //bounds: {top: (-1* this.initialPosition.top), left: (-1 * this.initialPosition.left)},
      edgeResistance: 1,
      allowContextMenu: true,
      throwProps: true,
      onDrag: () => this.props.updateVertex(),
      onRelease: () => this.sendPositionToServer(),
    });
  };

	render() {

		const inputs = {
      divContainer: {
        onMouseEnter: () => Draggable.get("#deviceContainer").disable(),
        onMouseLeave: () => Draggable.get("#deviceContainer").enable(),
        style: {
          position: 'absolute',
          top: this.initialPosition.top,
          left: this.initialPosition.left,
        }
      },
			deviceContainer: {
        		style: {
    					backgroundColor: 'white',
    					margin: 10,
    					padding: 3,
              width: 330,
    					cursor: '-webkit-grab',
    					position: 'absolute',
    					color: 'black',
              pointerEvents: 'visible',
              opacity: this.props.activeState ? 1.0 : .4,
              borderRadius: 20
				},
			},
		}

		return (
        <div id={"_" + this.props.DeviceID} {...inputs.divContainer}>
					{this.props.activeState ?
					<Paper {...inputs.deviceContainer} ref="device">
							<Device DeviceID={this.props.deviceID}/>
					</Paper> :
					<Tooltip id="tooltip-top" title={'Having trouble communicating with this device. Is it still plugged in?'} placement="top">
						<Paper {...inputs.deviceContainer} ref="device">
								<Device DeviceID={this.props.deviceID}/>
						</Paper>
					</Tooltip>}
				</div>
			);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(DevicePaper);
