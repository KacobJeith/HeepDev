import React from 'react';

class ClientOutputList extends React.Component {
	
	render() {
		let inputs = {
			clientOutput: {
				output:[],
				client: this.props.client,
				selectOutput: this.props.selectOutput
			}
		};

		let allClientOutputs = this.props.outputs.map((thisOutput,index) => {
			console.log(thisOutput["ControlName"]);
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
			radius: 5
		}
	}

	render() {

		const inputs = {
			circle: {
				onClick: () => this.props.selectOutput(	this.props.output['ControlName'],
														this.props.client['ClientID']),
				onMouseEnter: () => this.setState({radius: 8}),
				onMouseLeave: () => this.setState({radius: 5}),
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