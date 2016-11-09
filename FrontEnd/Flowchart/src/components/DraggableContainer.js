import React from 'react';
import $ from 'jquery';
import ClientGraphic from './ClientGraphic';

class DraggableContainer extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			vertexPaths: {}
		};

		this.vertex = {
			inputName: [],
			outputName: [],
			destIP: [],
			destID: [],
			sourceID: [],
			inputPosition: {top: 0, 
							left: 0},
			outputPosition: {top: 0,
							 left: 0}
		}
	}

	selectInput(inputName, destIP, destID, position) {
		this.vertex['inputName'] = inputName;
		this.vertex['destIP'] = destIP;
		this.vertex['destID'] = destID;
		this.vertex['inputPosition'] = position;
		
		var vertexName = this.getVertexNameFromSavedIO();
		this.commitUpdatedVertexCoordinates(vertexName);

		console.log(this.state.vertexPaths);
		this.sendVertexToServer();

	}

	getVertexNameFromSavedIO(){
		return this.vertex.sourceID + '->' + this.vertex.destID;
	}

	commitUpdatedVertexCoordinates(vertexName) {

		const vertexObject = this.state.vertexPaths;
		vertexObject[[vertexName]] = {
								sourceID: this.vertex.sourceID,
								destID: this.vertex.destID,
								x1: this.vertex.outputPosition['left'],
								x2: this.vertex.inputPosition['left'],
								y1: this.vertex.outputPosition['top'],
								y2: this.vertex.inputPosition['top']
							};

		this.setState({vertexPaths: vertexObject});
	}

	updateVertexPositions(clientID, dragOffset) {
		console.log("entering updateVertexPositions");
		console.log(dragOffset);
		console.log(clientID);

		var currentVertexPaths = this.state.vertexPaths;

		for(var thisVertex in this.state.vertexPaths) {	//iterate through all vertexes
			
			if(this.state.vertexPaths[thisVertex]['destID'] == clientID ) { //check if input ID matches
				
				console.log('apply offset to position2');
				currentVertexPaths[thisVertex]['x2'] = currentVertexPaths[thisVertex]['x2'] + dragOffset['left'];
				currentVertexPaths[thisVertex]['y2'] = currentVertexPaths[thisVertex]['y2'] + dragOffset['top'];

			}
			else if(this.state.vertexPaths[thisVertex]['sourceID'] == clientID){ //check if output id matches
				console.log('//apply offset to position1');
				currentVertexPaths[thisVertex]['x1'] = currentVertexPaths[thisVertex]['x1'] + dragOffset['left'];
				currentVertexPaths[thisVertex]['y1'] = currentVertexPaths[thisVertex]['y1'] + dragOffset['top'];
				
			}

		}

		this.setState({vertexPaths: currentVertexPaths});
		console.log(this.state.vertexPaths);
	}

	selectOutput(outputName, sourceID, position){
		this.vertex['outputName'] = outputName;
		this.vertex['sourceID'] = sourceID;
		this.vertex['outputPosition'] = position;
	}

	sendVertexToServer() {

		const message = 'SetVertex' + ':' + 
						this.vertex.inputName + ',' + 
						this.vertex.outputName + ',' +
						this.vertex.destIP + ',' + 
						this.vertex.destID + ',' + 
						this.vertex.sourceID + '\n';

    	const messagePacket = {command: message};

		$.ajax({
	      url: '/api/commands',
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	        this.vertex['inputName'] = [];
			this.vertex['destIP'] = [];
			this.vertex['destID'] = [];
			this.vertex['outputName'] = [];
			this.vertex['sourceID'] = [];
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
				viewBox: '0 0 1000 1000'
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
				selectInput: (inputName, destIP, destID, position) => this.selectInput(inputName, destIP, destID, position),
				selectOutput: (outputName, sourceID, position) => this.selectOutput(outputName, sourceID, position),
				updateVertexPositions: (clientID, dragOffset) => this.updateVertexPositions(clientID, dragOffset),
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

		for( var client in this.props.clientList){

			inputs.clientGraphic['key'] = this.props.clientList[client]['ClientID'];
			inputs.clientGraphic['client'] = this.props.clientList[client];

			clientNodes.push(<ClientGraphic {...inputs.clientGraphic}/>);

			inputs.clientGraphic['top'] = inputs.clientGraphic['top'] + 150;
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
			<div {...inputs.flowchart}> 
				<svg {...inputs.vertexSVGSpace}>
					{vertexDrawings}
				</svg>
				{clientNodes}
			</div>
		);

	}
}

export default DraggableContainer;