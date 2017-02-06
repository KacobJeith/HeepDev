import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Client from '../containers/ClientContainer';
import Vertex from '../containers/VertexContainer';

class Flowchart extends React.Component {
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
		setTimeout(this.fillVertexesFromClientlist.bind(this), 1000);
	}

	fillVertexesFromClientlist() {
		
		console.log("building vertexes on initial load");

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

		
		this.props.addVertex(this.state.vertexPaths);
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
		this.sendVertexToServer(this.props.url.concat('/api/commands'));
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

		var positionObj = {x1: this.vertex.outputPosition['left'],
							x2: this.vertex.inputPosition['left'],
							y1: this.vertex.outputPosition['top'],
							y2: this.vertex.inputPosition['top']}

		this.setState({vertexPaths: vertexObject});
		//this.props.positionVertex(vertexName, positionObj);
	}

	updateVertexPositionsByOffset(clientID, dragOffset) {
		var currentVertexPaths = this.state.vertexPaths;

		for(var thisVertex in this.state.vertexPaths) {	//iterate through all vertexes
			
			if(this.state.vertexPaths[thisVertex]['destinationID'] == clientID ) { //check if input ID matches
				
				currentVertexPaths[thisVertex]['x2'] = currentVertexPaths[thisVertex]['x2'] + dragOffset['left'];
				currentVertexPaths[thisVertex]['y2'] = currentVertexPaths[thisVertex]['y2'] + dragOffset['top'];


				var positionObj = {x1: currentVertexPaths[thisVertex]['x1'],
									x2: currentVertexPaths[thisVertex]['x2'],
									y1: currentVertexPaths[thisVertex]['y1'],
									y2: currentVertexPaths[thisVertex]['y2']}


				//this.props.positionVertex(thisVertex,positionObj);

			}
			else if(this.state.vertexPaths[thisVertex]['sourceID'] == clientID){ //check if output id matches
				
				currentVertexPaths[thisVertex]['x1'] = currentVertexPaths[thisVertex]['x1'] + dragOffset['left'];
				currentVertexPaths[thisVertex]['y1'] = currentVertexPaths[thisVertex]['y1'] + dragOffset['top'];

				var positionObj = {x1: currentVertexPaths[thisVertex]['x1'],
									x2: currentVertexPaths[thisVertex]['x2'],
									y1: currentVertexPaths[thisVertex]['y1'],
									y2: currentVertexPaths[thisVertex]['y2']}


				//this.props.positionVertex(thisVertex,positionObj);
				
			}

		}


		this.setState({vertexPaths: currentVertexPaths});
	}

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

	removeVertex(vertex) {
		var vertexName = this.nameVertex(vertex.sourceID, vertex.outputName, vertex.destinationID, vertex.inputName);
		var newVertexList = this.state.vertexPaths;
		delete newVertexList[vertexName];
		this.setState({vertexPaths: newVertexList});
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
			},
			vertexSVGSpace: {
				position: 'absolute',
				width: 3000,
				height: 3000,
				viewBox: '0 0 1000 1000'
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
	    console.log('app: ', this.props.clientArray);

	    for (var i = 0; i < this.props.clientArray.length; i++) {
	      var thisClient = this.props.clientArray[i];
	      clients.push(<Client key={thisClient} ClientID={thisClient}/>);
	    }

	return (<div {...inputs.flowchart} ref="flowchart"> 
				
				<svg {...inputs.vertexSVGSpace}>
					<Vertex />
				</svg>
				{clients}
			</div>
		);

	}
}

export default Flowchart;
