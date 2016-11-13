import React from 'react';
import $ from 'jquery';
import ClientInputList from './ClientInput';
import ClientOutputList from './ClientOutput';


class ClientGraphic extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 5,
			top: this.props.top,
			left: this.props.left,
		}

		this.inputs = [];
		this.outputs = [];
		this.dragging = false;
		this.dragStartTop = this.props.top;
		this.dragStartLeft = this.props.left;


		this.originX = 0;
		this.originY = 0;
		this.dragOffset = {	top: 0,
							left: 10};
		this.runningOffset = {top: 0,
							left: 0};
		this.lastPosition = {	top: 0,
							left: 10};

		this.fillInputs();
		this.fillOutputs();

	}

	componentDidMount() {
		var thisEl = this.refs.client.getClientRects();
		var clientTop = thisEl[0]["top"];
		var clientLeft = thisEl[0]["left"];

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
		//console.log("STARTDRAG");
		//console.log(this.state.top);
		//console.log(this.state.left);
	    this.originX = event.screenX;
	  	this.originY = event.screenY;
	  	this.dragStartTop = this.state.top;
	  	this.dragStartLeft = this.state.left;
	  	this.lastPosition['left'] = event.screenX;
	  	this.lastPosition['top'] = event.screenY;
	  	//console.log(this.dragStartTop)
	}

	onDrag(event) {
		this.calculateDragOffset(event);
		var newPosition = {left: this.dragStartLeft + this.dragOffset['left'],
					   		top: this.dragStartTop + this.dragOffset['top']};
		console.log(this.runningOffset);
		this.setState(newPosition);
		this.props.updateVertexPositionsByOffset(this.props.client['ClientID'], this.runningOffset);
		
	}

	calculateDragPosition(event) {
		console.log('ABORT DRAG');
		var newPosition = {left: this.state.left,
					   		top: this.state.top};

		this.sendPositionToServer(newPosition);
	}

	calculateDragOffset(event) {
		if (event.screenX == 0 && event.screenY == 0){
			console.log('skipping drag event');
			return;
		}

		this.dragOffset['left'] = event.screenX - this.originX;
		this.dragOffset['top']  = event.screenY - this.originY;

		
		
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
				selectInput: this.props.selectInput
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
					</div>
					
					
				</div>
			);
	}
}

export default ClientGraphic;