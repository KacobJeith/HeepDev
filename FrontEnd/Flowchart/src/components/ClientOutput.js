import React from 'react';

class ClientOutputList extends React.Component {
	
	render() {
		let inputs = {
			clientOutput: {
				key: [],
				output:[],
				client: this.props.client,
				selectOutput: this.props.selectOutput
			}
		};

		let allClientOutputs = this.props.outputs.map((thisOutput,index) => {

			inputs.clientOutput['key'] = thisOutput['ControlName'];
			inputs.clientOutput['output'] = thisOutput;

			return <ClientOutput {...inputs.clientOutput}/>
			});

		return (<g>{allClientOutputs}</g>);
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
														{top: event.clientY,
														 left: event.clientX}),
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: "90%",
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