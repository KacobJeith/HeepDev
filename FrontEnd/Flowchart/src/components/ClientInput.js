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
				top: this.props.top,
				left: this.props.left,
				controlY: 0,
				displayControl: this.props.displayControl,
			},
			inputSVG: {
				style: styles.inputSVG
			},
		};

		
		var controlY = 100/(this.props.inputs.length + 1);

		let allClientInputs = this.props.inputs.map((thisInput,index) => {
			
			inputs.clientInput['key'] = thisInput['ControlName'];
			inputs.clientInput['input'] = thisInput;
			inputs.clientInput['controlY'] = inputs.clientInput['controlY'] + controlY;
			
			return <ClientInput {...inputs.clientInput}/>
			});

		return (<div height="100%" ref="inputs">
					<svg {...inputs.inputSVG}>
						<g>{allClientInputs}</g>
					</svg>
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

		const inputs = {
			circle: {
				onClick: (event) => {this.props.selectInput(this.props.input['ControlName'],
										this.props.client['IPAddress'],
										this.props.client['ClientID'],
										{top: this.props.top + (126*this.props.controlY/100) + 12,
										 left: this.props.left + 10 });},									  
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
				fontSize: 10,
				fill: this.state.textHighlight ? "blue" : "black",
				onMouseEnter: () => this.setState({textHighlight: true}),
				onMouseLeave: () => this.setState({textHighlight: false}),
				onClick: (event) => {this.props.displayControl(event, this.props.input);},
			}
		}

		return (<g ref="input">
					<circle {...inputs.circle} />
					<text {...inputs.text}> {this.props.input['ControlName']} </text>
				</g>
		);
	}
}

export default ClientInputList;