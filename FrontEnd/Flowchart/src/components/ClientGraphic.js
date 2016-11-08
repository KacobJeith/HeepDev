import React from 'react';
import ClientInputList from './ClientInput';
import ClientOutputList from './ClientOutput';


class ClientGraphic extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 5
		}

		this.inputs = [];
		this.outputs = [];

		this.fillInputs();
		this.fillOutputs();

	}

	fillInputs() {

		for(let i = 0; i < this.props.client['ControlList'].length; i++){
			if (!this.props.client['ControlList'][i]['ControlDirection']){
				this.inputs.push(this.props.client['ControlList'][i]);
			}
		}
	}

	fillOutputs() {

		for(let i = 0; i < this.props.client['ControlList'].length; i++){
			if (this.props.client['ControlList'][i]['ControlDirection']){
				this.outputs.push(this.props.client['ControlList'][i]);
			}
		}
	}

	render() {

		const styles = {
			clientContainer: {
				backgroundColor: 'white',
				margin: 15,
				width: 120,
				height: 120,
				display: 'inline-block',
				color: 'black'
			},
			svgContainer: {
				display: 'absolute'
			}
		}

		const inputs = {
			clientContainer: {
				style: styles.clientContainer
			},
			svgContainer: {
				style: styles.svgContainer
			},
			clientInput:{
				inputs: this.inputs,
				client: this.props.client,
				selectInput: this.props.selectInput
			},
			clientOutput: {
				outputs: this.outputs,
				client: this.props.client,
				selectOutput: this.props.selectOutput
			},
			svg: {
				width: "100",
				height: "100",
				viewBox: "0 0 120 120"
			},
			rect: {
				x: "10",
				y: "10",
				width: "100",
				height: "100",
				rx: "15",
				ry: "15",
				fill: "black",
			}
		}

		return (<div {...inputs.clientContainer}> 
					<p>
						{this.props.client['ClientName']}
					</p>
					<div {...inputs.svgContainer}>
						<svg {...inputs.svg}>
							  <rect {...inputs.rect}/>
							  <ClientInputList {...inputs.clientInput}/>
							  <ClientOutputList {...inputs.clientOutput}/>
						</svg>
					</div>
				</div>
			);
	}
}

export default ClientGraphic;