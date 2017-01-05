import React from 'react';
import $ from 'jquery';
import ControlList from './ClientControls';
import DynamicIcon from './DynamicIcon';


class ClientGraphic extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			radius: 5,
			top: this.props.top,
			left: this.props.left,
		}

		this.activeInput = [];

		this.inputs = [];
		this.outputs = [];
		this.cardWorkspace = 55;

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
		for (var i=0; i < this.outputs.length; i++){
	 		this.outputs[i]['position'] = {top: clientTop + 45 + 1.5 + 25/2 + i*55, //(126*(i+1)*controlOutY/100) + 12,
	 										left: clientLeft + 250};
		}

		//input position
		var allInputPositions = [];
		for (var i=0; i < this.inputs.length; i++){
			this.inputs[i]['position'] = {top: clientTop + 45 + 1.5 + 25/2 + i*55, //+ (126*(i+1)*controlInY/100) + 12,
										   left: clientLeft + 10};
		};

		this.cardWorkspace = 50 + Math.max.apply(null,[this.outputs.length,this.inputs.length])*55;


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
	  	event.dataTransfer.setDragImage(this.refs.client, -99999,-99999);
	}

	onTouchStart(event) {

		event.preventDefault();
		this.lastPosition['left'] = event.nativeEvent.changedTouches[0].screenX;
	  	this.lastPosition['top'] = event.nativeEvent.changedTouches[0].screenY;

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

		this.sendPositionToServer(newPosition, this.props.url.concat('/api/commands'));
 		
	}

	calculateDragOffset(event) {
		// The final drag event is always 0, whichthrows off tracking unless you catch and ignore it
		if (event.screenX == 0 && event.screenY == 0){
			return;
		}

		this.runningOffset['left'] = event.screenX - this.lastPosition['left']  ;
		this.lastPosition['left'] = event.screenX;

		this.runningOffset['top'] = event.screenY - this.lastPosition['top']  ;
		this.lastPosition['top'] = event.screenY;

	}

	sendPositionToServer(newPosition, url) {

		const message = 'SetPosition' + ':' + 
						this.props.client['ClientID'] + ',' +
						newPosition['top'] + ',' + 
						newPosition['left'] + '\n';

    	const messagePacket = {command: message};

		$.ajax({
	      url: url,
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	      	
	      },
	      error: function(xhr, status, err) {
	        console.error(url, status, err.toString());
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
				width: 230,
				cursor: '-webkit-grab',
				height: this.cardWorkspace,
				position: 'absolute',
				top: this.state.top,
				left: this.state.left,
				color: 'black'
			},
			name: {
				textAlign: 'center',
				marginBottom: 5,
				height: 15,
			},
			controlsContainer: {
				position: 'relative',
				display: 'inline-flex',
				alignItems: 'center',
				width: 258,
				height: this.cardWorkspace - 20,
				left: -13,
			},
			inputContainer:{
				display:'inline-block',
				cursor: 'default',
				width: 79,
				height: this.cardWorkspace - 45,
			},
			iconContainer: {
				display: 'inline-flex',
				width: 100,
				height: (this.cardWorkspace - 25)*0.85,
				textAlign: 'center',
				verticalAlign: 'center'
			},
			outputContainer:{
				display: 'inline-block',
				cursor: 'default',
				height: this.cardWorkspace - 45,
				width: 79,
			}
		}

		const inputs = {
			clientContainer: {
				style: styles.clientContainer,
			},
			name: {
				style: styles.name,
				draggable: true,
				onDragStart : (event) => {this.onDragStart(event)},
				onDrag : (event) => {this.onDrag(event)},
				onDragEnd: (event) => {this.calculateDragPosition(event)},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.calculateDragPosition(event)},

			},
			controlsContainer: {
				style: styles.controlsContainer
			},
			inputContainer: {
				style: styles.inputContainer,
				draggable: false,
			},
			iconContainer: {
				style: styles.iconContainer,
				draggable: true,
				onDragStart : (event) => {this.onDragStart(event)},
				onDrag : (event) => {this.onDrag(event)},
				onDragEnd: (event) => {this.calculateDragPosition(event)},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.calculateDragPosition(event)},
			},
			icon: {
				url: this.props.url,
				client: this.props.client,
				width: styles.iconContainer.width,
				height: styles.iconContainer.height,
			},
			outputContainer: {
				draggable: false,
				style: styles.outputContainer
			},
			controlListInputs: {
				url: this.props.url,
				controlList: this.inputs,
				client: this.props.client,
				select: this.props.selectInput,
				top: this.state.top,
				left: this.state.left, 
			},
			controlListOutputs: {
				url: this.props.url,
				controlList: this.outputs,
				client: this.props.client,
				select: this.props.selectOutput,
				top: this.state.top,
				left: this.state.left, 
			}
		}

		return (<div {...inputs.clientContainer} ref="client"> 
					<p {...inputs.name}>
						{this.props.client['ClientName']}
					</p>
					<hr/>
					<div {...inputs.controlsContainer}>
						<div {...inputs.inputContainer}>
							<ControlList {...inputs.controlListInputs}/>
						</div>
						<div {...inputs.iconContainer}>
							<DynamicIcon {...inputs.icon}/>
						</div>
						<div {...inputs.outputContainer}>
							<ControlList {...inputs.controlListOutputs}/>
						</div>
					</div>
					
					
				</div>
			);
	}
}

export default ClientGraphic;