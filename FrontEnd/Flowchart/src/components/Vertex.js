import React from 'react';
import $ from 'jquery';

class Vertex extends React.Component {
	onDoubleClick() {

	}

	render() {
		var inputs = {
			vertex: {
				strokeWidth: 2,
				stroke: "black",
				x1:this.props.vertex['x1'],
				x2:this.props.vertex['x2'],
				y1:this.props.vertex['y1'],
				y2:this.props.vertex['y2'],
			}
		}
		

		return <line {...inputs.vertex}/>;
	}
}

export default Vertex;