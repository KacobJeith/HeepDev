import React from 'react';
import $ from 'jquery';
import ClientInputList from './ClientInput';
import ClientOutputList from './ClientOutput';
import ControlPopup from './ControlPopup';


class ClientGraphic extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 5,
			top: this.props.top,
			left: this.props.left,
			displayControl: false
		}

		this.activeInput = [];

		this.inputs = [];
		this.outputs = [];

		this.runningOffset = {top:  0,
							  left: 0};
		this.lastPosition =  {top:  0,
							  left: 0};

		this.controlPosition = {top: 0, 
								left: 0};

		this.fillInputs();
		this.fillOutputs();

	}

	componentDidMount() {
		var thisEl = this.refs.client.getClientRects();
		var clientTop = thisEl[0]["top"];
		var clientLeft = thisEl[0]["left"];

		if (this.props.sidebarVisible){
			clientLeft = clientLeft - 250;
		}

		this.setState({top: clientTop});
	 	this.setState({left: clientLeft});

	 	//output position
	 	var controlOutY = 100/(this.outputs.length + 1);

		for (var i=0; i < this.outputs.length; i++){
	 		this.outputs[i]['position'] = {top: clientTop + (126*(i+1)*controlOutY/100) + 12,
	 										left: clientLeft + 219.33};
		}

		//input position
		var allInputPositions = [];
		var controlInY = 100/(this.inputs.length + 1);
		for (var i=0; i < this.inputs.length; i++){
			this.inputs[i]['position'] = {top: clientTop + (126*(i+1)*controlInY/100) + 12,
										   left: clientLeft + 10};
		};

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

	onDragStart(event) {

	  	this.lastPosition['left'] = event.screenX;
	  	this.lastPosition['top'] = event.screenY;
	  	console.log(event.screenX);
	  	console.log(event.screenY);
		
	}

	onDrag(event) {

		this.calculateDragOffset(event);
		var newPosition = {left: this.state['left'] + this.runningOffset.left,
					   		top: this.state['top'] + this.runningOffset.top};
		
		this.setState(newPosition);
		this.props.updateVertexPositionsByOffset(this.props.client['ClientID'], this.runningOffset);
		
	}

	calculateDragPosition(event) {
		
		var newPosition = {left: this.state.left,
					   		top: this.state.top};

		this.sendPositionToServer(newPosition);
 		
	}

	calculateDragOffset(event) {
		// The final drag event is always 0, whichthrows off tracking unless you catch and ignore it
		if (event.screenX == 0 && event.screenY == 0){
			console.log('skipping drag event');
			return;
		}

		this.runningOffset['left'] = event.screenX - this.lastPosition['left']  ;
		this.lastPosition['left'] = event.screenX;

		this.runningOffset['top'] = event.screenY - this.lastPosition['top']  ;
		this.lastPosition['top'] = event.screenY;

	}

	sendPositionToServer(newPosition) {

		const message = 'SetPosition' + ':' + 
						this.props.client['ClientID'] + ',' +
						newPosition['top'] + ',' + 
						newPosition['left'] + '\n';

    	const messagePacket = {command: message};

		$.ajax({
	      url: '/api/commands',
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	      },
	      error: function(xhr, status, err) {
	        console.error('/api/commands', status, err.toString());
	        console.log('Hitting sendVertexToServer error');
	      }
	    });
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
				width: 200,
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
			}
		}

		const inputs = {
			clientContainer: {
				style: styles.clientContainer,
				draggable: true,
				onDragStart : (event) => {this.onDragStart(event)},
				onDrag : (event) => {this.onDrag(event);},
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
				top: this.state.top,
				left: this.state.left,
				selectInput: this.props.selectInput,
				displayControl: (event, activeInput) => {this.controlPosition = {top: event.pageY - this.state.top - 50,
																	left: event.pageX - this.state.left - 30};
														this.setState({displayControl: true});
														this.activeInput = activeInput;
														},
			},
			clientOutput: {
				containerWidth: styles.clientContainer['width'],
				outputs: this.outputs,
				client: this.props.client,
				selectOutput: this.props.selectOutput,
				top: this.state.top,
				left: this.state.left,
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
			controlPopup: {
				top: this.controlPosition['top'],
				left: this.controlPosition['left'],
				activeInput: this.activeInput,
			}
		}


		return (<div {...inputs.clientContainer} ref="client"> 
					<p {...inputs.text}>
						{this.props.client['ClientName']}
					</p>
					<div {...inputs.svgContainer}>
						<svg {...inputs.svg}>
							  <rect {...inputs.rect}/>
						</svg>
						<ClientInputList {...inputs.clientInput}/>
						<ClientOutputList {...inputs.clientOutput}/>
						{this.state.displayControl ? <ControlPopup {...inputs.controlPopup}/> : null}
					</div>
					
					
				</div>
			);
	}
}

export default ClientGraphic;