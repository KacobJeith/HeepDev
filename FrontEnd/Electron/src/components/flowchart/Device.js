import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as newActions from '../../redux/actions'
import Control from './Controls';
import ControlKnob from './ControlKnob';
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
		<Typography variant='subheading' style={{userSelect: 'none', fontWeight: 'bold', fontSize: 18}}>
			{this.props.device.name}
		</Typography>

	)

	drawControls(controlList) {

		return (
			<div >
				{controlList.map((controlKey) => {
					return <Control key={controlKey} deviceID={this.props.device.deviceID} controlID={controlKey}/>
				}
				)}
			</div>
		)
	}

  drawControlKnobs(controlList) {
    <div>
      {controlList.map((controlKey) => {
        return <ControlKnob key={controlKey} deviceID={this.props.device.deviceID} controlID={controlKey}/>
      }
      )}
    </div>
  }

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
	}

  animateCollapse() {
    const deviceDetails = document.getElementById(this.props.deviceID+'_details')

    function updatingVertex() {
      this.props.updateVertex()
    }

    //setTimeout(this.props.updateVertex(), 500)

    if (this.props.collapsed) {
      TweenLite.to(deviceDetails, 1, {opacity: 1, onComplete: updatingVertex.bind(this)}).delay(0.3)
      this.props.collapseDevice(this.props.deviceID)
      setTimeout(updatingVertex.bind(this), 300)

    } else {
      this.props.collapseDevice(this.props.deviceID)
      TweenLite.to(deviceDetails, 0.01, {opacity: 0}, 2)
      setTimeout(updatingVertex.bind(this), 300)
    }
  }

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
          // fontSize: 5,
          padding: 0,
          height: 30,
          width: 30
        },
        // size: 'xsmall',
        // disableRipple: true,
  			color: this.props.detailsPanelDeviceID == this.props.device.deviceID ? 'secondary' : 'default',
  			onClick: () => this.props.detailsPanelDeviceID == this.props.device.deviceID ?
  							this.props.setDetailsPanelDeviceID(null) :
  							this.props.setDetailsPanelDeviceID(this.props.device.deviceID)
			},
      collapseButton: {
        style: {
          // fontSize: 5
          padding: 0,
          height: 30,
          width: 30
        },
        // size: 'xsmall',
        // disableRipple: true,
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
	}

	render() {

		const inputs = {
      gridContainer: {
        style: {
          marginTop: this.props.theme.spacing.unit,
          marginBottom: this.props.theme.spacing.unit,
          userSelect: "none"
        }
      },
      name: {
				style: {
					textAlign: 'center',
					marginBottom: 5,
					height: 15,
				},
				draggable: true
			},
			svgIcon: {
		        style: {
		          maxHeight: '100%',
		          maxWidth: '100%'
		        },
		        type:"image/svg+xml",
		        data: "/dist/assets/svg/" + this.props.device.iconName + ".svg"
		    }
		}



		return (
      <div style={{
        left: -15,
        position: 'relative',
        width: 370
      }}>
        {this.drawOptions()}
					<Grid container {...inputs.gridContainer} direction='column' alignItems='stretch' spacing={8}>

						<Grid item xs={12}>
							<Grid container justify='center' >
								<Grid item >
									{this.deviceName()}
								</Grid>
							</Grid>
						</Grid>

                {/* {this.drawControlKnobs(this.props.controlInputs)} */}

  						<Grid item style={{
                paddingRight:0,
                paddingLeft:0,
                // left: -11,
                // position: 'absolute',
                // width: 360
                //opacity: this.props.collapsed ? 0 : 1
                // display: this.props.collapsed ? "none" : "block"
              }}>

              <Grid container direction='row' justify='space-between'>
                <Grid item xs={2} style={{backgroundColor: 'green'}}>
                  {this.drawControlKnobs(this.props.controlInputs)}
                </Grid>

                <Grid item xs={8}>
                  <Collapse in={!this.props.collapsed} style={{overflow: 'visible'}} timeout="auto" unmountOnExit>
      							<Grid container id={this.props.deviceID+'_details'} style={{backgroundColor: 'blue'}} direction='row' justify='space-around' alignItems='stretch' spacing={0} >

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

                <Grid item xs={2} style={{backgroundColor: 'green'}}>
                  {this.drawControlKnobs(this.props.controlOutputs)}
                </Grid>

              </Grid>


  						</Grid>

                  {/* {this.drawControlKnobs(this.props.controlOutputs)} */}
              </Grid>

        </div>
			);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(withTheme()(Device));
