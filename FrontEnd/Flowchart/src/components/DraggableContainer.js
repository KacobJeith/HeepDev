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
		const vertexName = this.vertex.sourceID + '->' + this.vertex.destID;
		const vertexObject = this.state.vertexPaths;

		vertexObject[[vertexName]] = {
								x1: this.vertex.outputPosition['left'],
								x2: this.vertex.inputPosition['left'],
								y1: this.vertex.outputPosition['top'],
								y2: this.vertex.inputPosition['top']
							};

		this.setState({vertexPaths: vertexObject});


		console.log(this.state.vertexPaths);
		this.sendVertexToServer();

	}

	selectOutput(outputName, sourceID, position){
		this.vertex['outputName'] = outputName;
		this.vertex['sourceID'] = sourceID;
		this.vertex['outputPosition'] = position;
		console.log(this.vertex);
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
		console.log(this.props.clientList);
		for( var client in this.props.clientList){

			inputs.clientGraphic['key'] = this.props.clientList[client]['ClientID'];
			inputs.clientGraphic['client'] = this.props.clientList[client];

			clientNodes.push(<ClientGraphic {...inputs.clientGraphic}/>);

			inputs.clientGraphic['top'] = inputs.clientGraphic['top'] + 150;
		};

		var vertexDrawings = [];
		for(var thisVertex in this.state.vertexPaths){
			console.log("entering vertex drawing");
			inputs.vertexSVG['key'] = thisVertex;
			inputs.vertexSVG['x1'] = this.state.vertexPaths[thisVertex]['x1'];
			inputs.vertexSVG['x2'] = this.state.vertexPaths[thisVertex]['x2'];
			inputs.vertexSVG['y1'] = this.state.vertexPaths[thisVertex]['y1'];
			inputs.vertexSVG['y2'] = this.state.vertexPaths[thisVertex]['y2'];

			console.log(inputs.vertexSVG);
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