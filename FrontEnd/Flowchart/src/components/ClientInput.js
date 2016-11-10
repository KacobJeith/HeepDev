import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';

class ClientInputList extends React.Component {
	
	render() {
		var styles = {
			inputSVG: {
				position: 'absolute',
				height: '100%',
				width: 100,
				left: -11,
				top: 0
			}
		}

		let inputs = {
			clientInput: {
				key: [],
				input:[],
				client: this.props.client,
				selectInput: this.props.selectInput,
				controlY: 0
			},
			inputSVG: {
				style: styles.inputSVG
			},
		};

		
		var controlY = Math.round(100/(this.props.inputs.length + 1));

		let allClientInputs = this.props.inputs.map((thisInput,index) => {
			
			inputs.clientInput['key'] = thisInput['ControlName'];
			inputs.clientInput['input'] = thisInput;
			inputs.clientInput['controlY'] = inputs.clientInput['controlY'] + controlY;
			
			return <ClientInput {...inputs.clientInput}/>
			});

		return (<svg {...inputs.inputSVG}>
					<g>{allClientInputs}</g>
				</svg>
				);
	}
}

class ClientInput extends React.Component {
	constructor() {
		super();
		this.state = {
			radius: 6
		}
	}

	render() {

		const inputs = {
			circle: {
				onClick: (event) => this.props.selectInput(this.props.input['ControlName'],
														this.props.client['IPAddress'],
														this.props.client['ClientID'],
														{top: event.clientY - 40,
														 left: event.clientX }),									  
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: 10,
				cy: String(this.props.controlY ) + '%',
				r: this.state.radius,
				fill: "green"
			},
			text: {
				x: 20,
				y: String(this.props.controlY + 3) + '%',
				fontSize: 10
			}
		}

		return (<g>
					<circle {...inputs.circle}/>
					<text {...inputs.text}> {this.props.input['ControlName']} </text>
				</g>
		);
	}
}

export default ClientInputList;