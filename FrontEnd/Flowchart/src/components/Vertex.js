import React from 'react';
import $ from 'jquery';

class Vertex extends React.Component {
	constructor() {
		super();
		this.state = {
			color: 'black'
		}
	}
	
	sendDeleteVertexToServer() {
		console.log("Deleting Vertex");

		const message = 'DeleteVertex' + ':' + 
						this.props.vertex.sourceID + ',' +
						this.props.vertex.destinationID + ',' + 
						this.props.vertex.outputName + ',' +
						this.props.vertex.inputName + ',\n';

    	const messagePacket = {command: message};

		$.ajax({
	      url: '/api/commands',
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	      },
	      error: function(xhr, status, err) {
	        console.error('/api/commands', status, err.toString());
	        console.log('Hitting sendDeleteVertexToServer error');
	      }
	    });
	}


	render() {
		var inputs = {
			vertex: {
				strokeWidth: 3,
				stroke: this.state.color,
				x1:this.props.vertex['x1'],
				x2:this.props.vertex['x2'],
				y1:this.props.vertex['y1'],
				y2:this.props.vertex['y2'],
				onMouseEnter: () => this.setState({'color': 'red'}),
				onMouseLeave: () => this.setState({'color': 'black'}),
				onDoubleClick: () => this.sendDeleteVertexToServer(),
			}
		}
		

		return <line {...inputs.vertex}/>;
	}
}

export default Vertex;