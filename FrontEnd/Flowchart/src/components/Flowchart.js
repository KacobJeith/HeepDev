import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Client from '../containers/ClientContainer';
import VertexList from '../containers/VertexListContainer';

class Flowchart extends React.Component {
	
	sendVertexToServer(url) {

		const message = 'SetVertex' + ':' + 
						this.vertex.inputName + ',' + 
						this.vertex.outputName + ',' +
						this.vertex.destinationIP + ',' + 
						this.vertex.destinationID + ',' + 
						this.vertex.sourceID + '\n';

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
	
	updateAllConnectedClients(clientID, controlName, newVal) {
		this.updateCurCtrlValue(clientID, controlName, newVal);

		for (var thisVertex in this.state.vertexPaths){
			if (this.state.vertexPaths[thisVertex]['sourceID'] == clientID) {
				if (this.state.vertexPaths[thisVertex]['outputName'] == controlName){
					this.updateCurCtrlValue(this.state.vertexPaths[thisVertex]['destinationID'], 
										this.state.vertexPaths[thisVertex]['inputName'],
										newVal);
				}
			}
		}

		//This needs to be removed, as it is bad practice -- it is time to start using Redux
		this.forceUpdate();
	}

	updateCurCtrlValue(destinationID, controlName, newVal){
		for(var clientIndex in this.props.clientList) {
			if(this.props.clientList[clientIndex]['ClientID'] == destinationID){
				for (var controlIndex in this.props.clientList[clientIndex]['ControlList']){
					if (this.props.clientList[clientIndex]['ControlList'][controlIndex]['ControlName'] == controlName){
						this.props.clientList[clientIndex]['ControlList'][controlIndex]['CurCtrlValue'] = newVal;
					}
				}
			}
		}

	}


	render() {

		const styles = {
			flowchart: {
				height: '100%',
				width: '100%',
				position: 'relative',
				backgroundColor: '#e7e7e7',
				overflow: 'auto'
			}
		}

		let inputs = {
			flowchart: {
				style: styles.flowchart
			},
			vertexSVGSpace:{
				style: styles.vertexSVGSpace
			},
			vertexSVG: {
				url: this.props.url,
				key: [],
				vertex:[],
				removeVertex: (vertex) => this.removeVertex(vertex),
			}
		}

		var clients = [];

	    for (var i = 0; i < this.props.clientArray.length; i++) {
	      var thisClient = this.props.clientArray[i];
	      clients.push(<Client key={thisClient} ClientID={thisClient}/>);
	    }

	return (<div {...inputs.flowchart} ref="flowchart"> 
				<VertexList /> 
				{clients}
			</div>
		);

	}
}

export default Flowchart;
