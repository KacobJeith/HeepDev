import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as newActions from '../../redux/actions'
import Control from './Controls';
import DynamicIcon from './DynamicIcon';
import { Paper, Button, Typography, Grid, IconButton, Collapse } from 'material-ui'
import { withTheme } from 'material-ui/styles'
import InfoOutline from 'material-ui-icons/InfoOutline'
import KeyboardArrowDown from 'material-ui-icons/KeyboardArrowDown'
import { TweenLite } from 'gsap'

var mapStateToProps = (state, ownProps) => ({
  device: state.devices[ownProps.DeviceID],
  deviceID: ownProps.DeviceID,
  collapsed: state.flowchart.devices[ownProps.DeviceID] ? state.flowchart.devices[ownProps.DeviceID].collapsed : false,
  controlInputs: state.controls.controlStructure[ownProps.DeviceID].inputs,
  controlOutputs: state.controls.controlStructure[ownProps.DeviceID].outputs,
  detailsPanelDeviceID: state.detailsPanelDeviceID
})


class Device extends React.Component {
	constructor(props) {
		super(props);

	}

	deviceName = () => (
		<Typography variant='subheading' align='center' style={{userSelect: 'none', fontWeight: 'bold', fontSize: 18}}>
			{this.props.device.name}
		</Typography>
	);

	drawControls(controlList) {
		return (
			<div >
				{controlList.map((controlKey) => {
					return <Control key={controlKey} deviceID={this.props.device.deviceID} controlID={controlKey}/>
				}
				)}
			</div>
		)
	};

	drawDeviceIcon() {
		const svgIcon = {
			style: {
			  maxHeight: '100%',
			  maxWidth: '100%'
			},
			width: '100%',
	        type:"image/svg+xml",
	        data: "src/assets/svg/" + this.props.device.iconName + ".svg"
		}


		return (
			<div style={{position:'relative'}}>
				<object {...svgIcon}  />
				<div style={{position:'absolute', top:0, left:0, width:'100%', height:'100%', cursor:'grab'}}/>
			</div>
		)
	};

	drawOptions() {
		const inputs= {
      buttonContainer: {
        style: {
          position: 'absolute',
          top: 11,
          right: 5
        }
      },
      infoButton: {
  			style: {
          padding: 0,
          height: 30,
          width: 30
        },
  			color: this.props.detailsPanelDeviceID == this.props.device.deviceID ? 'secondary' : 'default',
  			onClick: () => this.props.detailsPanelDeviceID == this.props.device.deviceID ?
  							this.props.setDetailsPanelDeviceID(null) :
  							this.props.setDetailsPanelDeviceID(this.props.device.deviceID)
			},
      collapseButton: {
        style: {
          padding: 0,
          height: 30,
          width: 30
        },
  			color:  this.props.collapsed ? 'secondary' : 'default',
  			onClick: () => this.animateCollapse()
      }
    }

		return (
      <div {...inputs.buttonContainer}>
  			<Grid container justify='flex-end' spacing={0}>
          <Grid item xs={12}>
            <IconButton {...inputs.collapseButton}>
    					<KeyboardArrowDown/>
    				</IconButton>
            <IconButton {...inputs.infoButton}>
    					<InfoOutline/>
    				</IconButton>
          </Grid>
  			</Grid>
      </div>
		)
	};

  drawTopItems() {
    const inputs = {
      titleContainer: {
        style: {
          height: 25
        }
      },
      rxCircle: {
        id: this.props.deviceID+ '_rx',
        cx: 5,
        cy: 15,
        r: 8,
        fill: 'none',
      },
      txCircle: {
        id: this.props.deviceID+ '_tx',
        cx: 20,
        cy: 15,
        r: 8,
        fill: 'none',
      }
    }

    return (
      <Grid container {...inputs.titleContainer} justify='space-between'>
        <Grid item xs={1} style={{
        }}>
        <svg>
          <circle {...inputs.rxCircle} />
        </svg>
        </Grid>

          <Grid item xs={8}>
            {this.deviceName()}
          </Grid>

          <Grid item xs={1} style={{
            pointerEvents: 'none'
          }}>
          <svg>
            <circle {...inputs.txCircle} />
          </svg>
          </Grid>
      </Grid>
    )
  };

  drawDetails() {
    return (
      <Grid container direction='row' justify='space-between'>
        <Grid item xs={12} id={this.props.deviceID+'_details'}>
          <Collapse in={!this.props.collapsed} style={{overflow: 'visible'}} timeout="auto" unmountOnExit>
            <Grid container direction='row' justify='space-around' alignItems='stretch' spacing={0} >

              <Grid item xs={4} style={{margin:0}}>
                {this.drawControls(this.props.controlInputs)}
              </Grid>

              <Grid item xs={4} style={{margin:0}}>
                <Grid container alignItems='center' spacing={0} style={{height:'100%', margin: 0, padding: 0}}>
                  <Grid item xs={12}>
                    {this.drawDeviceIcon()}
                  </Grid>
                </Grid>
              </Grid>

              <Grid item xs={4} style={{margin:0, padding: 0}}>
                {this.drawControls(this.props.controlOutputs)}
              </Grid>
            </Grid>
          </Collapse>
        </Grid>
      </Grid>
    )
  }

  animateCollapse() {
    const deviceDetails = document.getElementById(this.props.deviceID+'_details')

    function updatingVertex() {
      this.props.updateVertex()
    }

    if (this.props.collapsed) {
      TweenLite.to(deviceDetails, 1, {opacity: 1, onComplete: updatingVertex.bind(this)}).delay(0.3)
      this.props.collapseDevice(this.props.deviceID)
      setTimeout(updatingVertex.bind(this), 300)

    } else {
      this.props.collapseDevice(this.props.deviceID)
      TweenLite.to(deviceDetails, 0.01, {opacity: 0}, 2)
      setTimeout(updatingVertex.bind(this), 300)
    }
  };


	render() {

		const inputs = {
      container: {
        style: {
          marginTop: this.props.theme.spacing.unit,
          marginBottom: this.props.theme.spacing.unit,
          userSelect: "none"
        }
      },
      detailsContainer: {
        style: {
          paddingRight:0,
          paddingLeft:0,
        }
      },
			svgIcon: {
		        style: {
		          maxHeight: '100%',
		          maxWidth: '100%'
		        },
		        type:"image/svg+xml",
		        data: "/dist/assets/svg/" + this.props.device.iconName + ".svg"
	    },
		}

		return (
      <div>
        {this.drawOptions()}
				<Grid container
          direction='column'
          alignItems='stretch'
          spacing={8}
          {...inputs.container}
          >
					<Grid item xs={12}>
						{this.drawTopItems()}
					</Grid>
					<Grid item xs={12} {...inputs.detailsContainer}>
            {this.drawDetails()}
					</Grid>
        </Grid>
      </div>
		);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(withTheme()(Device));
