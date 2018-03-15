import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as newActions from '../../redux/actions'
import Control from './Controls';
import DynamicIcon from './DynamicIcon';
import { Paper, Button, Typography, Grid } from 'material-ui'



var mapStateToProps = (state, ownProps) => ({
  device: state.devices[ownProps.DeviceID],
  controlInputs: state.controls.controlStructure[ownProps.DeviceID]['inputs'],
  controlOutputs: state.controls.controlStructure[ownProps.DeviceID]['outputs']
})


class Device extends React.Component {
	constructor(props) {
		super(props);

	}


	deviceName = () => (
		<Typography variant='subheading'>
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

	drawDeviceIcon() {
		const svgIcon = {
			style: {
			  maxHeight: '100%',
			  maxWidth: '100%'
			},
			width: '100%',
	        type:"image/svg+xml",
	        data: "/dist/assets/svg/" + this.props.device.iconName + ".svg"
		    }

		return (
			<object {...svgIcon}/>
		)
	}

	drawOptions() {

		const button = {
			size: 'small',
			color: 'secondary',
			onClick: () => this.props.claimDevice(this.props.device.deviceID)
			}
		

		return (
			<Button {...button}> Claim </Button>

		)
	}


	render() {

		const inputs = {
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
					<Grid container direction='column' alignItems='center' spacing={8}> 
						<Grid item >
							{this.deviceName()}
						</Grid>

						<Grid item style={{paddingRight:0, paddingLeft:0 }}>
							<Grid container direction='row' justify='space-around' alignItems='center' spacing={0} >
								<Grid item xs={3} style={{margin:0}}>
									{this.drawControls(this.props.controlInputs)}
								</Grid>

								<Grid item xs={5} style={{margin:0}}>
									{this.drawDeviceIcon()}
								</Grid>

								<Grid item xs={3} style={{margin:0}}>
									{this.drawControls(this.props.controlOutputs)}
								</Grid>

							</Grid>

						</Grid>


						<Grid item >
							{this.drawOptions()}
						</Grid>

					</Grid>
					
			);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Device);