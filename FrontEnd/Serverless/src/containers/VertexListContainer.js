import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Vertex from './VertexContainer'
import {deleteVertex}  from '../actions/actions'

class VertexList extends React.Component {
	render() {
		var styles = {
			vertexSVGSpace: {
				position: 'absolute',
				width: 3000,
				height: 3000,
				viewBox: '0 0 1000 1000'
			}
		}
		var inputs = {
			vertexSVGSpace: {
				style: styles.vertexSVGSpace
			}
		}
		console.log('Logging Vertexes: ', this.props.vertexList);

		var vertexes = [];
	    for (var i in this.props.vertexList) {
	    	if (i != 'selectedOutput'){
	      		vertexes.push(<Vertex key={i} vertexID={i}/>);
	    	}
	    }

	    return <svg {...inputs.vertexSVGSpace}> {vertexes} </svg>
	}
}

const mapStateToProps = (state, ownProps) => ({
	vertexList: state.vertexList,
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators({deleteVertex}, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(VertexList)

