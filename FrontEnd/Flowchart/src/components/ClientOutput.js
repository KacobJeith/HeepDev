import React from 'react';

class ClientOutputList extends React.Component {
	
	render() {

		var styles = {
			outputSVG: {
				position: 'absolute',
				height: '100%',
				width: 100,
				right: -11,
				top: 0,
			}
		};

		let inputs = {
			clientOutput: {
				key: [],
				output:[],
				client: this.props.client,
				selectOutput: this.props.selectOutput,
				controlY: 0
			},
			outputSVG: {
				style: styles.outputSVG,
			}
		};


		var controlY = Math.round(100/(this.props.outputs.length + 1));

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
				onClick: (event) => this.props.selectOutput(	this.props.output['ControlName'],
														this.props.client['ClientID'],
														{top: event.clientY - 40,
														 left: event.clientX + 11}),
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: "90%",
				cy: String(this.props.controlY ) + '%',
				r: this.state.radius,
				fill: "red",
			},
			text: {
				x: '33%',
				y: String(this.props.controlY + 3) + '%',
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