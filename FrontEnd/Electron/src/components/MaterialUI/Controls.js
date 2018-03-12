import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import OnOffContainer from './OnOffController'
import RangeContainer from './RangeController'

var mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.controlID],
  deviceID: ownProps.deviceID,
  controlID: ownProps.controlID,
  value: state.controls[ownProps.controlID]['valueCurrent'],
  ip: state.devices[ownProps.deviceID]['ipAddress']
})


class Control extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 6,
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

	render() {
		console.log('rendering control...', this.props.control)

		const styles = {
			all: {
				width: 79,
				top: 0,
				height: 55,
				position: 'relative',
				display: 'inline-flex'
			},
			vertexKnob: {
				width: 10,
				top: 0,
				height: 20,
				display: 'inline-block',
				marginLeft: this.direction == 0 ? -11 : 21,
			},
			background:{
				backgroundColor: this.state.controlHighlight,
				height: 55,
				display: 'inline-block'
			},
			controlTitle: {
				display: 'inline-block',
				height: 15,
				textAlign: this.direction == 0 ? 'left' : 'right',
				textIndent: 7,
				fontSize: 12,
			},
			controlContainer: {
				height: 35,
				textAlign: 'center',
				display: 'inline-flex',
				alignItems: 'center',
				left: -20

			}
		};


		const inputs = {
			all: {
				style: styles.all
			},
			vertexKnob: {
				style: styles.vertexKnob
			},
			background:{
				style: styles.background,
				onMouseEnter: () => this.setState({controlHighlight: '#e7e7e7'}),
				onMouseLeave: () => this.setState({controlHighlight: 'white'}),
			},
			controlTitle:{
				style: styles.controlTitle,
			},
			controlContainer:{
				style: styles.controlContainer,
			},
			circleContainer: {
				height: 20,
				width: 9
			},
			circle: {
				onClick: (event) => {this.direction == 0 ? 
									 this.selectInputVertex(event) : 
									 this.selectOutputVertex(event)},									  
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: this.direction == 0 ? 9 : 0,
				cy: 10,
				r: this.state.radius,
				fill: this.direction == 0 ? "green" : 'red'
			},
			controller:{
				key: 0,
				updateControlValue: this.props.updateControlValue,
				DeviceID: this.props.deviceID,
				controlID: this.props.controlID,
				thisControl: this.props.controlID
			}
		}

		var controller = [];
		// if (this.props.control['controlType'] == 0){
		// 	controller.push(<OnOffContainer {...inputs.controller}/>);
		// 	inputs.controller.key++;
		// }
		// else if (this.props.control['controlType'] == 1){
		// 	controller.push(<RangeContainer {...inputs.controller}/>);
		// 	inputs.controller.key++;
		// }

		return (<div {...inputs.all}>
					{this.direction == 1 ? null : 
						<div {...inputs.vertexKnob}>
							<svg {...inputs.circleContainer} ref="input">
								<circle {...inputs.circle} />
							</svg>
						</div>}

					<div {...inputs.background}>
						<text {...inputs.controlTitle}>
								{this.props.control['controlName']}
						</text>
						<div {...inputs.controlContainer}>
							{controller}
						</div>
					</div>

					{this.direction == 0 ? null : 
						<div {...inputs.vertexKnob}>
							<svg {...inputs.circleContainer} ref="output">
								<circle {...inputs.circle} />
							</svg>
						</div> }
				</div>
		);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}


export default connect(mapStateToProps, mapDispatchToProps)(Control)