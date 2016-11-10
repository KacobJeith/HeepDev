import React from 'react';

class ClientInputList extends React.Component {
	
	render() {
		let inputs = {
			clientInput: {
				key: [],
				input:[],
				client: this.props.client,
				selectInput: this.props.selectInput
			}
		};


		let allClientInputs = this.props.inputs.map((thisInput,index) => {
			
			inputs.clientInput['key'] = thisInput['ControlName'];
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
			radius: 6
		}
	}

	render() {

		const inputs = {
			circle: {
				onClick: (event) => this.props.selectInput(	this.props.input['ControlName'],
														this.props.client['IPAddress'],
														this.props.client['ClientID'],
														{top: event.clientY - 40,
														 left: event.clientX + 11}),
				onMouseEnter: () => this.setState({radius: 9}),
				onMouseLeave: () => this.setState({radius: 6}),
				cx: 10,
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