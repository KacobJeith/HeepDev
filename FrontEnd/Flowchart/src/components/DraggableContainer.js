import React from 'react';
import ClientGraphic from './ClientGraphic';

class DraggableContainer extends React.Component {
	render() {

		let clientNodes = [];
		console.log(this.props.clientList);
		for( var client in this.props.clientList){
			clientNodes.push(<ClientGraphic client={ this.props.clientList[client]}/>);
		};

		return (
			<div> 
				{clientNodes}
			</div>
		);

	}
}

export default DraggableContainer;