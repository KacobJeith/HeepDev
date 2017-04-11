import React from 'react';
import $ from 'jquery';
import Control from '../containers/ControlContainer';
import DynamicIcon from '../containers/IconContainer';


class Client extends React.Component {
	constructor(props) {
		super(props);

		this.cardWorkspace = 50 + Math.max.apply(null,[this.props.controlOutputs.length,this.props.controlInputs.length])*55;

		this.runningOffset = {top:  0,
							  left: 0};
		this.lastPosition =  {top:  0,
							  left: 0};

	}

	onDragStart(event) {

	  	this.lastPosition['left'] = event.pageX;
	  	this.lastPosition['top'] = event.pageY;
	  	event.dataTransfer.setDragImage(this.refs.client, 99999,99999);
	}

	onTouchStart(event) {

		event.preventDefault();
		this.lastPosition['left'] = event.nativeEvent.changedTouches[0].pageX;
	  	this.lastPosition['top'] = event.nativeEvent.changedTouches[0].pageY;

	}

	onDrag(event) {
		this.calculateDragOffset(event);
		this.props.positionClient(this.props.client.ClientID, this.runningOffset);
		//this.props.updateVertexPositionsByOffset(this.props.client['ClientID'], this.runningOffset);
	}

	calculateDragOffset(event) {
		// The final drag event is always 0, whichthrows off tracking unless you catch and ignore it
		if (event.clientX == 0 && event.clientY == 0){
			return;
		}

		this.runningOffset['left'] = event.pageX - this.lastPosition['left']  ;
		this.lastPosition['left'] = event.pageX;

		this.runningOffset['top'] = event.pageY - this.lastPosition['top']  ;
		this.lastPosition['top'] = event.pageY;

	}

	sendPositionToServer(url) {

		const message = 'SetPosition' + ':' + 
						this.props.client['ClientID'] + ',' +
						this.props.position.left + ',' + 
						this.props.position.top;

    	const messagePacket = {command: message};

		$.ajax({
	      url: this.props.url.concat('/api/commands'),
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	      	console.log(message);
	      },
	      error: function(xhr, status, err) {
	        console.error(this.props.url.concat('/api/commands'), status, err.toString());
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
				top: this.props.position.top,
				left: this.props.position.left,
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
				onDragEnd: (event) => {this.sendPositionToServer()},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.sendPositionToServer()},

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
				onDragEnd: (event) => {this.sendPositionToServer()},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.sendPositionToServer()},
			},
			icon: {
				clientID: this.props.client['ClientID'],
				controlID: this.props.controlInputs.length == 0 ? this.props.controlOutputs[0] : this.props.controlInputs[0] ,
				width: styles.iconContainer.width,
				height: styles.iconContainer.height,
			},
			outputContainer: {
				draggable: false,
				style: styles.outputContainer
			}
		}

		var controlInputs = [];
	    for (var i = 0; i < this.props.controlInputs.length; i++) {
	      controlInputs.push(<Control key={i} clientID={this.props.client['ClientID']} controlID={this.props.controlInputs[i]}/>);
	    }

	    var controlOutputs = [];
	    for (var i = 0; i < this.props.controlOutputs.length; i++) {
	      controlOutputs.push(<Control key={i} clientID={this.props.client['ClientID']} controlID={this.props.controlOutputs[i]}/>);
	    }

		return (<div {...inputs.clientContainer} ref="client"> 
					<p {...inputs.name}>
						{this.props.client['ClientName']}
					</p>
					<hr/>
					<div {...inputs.controlsContainer}>
						<div {...inputs.inputContainer}>
							{controlInputs}
						</div>
						<div {...inputs.iconContainer}>
							<DynamicIcon {...inputs.icon}/>
						</div>
						<div {...inputs.outputContainer}>
							{controlOutputs}
						</div>
					</div>
					
					
				</div>
			);
	}
}

export default Client;