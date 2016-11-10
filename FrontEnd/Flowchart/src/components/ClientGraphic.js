import React from 'react';
import ClientInputList from './ClientInput';
import ClientOutputList from './ClientOutput';


class ClientGraphic extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 5,
			originX: 0,
			originY: 0,
			top: this.props.top,
			left: this.props.left,
		}

		this.inputs = [];
		this.outputs = [];
		this.dragOffset = {	top: 0,
							left: 0};

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

	calculateDragPosition(event) {
		this.calculateDragOffset(event);
		this.setState({left: this.state.left + this.dragOffset['left'],
					   top: this.state.top + this.dragOffset['top']});

		this.props.updateVertexPositions(this.props.client['ClientID'], this.dragOffset);
	}

	calculateDragOffset(event) {
		this.dragOffset['left'] = event.pageX - this.state.originX;
		this.dragOffset['top']  = event.pageY - this.state.originY;
	}

	render() {

		const styles = {
			clientContainer: {
				backgroundColor: 'white',
				margin: 10,
				borderWidth: 2,
				borderStyle: 'solid',
				borderRadius: 5,
				padding: 3,
				borderWidth: 2,
				width: 120,
				height: 120,
				display: 'inline-block',
				position: 'absolute',
				top: this.state.top,
				left: this.state.left,
				color: 'black'
			},
			svgContainer: {
				display: 'absolute',
				margin: 'auto'
			},
			text: {
				textAlign: 'center',
				cursor: '-webkit-grab'
			},
			svg: {
				display: 'block',
				margin: 'auto'
			},
			inputSVG: {
				position: 'absolute',
				height: '100%',
				width: 20,
				left: -11,
				top: 0
			},
			outputSVG: {
				position: 'absolute',
				height: '100%',
				width: 20,
				left: 116,
				top: 0
			}
		}

		const inputs = {
			clientContainer: {
				style: styles.clientContainer,
				draggable: true,
				onDragStart : (event) => {this.setState({originX: event.pageX,
														originY: event.pageY});},
				onDragEnd: (event) => {this.calculateDragPosition(event);},
			},
			svgContainer: {
				style: styles.svgContainer
			},
			text: {
				style: styles.text
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
				viewBox: "0 0 120 120",
				style: styles.svg
			},
			rect: {
				x: "10",
				y: "10",
				width: "100",
				height: "100",
				rx: "15",
				ry: "15",
				fill: "black",
			},
			inputSVG: {
				style: styles.inputSVG
			},
			outputSVG: {
				style: styles.outputSVG
			}
		}

		return (<div {...inputs.clientContainer}> 
					<p {...inputs.text}>
						{this.props.client['ClientName']}
					</p>
					<div {...inputs.svgContainer}>
						<svg {...inputs.svg}>
							  <rect {...inputs.rect}/>
							  
						</svg>
					</div>
					<svg {...inputs.inputSVG}>
						<ClientInputList {...inputs.clientInput}/>
					</svg>
					<svg {...inputs.outputSVG}>
						<ClientOutputList {...inputs.clientOutput}/>
					</svg>
				</div>
			);
	}
}

export default ClientGraphic;