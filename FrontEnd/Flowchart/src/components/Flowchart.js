import React, { Component, PropTypes } from 'react';
import update from 'react-addons-update';
import { DropTarget } from 'react-dnd';
import HTML5Backend from 'react-dnd-html5-backend';
import { DragDropContext } from 'react-dnd';
import Client from './Client';

const styles = {
  width: 1000,
  height: 1000,
  position: 'relative'
};

const clientTarget = {
	drop(props, monitor, component) {
		const item = monitor.getItem();
		const delta = monitor.getDifferenceFromInitialOffset();
		const left = Math.round(item.left + delta.x);
		const top = Math.round(item.top + delta.y);

		component.moveClient(item.id, left, top);
	}
};

class Flowchart extends React.Component {
	static propTypes = {
		hideSourceOnDrag: PropTypes.bool.isRequired,
		connectDropTarget: PropTypes.func.isRequired
	};

	constructor(props){
		super(props);
		this.state = {
			clients: {
				'a':{top:20,left:80, title:'A'},
				'b': {top:180,left:20,title:'B'},
				'c': {top: 50,left:50,title:'C'}
			}
		};
	}

	moveClient(id,left,top){
		console.log("Trying to move clients");
		this.setState(update(this.state, {
			clients: {
				[id]: {
					$merge: {
						left:left,
						top:top
					}
				}
			}
		}));
	}

	render() {
		const { hideSourceOnDrag, connectDropTarget} = this.props;
		const {clients} = this.state;

		return connectDropTarget(
			<div style={styles}>
				{Object.keys(clients).map(key => {
					const {left,top,title} = clients[key];
					return (
						<Client key={key}
								id={key}
								left={left}
								top={top}
								hideSourceOnDrag={hideSourceOnDrag}/>);
				})}
			</div>);
	}
}

export default DragDropContext(HTML5Backend)(DropTarget('Client', clientTarget, connect => ({connectDropTarget: connect.dropTarget()}))(Flowchart));

