import React from 'react'
import Client from './Client'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'
import Vertex from './Vertex'

var mapStateToProps = (state) => ({
  clientArray: state.clients.clientArray,
  vertexList: Object.keys(state.vertexList),
  url: state.url
})

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

class Flowchart extends React.Component {

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
				vertex:[]
			}
		}

		var clients = [];

	    for (var i = 0; i < this.props.clientArray.length; i++) {
	      var thisClient = this.props.clientArray[i];
	      clients.push(<Client key={thisClient} ClientID={thisClient}/>);
	    }

	    var vertexes = [];
	    for (var i = 0; i < this.props.vertexList.length; i++) {
	    	if (this.props.vertexList[i] != 'selectedOutput'){
	    		var thisVertex = this.props.vertexList[i];
	      		vertexes.push(<Vertex key={thisVertex} vertexID={thisVertex}/>);
	    	}
	    }


	return (<div {...inputs.flowchart} ref="flowchart"> 
				<svg {...inputs.vertexSVGSpace}>
					{vertexes} 
				</svg>
				{clients}
			</div>
		);

	}
}


export default connect(mapStateToProps, mapDispatchToProps)(Flowchart)
