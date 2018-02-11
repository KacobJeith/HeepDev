import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions_classic'
import Device from './Device'
import Vertex from './Vertex'

var mapStateToProps = (state) => ({
  deviceArray: state.devices.deviceArray,
  vertexList: state.vertexList
})


class Flowchart extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			hoverRefresh: false
		}
		
	}

	render() {
		console.log("Running Flowchart: ", this.props.vertexList)

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
			},
			refresh: {
			  width: 45,
			  height: 45,
			  type:"image/svg+xml",
			  data: '../assets/svg/refresh.svg',
			  style: {
			  	position: 'absolute',
			  }
			},
			refreshContainer: {
				style: {
					width: 50,
					height: 50,
					top: 2,
					left: 2,
					backgroundColor: this.state.hoverRefresh ? "rgba(0,0,0,0.1)" : "rgba(0,0,0,0)",
					cursor: "pointer",
					position: 'relative'
				}
			},
			refreshButton: {
				style: {
					width: 50,
					height: 50,
					backgroundColor: this.state.hoverRefresh ? "rgba(0,0,0,0.1)" : "rgba(0,0,0,0)",
					cursor: "pointer",
					position: 'absolute'
				},
				onClick: () => {
					console.log("clicked"); 
					this.props.refreshFlowchart();
				},
        		onMouseEnter: () => this.setState({hoverRefresh: true}),
        		onMouseLeave: () => this.setState({hoverRefresh: false})
			}
		}

		var devices = [];

	    for (var i = 0; i < this.props.deviceArray.length; i++) {
	      var thisDevice = this.props.deviceArray[i];
	      devices.push(<Device key={thisDevice} DeviceID={thisDevice}/>);
	    }

	    var vertexes = [];
	    var vertexKeys = Object.keys(this.props.vertexList);
	    for (var i = 0; i < vertexKeys.length; i++) {
	    	if (vertexKeys[i] != 'selectedOutput'){
	    		var thisVertex = vertexKeys[i];
	      		vertexes.push(<Vertex key={thisVertex} vertexID={thisVertex}/>);
	    	}
	    }


	return (<div {...inputs.flowchart} ref="flowchart"> 
				<div {...inputs.refreshContainer}>
					<object {...inputs.refresh}/>
					<div {...inputs.refreshButton}/>
				</div>

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
