import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import OnOffController from './OnOffController';

class ClientInputList extends React.Component {
	render() {
		var styles = {
			inputSVG: {
				left: 0,
				top: 0,
			}
		}

		let inputs = {
			clientInput: {
				key: [],
				input:[],
				client: this.props.client,
				selectInput: this.props.selectInput,
				top: this.props.top,
				left: this.props.left,
				controlY: -30,
				displayControl: this.props.displayControl,
			},
			inputSVG: {
				style: styles.inputSVG
			},
		};

		
		var controlY = 55;

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
			left: {
				width: 10,
				top: 0,
				height: 20,
				display: 'inline-block'
			},
			background:{
				backgroundColor: this.state.controlHighlight,
				height: 55,
				width: 69,
				display: 'inline-block'
			},
			controlTitle: {
				display: 'inline-block',
				height: 15,
				width: 69,
				textAlign: 'center',
				fontSize: 12,
			},
			controlContainer: {
				height: 35,
				width: 69,
				textAlign: 'center',
				display: 'inline-flex',
				alignItems: 'center',

			}
		};

		const inputs = {
			all: {
				style: styles.all
			},
			left: {
				style: styles.left
			},
			background:{
				style: styles.background,
				onMouseEnter: () => this.setState({controlHighlight: '#e0e0e0'}),
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
				width: 9,
				top: 0
			},
			circle: {
				onClick: (event) => {this.props.selectInput(this.props.input['ControlName'],
										this.props.client['IPAddress'],
										this.props.client['ClientID'],
										{top: this.props.top + this.props.controlY,
										 left: this.props.left + 10 });},									  
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: 9,
				cy: 10,
				r: this.state.radius,
				fill: "green"
			},
			controller:{
				ClientID: this.props.client['ClientID'],
    			activeInput: this.props.input
			}
		}

		return (<div {...inputs.all}>
					<div {...inputs.left}>
						<svg {...inputs.circleContainer} ref="input">
							<circle {...inputs.circle} />
						</svg>
					</div>
					<div {...inputs.background}>
						<text {...inputs.controlTitle}>
								{this.props.input['ControlName']}
						</text>
						<div {...inputs.controlContainer}>
							<OnOffController {...inputs.controller}/>
						</div>
					</div>
				</div>
		);
	}
}

export default ClientInputList;