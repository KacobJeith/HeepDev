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
			displayControl: false,
			icon: 'none'
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
	 	var controlOutY = 100/(this.outputs.length + 1);

		for (var i=0; i < this.outputs.length; i++){
	 		this.outputs[i]['position'] = {top: clientTop + 25 + 25 + i*55, //(126*(i+1)*controlOutY/100) + 12,
	 										left: clientLeft + 250};
		}

		//input position
		var allInputPositions = [];
		var controlInY = 100/(this.inputs.length + 1);
		for (var i=0; i < this.inputs.length; i++){
			this.inputs[i]['position'] = {top: clientTop + 25 + 25 + i*55, //+ (126*(i+1)*controlInY/100) + 12,
										   left: clientLeft + 10};
		};

		this.cardWorkspace = 50 + Math.max.apply(null,[this.outputs.length,this.inputs.length])*55;

		this.setIconPath();

	}

	setIconPath() {
		var subdirectory = 'default';
		if (this.props.client['IconCustom'] == 1 ){
			subdirectory = String(this.props.client['ClientID']);
		}

		this.setState({icon: '/static/assets/' + subdirectory + '/' + this.props.client['IconName'] + '.svg'});
		
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

	handlePopupClick(event, activeInput) {
		this.controlPosition = {top: event.pageY - this.state.top - 50,
								left: event.pageX - this.state.left - 30};
		if (activeInput == this.activeInput && this.state.displayControl){
			this.setState({displayControl: false});
		}
		else {
			this.setState({displayControl: true});
			this.activeInput = activeInput;
		}
														
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
				height: this.cardWorkspace,
				position: 'absolute',
				top: this.state.top,
				left: this.state.left,
				color: 'black'
			},
			name: {
				textAlign: 'center',
				cursor: '-webkit-grab',
				marginBottom: 10,
				height: 15,
			},
			controlsContainer: {
				position: 'relative',
				display: 'inline-flex',
				alignItems: 'center',
				width: 258,
				height: this.cardWorkspace - 25,
				left: -13,
			},
			inputContainer:{
				display:'inline-block',
				width: 79,
				height: this.cardWorkspace - 25,
			},
			iconContainer: {
				display: 'table-cell',
				width: 100,
				height: (this.cardWorkspace - 25)*0.85,
				textAlign: 'center',
				verticalAlign: 'center'
			},
			icon: {
				height: (this.cardWorkspace - 25)*0.85,
				width: 100,
				position: 'block',
				marginLeft: 'auto',
				marginRight: 'auto',
				verticalAlign: 'center'
			},
			outputContainer:{
				display: 'inline-block',
				height: this.cardWorkspace - 25,
				width: 79,
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
			name: {
				style: styles.name
			},
			controlsContainer: {
				style: styles.controlsContainer
			},
			inputContainer: {
				style: styles.inputContainer
			},
			clientInput:{
				inputs: this.inputs,
				client: this.props.client,
				top: this.state.top,
				left: this.state.left,
				selectInput: this.props.selectInput,
				displayControl: (event, activeInput) => this.handlePopupClick(event, activeInput),
			},
			iconContainer: {
				style: styles.iconContainer
			},
			icon: {
				src: this.state.icon,
				style: styles.icon
			},
			outputContainer: {
				style: styles.outputContainer
			},
			clientOutput: {
				containerWidth: styles.clientContainer['width'],
				outputs: this.outputs,
				client: this.props.client,
				selectOutput: this.props.selectOutput,
				top: this.state.top,
				left: this.state.left,
			}
		}

		return (<div {...inputs.clientContainer} ref="client"> 
					<p {...inputs.name}>
						{this.props.client['ClientName']}
					</p>
					<div {...inputs.controlsContainer}>
						<div {...inputs.inputContainer}>
							<ClientInputList {...inputs.clientInput}/>
						</div>
						<div {...inputs.iconContainer}>
							<img {...inputs.icon}/>
						</div>
						<div {...inputs.outputContainer}>
							<ClientOutputList {...inputs.clientOutput}/>
						</div>
					</div>
					
					
				</div>
			);
	}
}

export default ClientGraphic;