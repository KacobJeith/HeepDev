import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import * as newActions from '../../redux/actions'
import Control from './Controls';
import DynamicIcon from './DynamicIcon';
import { Paper, Button, Typography, Grid, IconButton } from 'material-ui'
import { InfoOutline } from 'material-ui-icons'



var mapStateToProps = (state, ownProps) => ({
  device: state.devices[ownProps.DeviceID],
  controlInputs: state.controls.controlStructure[ownProps.DeviceID]['inputs'],
  controlOutputs: state.controls.controlStructure[ownProps.DeviceID]['outputs'],
  draggingCallbacks: ownProps.draggingCallbacks,
  detailsPanelDeviceID: state.detailsPanelDeviceID
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
	        data: "/assets/svg/" + this.props.device.iconName + ".svg"
		}


		return (
			<div style={{position:'relative'}}>
				<object {...svgIcon}  />
				<div {...this.props.draggingCallbacks} style={{position:'absolute', top:0, left:0, width:'100%', height:'100%', cursor:'grab'}}/>
			</div>
		)
	}

	drawOptions() {

		const button = {
			size: 'small',
			color: this.props.detailsPanelDeviceID == this.props.device.deviceID ? 'secondary' : 'default',
			onClick: () => this.props.detailsPanelDeviceID == this.props.device.deviceID ? 
							this.props.setDetailsPanelDeviceID(null) :
							this.props.setDetailsPanelDeviceID(this.props.device.deviceID)
			}


		return (
			<Grid container justify='flex-end'>
				<IconButton {...button}>
					<InfoOutline/>
				</IconButton>
			</Grid>

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
					<Grid container direction='column' alignItems='stretch' spacing={8}>
						<Grid item {...this.props.draggingCallbacks}>
							<Grid container justify='center' >
								<Grid item >
									{this.deviceName()}
								</Grid>
							</Grid>
						</Grid>

						<Grid item style={{paddingRight:0, paddingLeft:0 }}>
							<Grid container direction='row' justify='space-around' alignItems='stretch' spacing={0} >
								<Grid item xs={3} style={{margin:0}}>
									{this.drawControls(this.props.controlInputs)}
								</Grid>

								<Grid item xs={5} style={{margin:0}} {...this.props.draggingCallbacks}>
									<Grid container alignItems='center' spacing={8} style={{height:'100%'}}>

										<Grid item xs={12}>
											{this.drawDeviceIcon()}
										</Grid>
									</Grid>
								</Grid>

								<Grid item xs={3} style={{margin:0}}>
									{this.drawControls(this.props.controlOutputs)}
								</Grid>

							</Grid>

						</Grid>

						<Grid item>
							<Grid container direction='column' alignItems='stretch' spacing={0} style={{maxWidth: '100%'}}>
								<Grid item {...this.props.draggingCallbacks}>
									<Grid container justify='center' spacing={0} style={{maxWidth: '100%'}}>
										{this.drawOptions()}
									</Grid>
								</Grid>
							</Grid>
						</Grid>

					</Grid>

			);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Device);
