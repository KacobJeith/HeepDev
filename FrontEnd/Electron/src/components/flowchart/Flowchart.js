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
import PhotoCamera from 'material-ui-icons/PhotoCamera'
import SwitchCamera from 'material-ui-icons/SwitchCamera'
import { Button, Tooltip }  from 'material-ui'

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
			hoverRefresh: false
		}
	};

	componentWillMount() {
		this.props.setDetailsPanelDeviceID(null);
	}

	componentDidMount() {
		this.dragFlowchart()
	}

	dragFlowchart() {
	  Draggable.create("#deviceContainer", {
	    type: "x, y",
	    bounds: "#flowchart",
	    edgeResistance: 1,
	    allowContextMenu: true,
	    zIndexBoost: false,
	    onDrag: () => this.props.updateVertex()
	  });
	}

	flowchartOptions() {
		return (
			<div
				id='flowchartOptions'
				style={{
					position:'fixed',
					display: 'flex',
					flexDirection: 'row-reverse',
					bottom:  this.props.theme.spacing.unit,
					right: this.props.theme.spacing.unit
			}}>

				<Tooltip id="tooltip-range"
				            title={Math.round(this.props.scale * 100) + "%"}
				            placement="top">
				    <div>
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
				</Tooltip>
				<Tooltip id="tooltip-save-state"
				            title='Save State Snapshot'
				            placement="top">
					<Button
						mini
						variant="fab"
						color="primary"
						aria-label="zoom-out"
						onClick={() => this.props.saveState()}
						style={{marginRight: this.props.theme.spacing.unit}}
					>
						<PhotoCamera/>
					</Button>
				</Tooltip>
				<Tooltip id="tooltip-snapshot-return"
				            title='Return to Snapshot'
				            placement="top">
					<Button
						mini
						variant="fab"
						color="primary"
						aria-label="snapshot-return"
						onClick={() => this.props.returnToSnapshot()}
						style={{marginRight: this.props.theme.spacing.unit}}
					>
						<SwitchCamera/>
					</Button>
				</Tooltip>
			</div>
		)
	};

	drawVertices() {

		const inputs = {
			vertexSVGSpace: {
				id: 'vertexSVGSpace',
				style: {
					position: 'absolute',
					width: 10000,
					height: 10000,
					viewBox: '0 0 4000 4000',
					top: 0,
					left: 0,
					overflow: 'hidden'
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
					height: 5000,
					width: 5000
				}
			},
			flowchart: {
				style: {
					height: window.innerHeight,
					width: window.innerWidth,
					margin: 0,
					backgroundColor: 'rgba(0, 0, 0, 0.54)',
					overflow: "hidden"
				}
			},
			deviceContainer: {
			    style: {
					position: 'relative',
					width: 3000,
					height: 3000,
					background: '#e7e7e7',
			  		overflow: 'hidden'
			    }
			}
		}

		return (
      <div {...inputs.pageContainer}>
			<div id="flowchart" {...inputs.flowchart} ref="flowchart">
					<div id="deviceContainer" {...inputs.deviceContainer}>
            <div style={{
    						transform: 'scale(' + this.props.scale + ')',
    		          		transformOrigin: 'top left',
                      width: '100%',
                      height: '100%',
                      overflow: 'hidden'
    		          	}}>
						{this.drawVertices()}
						{this.drawDevices()}
					</div>
				</div>
				{this.flowchartOptions()}
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
