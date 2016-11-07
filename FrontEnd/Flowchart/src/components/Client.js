import React, { Component, PropTypes } from 'react';
import { DragSource } from 'react-dnd';

const style = {
  position: 'absolute',
  border: '1px dashed gray',
  backgroundColor: 'white',
  padding: '0.5rem 1rem',
  cursor: 'move',
};

const clientSource = {
	beginDrag(props) {
		const { id, left, top } = props;
    	return { id, left, top };
	}
};

var collect = (connect, monitor) => {
	return {
		connectDragSource: connect.dragSource(),
		isDragging: monitor. isDragging(),

	}
};

class Client extends Component {
	static propTypes = {
		connectDragSource: PropTypes.func.isRequired,
		isDragging: PropTypes.bool.isRequired,
		id: PropTypes.bool.isRequired,
		left: PropTypes.any.isRequired,
		top: PropTypes.number.isRequired,
		hideSourceOnDrag: PropTypes.bool.isRequired,
		children: PropTypes.node
	};



	render() {
		const { hideSourceOnDrag,
				left,
				top,
				connectDragSource,
				isDragging,
				children} = this.props;

		if(isDragging && hideSourceOnDrag){
			return null;
		}

		return connectDragSource(
			<div style={{...style,left,top}}>

				<svg width="100" height="100" viewBox="0 0 120 120">
					  <rect x="10" y="10" width="100" height="100" rx="15" ry="15"/>
				</svg>
			</div>

			);
	}
}

Client.propTypes = {
	connectDragSource: PropTypes.func.isRequired,
	isDragging: PropTypes.bool.isRequired
};

export default DragSource('Client', clientSource, collect)(Client);