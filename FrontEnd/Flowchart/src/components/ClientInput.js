import React from 'react';

class ClientInputList extends React.Component {
	
	render() {
		let inputs = {
			clientInput: {
				input:[],
				client: this.props.client,
				selectInput: this.props.selectInput
			}
		};


		let allClientInputs = this.props.inputs.map((thisInput,index) => {
			console.log(thisInput["ControlName"]);
			inputs.clientInput['input'] = thisInput;
			return <ClientInput {...inputs.clientInput}/>
			});

		return (<g>{allClientInputs}</g>);
	}
}

class ClientInput extends React.Component {
	constructor() {
		super();
		this.state = {
			radius: 5
		}
	}

	render() {

		const inputs = {
			circle: {
				onClick: () => this.props.selectInput(	this.props.input['ControlName'],
														this.props.client['IPAddress'],
														this.props.client['ClientID']),
				onMouseEnter: () => this.setState({radius: 8}),
				onMouseLeave: () => this.setState({radius: 5}),
				cx: "10%",
				cy: "50%",
				r: this.state.radius,
				fill: "green"
			}
		}

		return (
			<circle {...inputs.circle}/>
		);
	}
}

export default ClientInputList;