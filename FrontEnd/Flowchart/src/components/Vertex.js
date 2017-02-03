import React from 'react';
import $ from 'jquery';

class VertexList extends React.Component {
	render() {
		let inputs = {
			eachVertex: {
				url: this.props.url,
				key: [],
				vertex: []
			}
		};

		let allVertexes = this.props.vertexList.map((thisVertex,index) => {
			
			inputs.eachVertex['key'] = index;
			inputs.eachVertex['vertex'] = thisVertex;
			
			return <Vertex {...inputs.eachVertex}/>
			});

		return (<g>
					{allVertexes}
				</g>
				);
	}
}



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
	      	this.props.removeVertex(this.props.vertex);
	      },
	      error: function(xhr, status, err) {
	        console.error(url, status, err.toString());
	        console.log('Hitting sendDeleteVertexToServer error');
	      }
	    });
	}


	render() {
		var inputs = {
			vertex: {
				strokeWidth: this.state.strokeWidth,
				stroke: this.state.color,
				fill: 'transparent',
				d: "M".concat(	String(this.props.vertex['x1']), 
								" ", 
								String(this.props.vertex['y1']), 
								" Q ", 
								String(Math.round(this.props.vertex['x1'] + 30)),
								" ",
								String(Math.round(this.props.vertex['y1'])),
								", ",
								String(Math.round(this.props.vertex['x1'] + (this.props.vertex['x2'] - this.props.vertex['x1'])/2)),
								" ", 
								String(Math.round(this.props.vertex['y1'] + (this.props.vertex['y2'] - this.props.vertex['y1'])/2)),
								" T ", 
								String(this.props.vertex['x2']), 
								" ", 
								String(this.props.vertex['y2'])),
				onMouseEnter: () => this.setState({'color': 'red', 'strokeWidth': 4}),
				onMouseLeave: () => this.setState({'color': 'black', 'strokeWidth': 3}),
				onClick: () => this.sendDeleteVertexToServer(this.props.url.concat('/api/commands')),
			}
		}
		

		return <path {...inputs.vertex}/>;
	}
}

export default VertexList;