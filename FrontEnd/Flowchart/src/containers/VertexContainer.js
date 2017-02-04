import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Vertex from '../components/Vertex'
import * as Actions  from '../actions/actions'

class VertexList extends React.Component{
	render() {
		
		console.log('vertexlist', this.props);

		var vertexes = [];

		for ( var vertex in this.props.vertexList){

			vertexes.push(<Vertex key={vertex} vertex={this.props.vertexList[vertex]}/>)
		}

		return ( <g> {vertexes} </g>)
	}

}

const mapStateToProps = (state) => ({
  url: state.url,
  vertexList: state.vertexList
})

function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(VertexList)

