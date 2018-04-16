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

	sendPositionToServer() {
		this.props.sendPositionToServer(this.props.deviceID);
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
			},
		}

		return (
        <div>
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
