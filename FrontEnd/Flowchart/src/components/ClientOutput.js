import React from 'react';

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

		return (<svg {...inputs.outputSVG}>
					{allClientOutputs}
				</svg>);
	}
}

class ClientOutput extends React.Component {
	constructor() {
		super();
		this.state = {
			radius: 6
		}
	}

	render() {

		const inputs = {
			circle: {
				onClick: () => this.props.selectOutput(this.props.output['ControlName'],
														this.props.client['ClientID'],
														{top:this.props.top + this.props.controlY,
										 				left: this.props.left + 219.33 }),
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: "90%",
				cy:this.props.controlY,
				r: this.state.radius,
				fill: "red",
			},
			text: {
				x: '33%',
				y: this.props.controlY + 4,
				fontSize: 10,
			}
		}

		return (<g>
					<circle {...inputs.circle}/>
					<text {...inputs.text}> {this.props.output['ControlName']} </text>
				</g>

		);
	}
}

export default ClientOutputList;