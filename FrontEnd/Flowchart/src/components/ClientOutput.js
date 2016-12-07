import React from 'react';
import $ from 'jquery';
import OnOffController from './OnOffController';

class ClientOutputList extends React.Component {
	
	render() {

		var styles = {
			outputSVG: {
				width: 59
			}
		};

		let inputs = {
			clientOutput: {
				key: [],
				output:[],
				top: this.props.top,
				left: this.props.left,
				client: this.props.client,
				selectOutput: this.props.selectOutput,
				controlY: -30
			},
			outputSVG: {
				style: styles.outputSVG,
			}
		};


		var controlY = 50;

		let allClientOutputs = this.props.outputs.map((thisOutput,index) => {

			inputs.clientOutput['key'] = thisOutput['ControlName'];
			inputs.clientOutput['output'] = thisOutput;
			inputs.clientOutput['controlY'] = inputs.clientOutput['controlY'] + controlY;

			return <ClientOutput {...inputs.clientOutput}/>
			});

		return (<div {...inputs.outputSVG}>
					{allClientOutputs}
				</div>);
	}
}

class ClientOutput extends React.Component {
	constructor() {
		super();
		this.state = {
			radius: 6,
			controlHighlight: 'white',
		}
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
				marginLeft: 2
			},
			background:{
				backgroundColor: this.state.controlHighlight,
				height: 55,
				width: 67,
				display: 'inline-block'
			},
			controlTitle: {
				display: 'inline-block',
				height: 15,
				width: 67,
				textAlign: 'center',
				fontSize: 12,
			},
			controlContainer: {
				height: 35,
				width: 67,
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
				position: 'absolute',
				height: 20,
				width: 9,
				top: 0
			},
			circle: {
				onClick: (event) => {this.props.selectInput(this.props.output['ControlName'],
										this.props.client['IPAddress'],
										this.props.client['ClientID'],
										{top: this.props.top + this.props.controlY,
										 left: this.props.left + 10 });},									  
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: 0,
				cy: 10,
				r: this.state.radius,
				fill: "red"
			},
			controller:{
				ClientID: this.props.client['ClientID'],
    			activeInput: this.props.output
			}
		}

		return (<div {...inputs.all}>
					<div {...inputs.background}>
						<text {...inputs.controlTitle}>
								{this.props.output['ControlName']}
						</text>
						<div {...inputs.controlContainer}>
							<OnOffController {...inputs.controller}/>
						</div>
					</div>
					<div {...inputs.vertexKnob}>
						<svg {...inputs.circleContainer} ref="output">
							<circle {...inputs.circle} />
						</svg>
					</div>
				</div>

		);
	}
}

export default ClientOutputList;