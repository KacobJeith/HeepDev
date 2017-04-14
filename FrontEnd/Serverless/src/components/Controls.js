import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import OnOffContainer from './OnOffController'
import RangeContainer from './RangeController'

var mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.controlID],
  clientID: ownProps.clientID,
  controlID: ownProps.controlID,
  value: state.controls[ownProps.controlID]['CurCtrlValue'],
  ip: state.clients[ownProps.clientID]['IPAddress'],
  url: state.url
})


class Control extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 6,
			controlHighlight: 'white',
		}


		this.direction = this.props.control['ControlDirection'];
		this.leftIndent = this.direction == 0 ? 10 : 250;
	}

	selectInputVertex(event) {
		this.props.addVertex(this.props.clientID,
							 this.props.control['ControlID'],
							 this.props.ip, 
							 this.props.url);
	}

	selectOutputVertex(event) {
		this.props.selectOutput(this.props.clientID,
								this.props.control['ControlID']);
	}

	render() {

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
				marginLeft: this.direction == 0 ? 0 : 1,
			},
			background:{
				backgroundColor: this.state.controlHighlight,
				height: 55,
				width: this.direction == 0 ? 69 : 67,
				display: 'inline-block'
			},
			controlTitle: {
				display: 'inline-block',
				height: 15,
				width: this.direction == 0 ? 69 : 60,
				textAlign: this.direction == 0 ? 'left' : 'right',
				textIndent: 7,
				fontSize: 12,
			},
			controlContainer: {
				height: 35,
				width: this.direction == 0 ? 69 : 67,
				textAlign: 'center',
				display: 'inline-flex',
				alignItems: 'center',

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
				url: this.props.url,
				ClientID: this.props.clientID,
				controlID: this.props.controlID,
				thisControl: this.props.controlID
			}
		}

		var controller = [];
		if (this.props.control['ControlValueType'] == 0){
			controller.push(<OnOffContainer {...inputs.controller}/>);
			inputs.controller.key++;
		}
		else if (this.props.control['ControlValueType'] == 1){
			controller.push(<RangeContainer {...inputs.controller}/>);
			inputs.controller.key++;
		}

		return (<div {...inputs.all}>
					{this.direction == 1 ? null : 
						<div {...inputs.vertexKnob}>
							<svg {...inputs.circleContainer} ref="input">
								<circle {...inputs.circle} />
							</svg>
						</div>}
					<div {...inputs.background}>
						<text {...inputs.controlTitle}>
								{this.props.control['ControlName']}
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