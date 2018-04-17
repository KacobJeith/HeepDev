import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions_classic'
import * as Draggable from 'gsap/Draggable'

import Device from './DevicePaper'
import Vertex from './Vertex'
import DeviceDetailsPanel from '../heep/DeviceDetailsPanel'
import { withTheme } from 'material-ui/styles'

import Add from 'material-ui-icons/Add'
import Remove from 'material-ui-icons/Remove'
import { Button }  from 'material-ui'

var mapStateToProps = (state) => ({
  deviceArray: Object.keys(state.devices),
  vertexList: state.vertexList,
  scale: state.flowchart.scale,
  detailsPanelOut: state.detailsPanelDeviceID != null
})


class Flowchart extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			hoverRefresh: false
		}
	};

	componentDidMount() {
		this.initializeDrag();
	}

	flowchartOptions() {

		return (
			<div style={{
				position:'fixed', 
				bottom:  this.props.theme.spacing.unit, 
				right: this.props.detailsPanelOut ? 258 + this.props.theme.spacing.unit :  this.props.theme.spacing.unit

			}}>
				<Button 
					mini
					variant="fab" 
					color="primary" 
					aria-label="zoom-out" 
					onClick={() => this.props.zoomOut()}
					style={{marginRight: this.props.theme.spacing.unit}}
				>
					<Remove/>
				</Button>
				<Button 
					mini
					variant="fab" 
					color="primary" 
					aria-label="zoom-in" 
					onClick={() => this.props.zoomIn()}
				>
					<Add/>
				</Button>
				
			</div>
		)
	}

	drawVertices() {

		const inputs = {
			vertexSVGSpace: {
        	id: 'vertexSVGSpace',
				style: {
					position: 'absolute',
					width: 3000,
					height: 3000,
					viewBox: '0 0 1000 1000',
          			top: 0,
          			left: 0,
				},
			}
		}

		return (
			<svg {...inputs.vertexSVGSpace}>
				{Object.keys(this.props.vertexList).map((thisVertexKey) => {
					if (thisVertexKey != 'selectedOutput'){
              return <Vertex key={thisVertexKey} vertexID={thisVertexKey} />
					}
				})}
			</svg>
		)
	};

  drawDevices() {
    return (
      <div>
        {this.props.deviceArray.map((thisDevice) => (
          <div className="draggableDevice" id={thisDevice} key={thisDevice}>
                <Device DeviceID={thisDevice}/>
          </div>
        ))}
      </div>
    )
}


  initializeDrag () {
    Draggable.create(".draggableDevice", {
      type: "x,y",
      allowContextMenu: true,
      onDrag: () => this.props.updateVertex(),
    });
  }

	render() {

		const inputs = {
			flowchart: {
				style: {
					height: 3000,
					width: 3000,
					backgroundColor: '#e7e7e7',
					overflow: 'auto'
				}
			},
			refresh: {
			  width: 45,
			  height: 45,
			  type:"image/svg+xml",
			  data: './dist/assets/svg/refresh.svg',
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
			},
      		deviceContainer: {
		        style: {
		          position: 'absolute',
		          width: '100%',
		          height: '100%',
		          background: 'none',
		          pointerEvents: 'none'
		        }
		    }
		}

		return (
			<div {...inputs.flowchart} ref="flowchart">
				<div style={{
						transform: 'scale(' + this.props.scale + ')',
		          		transformOrigin: 'top left'
		          	}}>
					<div id="deviceContainer" {...inputs.deviceContainer}>
					
						{this.drawVertices()}
						{this.drawDevices()}
					</div>
				</div>
				{this.flowchartOptions()}
				<DeviceDetailsPanel/>
			</div>
		);

	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(Flowchart)))
