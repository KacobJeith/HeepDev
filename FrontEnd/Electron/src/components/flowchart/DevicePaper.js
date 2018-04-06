import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as newActions from '../../redux/actions'
import Control from './Controls';
import DynamicIcon from './DynamicIcon';
import { Paper, Button, Typography, Grid, Tooltip } from 'material-ui'

import Device from './Device'

var mapStateToProps = (state, ownProps) => ({
  deviceID: ownProps.DeviceID,
  position: state.positions[ownProps.DeviceID]['device'],
  activeState: state.devices[ownProps.DeviceID].active
})


class DevicePaper extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			dragging: false
		}

		this.runningOffset = {top:  0,
							  left: 0};
		this.lastPosition =  {top:  0,
							  left: 0};

	}

	onDragStart(event) {

	  	this.lastPosition['left'] = event.pageX;
	  	this.lastPosition['top'] = event.pageY;
	  	this.setState({dragging: true});

	  	var dragIcon = document.createElement('img');

	  	event.dataTransfer.setDragImage(dragIcon, 99999,99999);
	}

	onTouchStart(event) {

		event.preventDefault();
		this.lastPosition['left'] = event.nativeEvent.changedTouches[0].pageX;
	  	this.lastPosition['top'] = event.nativeEvent.changedTouches[0].pageY;

	}

	onDrag(event) {
		this.calculateDragOffset(event);
		this.props.positionDevice(this.props.deviceID, this.runningOffset);
	}

	calculateDragOffset(event) {
		// The final drag event is always 0, which throws off tracking unless you catch and ignore it
		if (event.clientX == 0 && event.clientY == 0){
			return;
		}

		this.runningOffset['left'] = event.pageX - this.lastPosition['left']  ;
		this.lastPosition['left'] = event.pageX;

		this.runningOffset['top'] = event.pageY - this.lastPosition['top']  ;
		this.lastPosition['top'] = event.pageY;

	}

	sendPositionToServer() {

		this.props.sendPositionToServer(this.props.deviceID);
		this.setState({dragging: false});
	}

	render() {

		const inputs = {
			deviceContainer: {
        		style: {
    					backgroundColor: 'white',
    					margin: 10,
    					padding: 3,
              width: 330,
    					cursor: '-webkit-grab',
    					position: 'absolute',
    					top: this.props.position.top,
    					left: this.props.position.left,
    					color: 'black',
              pointerEvents: 'visible',
              opacity: this.props.activeState ? 1.0 : .4,
              borderRadius: 20
				},
				elevation: this.state.dragging ? 3 : 5,

				// WebkitUserDrag: `auto | element | none`
			},
			draggingCallbacks: {
				draggable: true,
				onDragStart : (event) => {this.onDragStart(event)},
				onDrag : (event) => {this.onDrag(event)},
				onDragEnd: (event) => {this.sendPositionToServer()},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.sendPositionToServer()},
				style: {
					cursor: 'drag'
				}
			}
		}

		return (<div>
					{this.props.activeState ?
					<Paper {...inputs.deviceContainer} ref="device">
							<Device DeviceID={this.props.deviceID} draggingCallbacks={{...inputs.draggingCallbacks}}/>
					</Paper> :
					<Tooltip id="tooltip-top" title={'Having trouble communicating with this device. Is it still plugged in?'} placement="top">
						<Paper {...inputs.deviceContainer} ref="device">
								<Device DeviceID={this.props.deviceID} draggingCallbacks={{...inputs.draggingCallbacks}}/>
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
