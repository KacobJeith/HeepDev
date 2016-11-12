import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import ClientGraphic from './ClientGraphic';

class DraggableContainer extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			vertexPaths: []
		};

		//this acts as a buffer to capture the most recent user clicks without triggering re-render
		this.vertex = {
			inputName: [],
			outputName: [],
			destinationIP: [],
			destinationID: [],
			sourceID: [],
			inputPosition: {top: 0, 
							left: 0},
			outputPosition: {top: 0,
							 left: 0}
		}


	}

	componentDidMount(){

		setTimeout(this.fillVertexesFromClientlist.bind(this), 1);

	}

	fillVertexesFromClientlist() {
		
		console.log("building vertexes on initial load");
		console.log(this.props.clientList);

		for(var clientIndex in this.props.clientList) { //loop through client array
			
			var currentClient = this.props.clientList[clientIndex];
			for( var index in currentClient['VertexList']) { //loop through VertexList array in client object
				
				var currentVertex = currentClient['VertexList'][index];
				
				this.selectOutput(currentVertex['outputName'],
								  currentVertex['sourceID'],
								  this.findControlPosition(currentVertex['sourceID'],currentVertex['outputName']));

				this.selectInput(currentVertex['inputName'],
				   			  	  currentVertex['destinationIP'],
				   			  	  currentVertex['destinationID'],
				   			  	  this.findControlPosition(currentVertex['destinationID'],currentVertex['inputName']));
			}
		}

		console.log(this.state.vertexPaths);
		this.forceUpdate();
	}

	findControlPosition(sourceID,controlName){

		for(var clientIndex in this.props.clientList) {

			if(this.props.clientList[clientIndex]['ClientID'] == sourceID){

				for (var controlIndex in this.props.clientList[clientIndex]['ControlList']){

					if(this.props.clientList[clientIndex]['ControlList'][controlIndex]['ControlName'] == controlName){

						return this.props.clientList[clientIndex]['ControlList'][controlIndex]['position'];
					}
				}
			}
		}

		return {top: -50, left: -50};
	}


	selectOutput(outputName, sourceID, position){
		this.vertex['outputName'] = outputName;
		this.vertex['sourceID'] = sourceID;
		this.vertex['outputPosition'] = position;
	}

	selectInput(inputName, destinationIP, destinationID, position){
		this.vertex['inputName'] = inputName;
		this.vertex['destinationIP'] = destinationIP;
		this.vertex['destinationID'] = destinationID;
		this.vertex['inputPosition'] = position;
		
		//sourceID is assumed to be already saved...not necessarily safe assumption
		var vertexName = this.nameVertex(this.vertex['sourceID'], this.vertex['outputName'], destinationID, inputName);
		this.commitUpdatedVertexCoordinates(vertexName);
	}

	selectInputandSend(inputName, destinationIP, destinationID, position) {
		this.selectInput(inputName, destinationIP, destinationID, position);
		this.sendVertexToServer();
	}

	nameVertex(sourceID, outputName, destinationID, inputName) {
		return sourceID + '.' + outputName + '->' + destinationID + '.' + inputName;
	}

	commitUpdatedVertexCoordinates(vertexName) {

		const vertexObject = this.state.vertexPaths;
		vertexObject[[vertexName]] = {
								sourceID: this.vertex.sourceID,
								outputName: this.vertex.outputName,
								destinationID: this.vertex.destinationID,
								inputName: this.vertex.inputName,
								x1: this.vertex.outputPosition['left'],
								x2: this.vertex.inputPosition['left'],
								y1: this.vertex.outputPosition['top'],
								y2: this.vertex.inputPosition['top']
							};

		this.setState({vertexPaths: vertexObject});
	}

	updateVertexPositionsByOffset(clientID, dragOffset) {

		var currentVertexPaths = this.state.vertexPaths;

		for(var thisVertex in this.state.vertexPaths) {	//iterate through all vertexes
			
			if(this.state.vertexPaths[thisVertex]['destinationID'] == clientID ) { //check if input ID matches
				
				currentVertexPaths[thisVertex]['x2'] = currentVertexPaths[thisVertex]['x2'] + dragOffset['left'];
				currentVertexPaths[thisVertex]['y2'] = currentVertexPaths[thisVertex]['y2'] + dragOffset['top'];

			}
			else if(this.state.vertexPaths[thisVertex]['sourceID'] == clientID){ //check if output id matches
				
				currentVertexPaths[thisVertex]['x1'] = currentVertexPaths[thisVertex]['x1'] + dragOffset['left'];
				currentVertexPaths[thisVertex]['y1'] = currentVertexPaths[thisVertex]['y1'] + dragOffset['top'];
				
			}

		}

		this.setState({vertexPaths: currentVertexPaths});
	}

	sendVertexToServer() {

		const message = 'SetVertex' + ':' + 
						this.vertex.inputName + ',' + 
						this.vertex.outputName + ',' +
						this.vertex.destinationIP + ',' + 
						this.vertex.destinationID + ',' + 
						this.vertex.sourceID + '\n';

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
			flowchart: {
				height: 1000,
				width: 1000,
				position: 'relative'
			},
			vertexSVGSpace: {
				position: 'absolute',
				width: 1000,
				height: 1000,
				viewBox: '0 0 1000 1000',
				pointerEvents: 'none'
			}
		}

		let inputs = {
			flowchart: {
				style: styles.flowchart
			},
			clientGraphic: {
				key: [],
				client: [],
				top: 0,
				left: 0,
				selectInput: (inputName, destinationIP, destinationID, position) => this.selectInputandSend(inputName, destinationIP, destinationID, position),
				selectOutput: (outputName, sourceID, position) => this.selectOutput(outputName, sourceID, position),
				updateVertexPositionsByOffset: (clientID, dragOffset) => this.updateVertexPositionsByOffset(clientID, dragOffset),
			},
			vertexSVGSpace:{
				style: styles.vertexSVGSpace
			},
			vertexSVG: {
				key: [],
				strokeWidth: 2,
				stroke: "black",
				x1:0,
				x2:0,
				y1:0,
				y2:0
			}
		}

		let clientNodes = [];
		var unsetYPosition = 0;

		for( var client in this.props.clientList){
			inputs.clientGraphic['key'] = this.props.clientList[client]['ClientID'];
			inputs.clientGraphic['client'] = this.props.clientList[client];
			inputs.clientGraphic['top'] = this.props.clientList[client]['Position']['top'] - 40;
			inputs.clientGraphic['left'] = this.props.clientList[client]['Position']['left'] - 10;

			if (inputs.clientGraphic['top'] == 0){

				inputs.clientGraphic['top'] == unsetYPosition;

				clientNodes.push(<ClientGraphic {...inputs.clientGraphic}/>);

				unsetYPosition += 150;
			}
			else{

				clientNodes.push(<ClientGraphic {...inputs.clientGraphic}/>);
			}
			
		};

		var vertexDrawings = [];
		for(var thisVertex in this.state.vertexPaths){

			inputs.vertexSVG['key'] = thisVertex;
			inputs.vertexSVG['x1'] = this.state.vertexPaths[thisVertex]['x1'];
			inputs.vertexSVG['x2'] = this.state.vertexPaths[thisVertex]['x2'];
			inputs.vertexSVG['y1'] = this.state.vertexPaths[thisVertex]['y1'];
			inputs.vertexSVG['y2'] = this.state.vertexPaths[thisVertex]['y2'];

			vertexDrawings.push(<line {...inputs.vertexSVG}/>);
		}

	return (
			<div {...inputs.flowchart} ref="flowchart"> 
				
				<svg {...inputs.vertexSVGSpace}>
					{vertexDrawings}
				</svg>
				{clientNodes}
			</div>
		);

	}
}

export default DraggableContainer;