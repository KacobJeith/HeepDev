import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions_classic'
import Device from './Device'
import Vertex from './Vertex'

var mapStateToProps = (state) => ({
  deviceArray: state.devices.deviceArray,
  vertexList: Object.keys(state.vertexList)
})


class Flowchart extends React.Component {

	render() {
		console.log("Running Flowchart")

		const styles = {
			flowchart: {
				height: 3000,
				width: 3000,
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
				key: [],
				vertex:[]
			}
		}

		var devices = [];

	    for (var i = 0; i < this.props.deviceArray.length; i++) {
	      var thisDevice = this.props.deviceArray[i];
	      devices.push(<Device key={thisDevice} DeviceID={thisDevice}/>);
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
				{devices}
			</div>
		);

	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Flowchart))
