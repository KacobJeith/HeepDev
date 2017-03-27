import React from 'react';
import $ from 'jquery';


class Vertex extends React.Component {
	constructor() {
		super();
		this.state = {
			color: 'black',
			strokeWidth: 3
		}
	}
	
	sendDeleteVertexToServer(url) {

		const message = 'DeleteVertex' + ':' + 
						this.props.vertex.sourceID + ',' +
						this.props.vertex.destinationID + ',' + 
						this.props.vertex.outputName + ',' +
						this.props.vertex.inputName + ',\n';

    	const messagePacket = {command: message};

		$.ajax({
	      url: url,
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	      	console.log('Vertex Deleted');
	      	this.props.deleteVertex(this.props.vertexID, this.props.vertex);
	      },
	      error: function(xhr, status, err) {
	        console.error(url, status, err.toString());
	      }
	    });
	}


	render() {

		var inputs = {
			vertex: {
				strokeWidth: this.state.strokeWidth,
				stroke: this.state.color,
				fill: 'transparent',
				d: "M".concat(	String(this.props.inputPosition['left']), 
								" ", 
								String(this.props.inputPosition['top']), 
								" Q ", 
								String(Math.round(this.props.inputPosition['left'] + 30)),
								" ",
								String(Math.round(this.props.inputPosition['top'])),
								", ",
								String(Math.round(this.props.inputPosition['left'] + (this.props.outputPosition['left'] - this.props.inputPosition['left'])/2)),
								" ", 
								String(Math.round(this.props.inputPosition['top'] + (this.props.outputPosition['top'] - this.props.inputPosition['top'])/2)),
								" T ", 
								String(this.props.outputPosition['left']), 
								" ", 
								String(this.props.outputPosition['top'])),
				onMouseEnter: () => this.setState({'color': 'red', 'strokeWidth': 4}),
				onMouseLeave: () => this.setState({'color': 'black', 'strokeWidth': 3}),
				onClick: () => this.sendDeleteVertexToServer(this.props.url.concat('/api/commands')),
			}
		}
		

		return <path {...inputs.vertex}/>;
	}
}

export default Vertex;
