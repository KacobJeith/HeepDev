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
import FlowchartOptions from './FlowchartOptions'

var mapStateToProps = (state) => ({
  deviceArray: Object.keys(state.devices),
  vertexList: state.vertexList,
  scale: state.flowchart.scale,
  detailsPanelOut: state.detailsPanelDeviceID != null,
})

class Flowchart extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
      		resize: false
		}
	}

	componentWillMount() {
		this.props.setDetailsPanelDeviceID(null);
	}

	componentDidMount() {
		this.dragFlowchart()
    	window.addEventListener("resize", this.resizedWindow.bind(this))
	}

	dragFlowchart() {
	  Draggable.create("#deviceContainer", {
	    type: "x, y",
	    bounds: "#flowchart",
	    edgeResistance: 0.9,
	    allowContextMenu: true,
	    zIndexBoost: false,
	    onDrag: () => this.props.updateVertex()
	  });
	}

	resizedWindow() {
		this.setState({resize: !this.state.resize})
	}

	drawVertices() {

		const inputs = {
			vertexSVGSpace: {
				id: 'vertexSVGSpace',
				style: {
					position: 'absolute',
					width: "100%",
					height: "100%",
					top: 0,
					left: 0,
					overflow: 'hidden',
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
        {this.props.deviceArray.map((thisDevice) => {
          return (
            <Device key={thisDevice} DeviceID={thisDevice}/>
          )
        })}
      </div>
    )
  };

	render() {

		const inputs = {
			pageContainer: {
					style: {
					backgroundColor: '#e7e7e7',
					height: 4000,
					width: 4000,
				}
			},
			flowchart: {
				style: {
					height: document.documentElement.clientHeight - 64,
					width: document.documentElement.clientWidth - 72,
					margin: 0,
					backgroundColor: 'rgba(0, 0, 0, 0.54)',
					overflow: 'hidden'
				}
			},
			deviceContainer: {
			    style: {
					position: 'relative',
					width: 3000,
					height: 2000,
					overflow: 'hidden',
					backgroundColor: '#e7e7e7',
			    }
			},
			deviceBounds: {
				style: {
					width: 2700,
					height: 1700,
				}
			}
		}

		return (
		<div {...inputs.pageContainer}>
			<div id="flowchart" {...inputs.flowchart} ref="flowchart">
				<div id="deviceContainer" {...inputs.deviceContainer}>
					<div id='deviceBounds' {...inputs.deviceBounds}>
						<div id="zoomContainer"
							style={{
								transform: 'scale(' + this.props.scale + ')',
								transformOrigin: 'top left',
								width: 50000,
								height: 50000,
								overflow: 'hidden',
						}}>
							{this.drawVertices()}
							{this.drawDevices()}
						</div>
					</div>
				</div>
				<FlowchartOptions/>
				<DeviceDetailsPanel/>
			</div>
		</div>
		);

	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(Flowchart)))
