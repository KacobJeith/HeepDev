import React from 'react';
import OnOffController from './OnOffController';
import RangeController from './RangeController';

class ControlList extends React.Component {
	render() {
		let inputs = {
			eachControl: {
				key: [],
				control:[],
				client: this.props.client,
				select: this.props.select,
				top: this.props.top,
				left: this.props.left,
				controlY: 0,			
			}
		};

		
		var controlY = 55;

		let allClientControls = this.props.controlList.map((thisControl,index) => {
			
			inputs.eachControl['key'] = thisControl['ControlName'];
			inputs.eachControl['control'] = thisControl;
			inputs.eachControl['controlY'] = inputs.eachControl['controlY'] + controlY;
			
			return <EachControl {...inputs.eachControl}/>
			});

		return (<div>
					{allClientControls}
				</div>
				);
	}
}

class EachControl extends React.Component {
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
		this.props.select(this.props.control['ControlName'],
						  this.props.client['IPAddress'],
						  this.props.client['ClientID'],
						  {top: this.props.top + this.props.controlY + 4,
						   left: this.props.left + this.leftIndent });
	}

	selectOutputVertex(event) {
		this.props.select(this.props.control['ControlName'],
						  this.props.client['ClientID'],
						  {top: this.props.top + this.props.controlY + 4,
						   left: this.props.left + this.leftIndent });
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
				key: this.props.client['ClientID'],
				ClientID: this.props.client['ClientID'],
				control: this.props.control
			}
		}

		var controller = [];
		if (this.props.control['ControlValueType'] == 0){
			controller.push(<OnOffController {...inputs.controller}/>);
		}
		else if (this.props.control['ControlValueType'] == 1){
			controller.push(<RangeController {...inputs.controller}/>);
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

export default ControlList;