import React from 'react';
import $ from 'jquery';
import ClientGraphic from './ClientGraphic';

class DraggableContainer extends React.Component {
	constructor(props) {
		super(props);
		this.state = {};

		this.vertex = {
			inputName: [],
			outputName: [],
			destIP: [],
			destID: [],
			sourceID: []
		}
	}

	selectInput(inputName, destIP, destID) {
		this.vertex['inputName'] = inputName;
		this.vertex['destIP'] = destIP;
		this.vertex['destID'] = destID;
		console.log(this.vertex);
		this.sendVertexToServer();
	}

	selectOutput(outputName, sourceID){
		this.vertex['outputName'] = outputName;
		this.vertex['sourceID'] = sourceID;
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

		}

		let inputs = {
			clientGraphic: {
				client: [],
				selectInput: (inputName, destIP, destID) => this.selectInput(inputName, destIP, destID),
				selectOutput: (outputName, sourceID) => this.selectOutput(outputName, sourceID),
			}
		}

		let clientNodes = [];
		console.log(this.props.clientList);
		for( var client in this.props.clientList){
			inputs.clientGraphic['client'] = this.props.clientList[client];
			clientNodes.push(<ClientGraphic {...inputs.clientGraphic}/>);
		};

		return (
			<div> 
				{clientNodes}
			</div>
		);

	}
}

export default DraggableContainer;