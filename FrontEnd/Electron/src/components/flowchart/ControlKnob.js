import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import { Grid, Typography } from 'material-ui'
import * as Utils from '../../serverside/utilities/generalUtilities'

var mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.controlID],
  collapsed: state.flowchart.devices[ownProps.DeviceID] ? state.flowchart.devices[ownProps.DeviceID].collapsed : false,
  deviceID: ownProps.deviceID,
  controlID: ownProps.controlID,
  value: state.controls[ownProps.controlID].valueCurrent,
  ip: state.devices[ownProps.deviceID].ipAddress
})


class ControlKnob extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 8,
			controlHighlight: 'white',
		}


		this.direction = this.props.control['controlDirection'];
		this.leftIndent = this.direction == 0 ? 10 : 250;
	}

	selectInputVertex(event) {
		this.props.addVertex(this.props.deviceID,
							 this.props.control['controlID'],
							 this.props.ip);
	}

	selectOutputVertex(event) {
		this.props.selectOutput(this.props.deviceID,
								this.props.control['controlID']);
	}

	drawControlKnob(ref) {

		const inputs = {
			// vertexKnob: {
			// 	style: {
			// 		width: 10,
			// 		top: 5,
			// 		height: 20,
			// 		position:'absolute',
			// 		right: this.direction == 0 ? null : -10,
			// 		left: this.direction == 0 ? -10 : null
			// 	}
			// },
			// circleContainer: {
			// 	height: 20,
			// 	width: 11,
			// },
			circle: {
        id: this.props.controlID+ '2',
				// onClick: (event) => {this.direction == 0 ?
				// 					 this.selectInputVertex(event) :
				// 					 this.selectOutputVertex(event)},
				onMouseEnter: () => this.setState({radius: 11}),
				onMouseLeave: () => this.setState({radius: 8}),
				cx: this.direction == 0 ? 9 : 0,
				cy: 10,
				r: this.state.radius,
				fill: this.direction == 0 ? "#00baff" : '#00cb7b',
				style: {
					cursor: 'pointer',
				}
			}
		}

		return (
			// <div {...inputs.vertexKnob}>
				<svg {...inputs.circleContainer} ref={ref}>
					<circle {...inputs.circle} />
				</svg>
			// </div>
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
		}

		var controller = [];

		return (<div>
					   {this.direction == 1 ?  this.drawControlKnob('output') : this.drawControlKnob('input')}
    				</div>
		);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}


export default connect(mapStateToProps, mapDispatchToProps)(ControlKnob)
