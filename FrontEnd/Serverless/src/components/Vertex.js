import React from 'react';

class Vertex extends React.Component {
	constructor() {
		super();
		this.state = {
			color: 'black',
			strokeWidth: 3
		}
	}

	sendDeleteVertexToServer(url) {
		
		this.props.deleteVertex(this.props.url, this.props.id, this.props.vertex)
	}

	render() {

		if (this.props.inputPosition == false || this.props.outputPosition == false) {
			return <g/>
		}

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
				onClick: () => this.sendDeleteVertexToServer(),
			}
		}
		

		return <path {...inputs.vertex}/>;
	}
}

export default Vertex;
