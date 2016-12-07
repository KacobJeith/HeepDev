import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import OnOffController from './OnOffController';

class ClientInputList extends React.Component {
	render() {
		var styles = {
			inputSVG: {
				position: 'absolute',
				height: '100%',
				width: 100,
				left: -11,
				top: 15 + 10,
			}
		}

		let inputs = {
			clientInput: {
				key: [],
				input:[],
				client: this.props.client,
				selectInput: this.props.selectInput,
				top: this.props.top,
				position: this.props.position,
				left: this.props.left,
				controlY: -30,
				displayControl: this.props.displayControl,
			},
			inputSVG: {
				style: styles.inputSVG
			},
		};

		
		var controlY = 50;

		let allClientInputs = this.props.inputs.map((thisInput,index) => {
			
			inputs.clientInput['key'] = thisInput['ControlName'];
			inputs.clientInput['input'] = thisInput;
			inputs.clientInput['controlY'] = inputs.clientInput['controlY'] + controlY;
			
			return <ClientInput {...inputs.clientInput}/>
			});

		return (<div {...inputs.inputSVG}>
					{allClientInputs}
				</div>
				);
	}
}

class ClientInput extends React.Component {
	constructor() {
		super();
		this.state = {
			radius: 6,
			textHighlight: false
		}
	}

	render() {

		const styles = {
			background:{
				backgroundColor: '#43464c',
				height: 50,
				width: 40,
				left: 10,
				opacity: 0.75,
				position: 'absolute'
			}
		};

		const inputs = {
			background:{
				fill: '#43464c',
				height: 50,
				width: 40,
				x: 10,
				y: 0,
				opacity: 0.75,
				position: 'absolute'
			},
			svgTitle:{
				height: 20,
				width: '100%',
				position: 'absolute'
			},
			svgController:{
				height: 30,
				width: 50,
				position: 'absolute',
				top: 20,
				left: 20
			},
			circle: {
				onClick: (event) => {this.props.selectInput(this.props.input['ControlName'],
										this.props.client['IPAddress'],
										this.props.client['ClientID'],
										{top: this.props.top + this.props.controlY,
										 left: this.props.left + 10 });},									  
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: 10,
				cy: 10,
				r: this.state.radius,
				fill: "green"
			},
			text: {
				x: 20,
				y: 9,
				fontSize: 10,
				fill: this.state.textHighlight ? "blue" : "black",
				onMouseEnter: () => this.setState({textHighlight: true}),
				onMouseLeave: () => this.setState({textHighlight: false}),
				onClick: (event) => {this.props.displayControl(event, this.props.input);},
			},
			controller:{
				ClientID: this.props.client['ClientID'],
    			activeInput: this.props.input
			}
		}

		return (<div>
					<svg> <rect {...inputs.background}/> </svg>
					<svg {...inputs.svgTitle} ref="input">
						<circle {...inputs.circle} />
						<text {...inputs.text}> {this.props.input['ControlName']} </text>
					</svg>
					<svg {...inputs.svgController}>
						<OnOffController {...inputs.controller}/>
					</svg>
				</div>
		);
	}
}

export default ClientInputList;