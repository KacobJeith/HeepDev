import React from 'react';

class ClientInputList extends React.Component {
	
	render() {
		
		let allClientInputs = this.props.inputs.map((thisInput,index) => {
			console.log(thisInput["ControlName"]);
			return <ClientInput input = {thisInput}/>
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
				onClick: () => console.log("click!"),
				onMouseEnter: () => this.setState({radius: 8}),
				onMouseLeave: () => this.setState({radius: 5}),
				cx: "50%",
				cy: "10%",
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