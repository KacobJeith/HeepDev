import React from 'react';

class ClientOutputList extends React.Component {
	
	render() {

		var styles = {
			outputSVG: {
				position: 'absolute',
				height: '100%',
				width: 20,
				left: 116,
				top: 0
			}
		};

		let inputs = {
			clientOutput: {
				key: [],
				output:[],
				client: this.props.client,
				selectOutput: this.props.selectOutput
			},
			outputSVG: {
				style: styles.outputSVG
			}
		};

		let allClientOutputs = this.props.outputs.map((thisOutput,index) => {

			inputs.clientOutput['key'] = thisOutput['ControlName'];
			inputs.clientOutput['output'] = thisOutput;

			return <ClientOutput {...inputs.clientOutput}/>
			});

		return (<svg {...inputs.outputSVG}>
					<g>{allClientOutputs}</g>
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
				cx: 10,
				cy: "50%",
				r: this.state.radius,
				fill: "red"
			}
		}

		return (
			<circle {...inputs.circle}/>
		);
	}
}

export default ClientOutputList;