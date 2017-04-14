import React from 'react';
import Client from '../containers/ClientContainer';
import VertexList from '../containers/VertexListContainer';

class Flowchart extends React.Component {

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
				vertex:[]
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
