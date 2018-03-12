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
  position: state.positions[ownProps.DeviceID]['device'],
  controlInputs: state.controls.controlStructure[ownProps.DeviceID]['inputs'],
  controlOutputs: state.controls.controlStructure[ownProps.DeviceID]['outputs']
})


class Device extends React.Component {
	constructor(props) {
		super(props);

		this.cardWorkspace = 50 + Math.max.apply(null,[this.props.controlOutputs.length,this.props.controlInputs.length])*55;

		this.runningOffset = {top:  0,
							  left: 0};
		this.lastPosition =  {top:  0,
							  left: 0};

	}

	onDragStart(event) {

	  	this.lastPosition['left'] = event.pageX;
	  	this.lastPosition['top'] = event.pageY;
	  	// event.dataTransfer.setDragImage(this.refs.device, 99999,99999);
	}

	onTouchStart(event) {

		event.preventDefault();
		this.lastPosition['left'] = event.nativeEvent.changedTouches[0].pageX;
	  	this.lastPosition['top'] = event.nativeEvent.changedTouches[0].pageY;

	}

	onDrag(event) {
		this.calculateDragOffset(event);
		this.props.positionDevice(this.props.device.deviceID, this.runningOffset);
	}

	calculateDragOffset(event) {
		// The final drag event is always 0, which throws off tracking unless you catch and ignore it
		if (event.clientX == 0 && event.clientY == 0){
			return;
		}

		this.runningOffset['left'] = event.pageX - this.lastPosition['left']  ;
		this.lastPosition['left'] = event.pageX;

		this.runningOffset['top'] = event.pageY - this.lastPosition['top']  ;
		this.lastPosition['top'] = event.pageY;

	}

	sendPositionToServer() {

		this.props.sendPositionToServer(this.props.device.deviceID);
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
					console.log(controlKey)
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
	        data: "./dist/assets/svg/" + this.props.device.iconName + ".svg"
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

		const styles = {
			deviceContainer: {
				backgroundColor: 'white',
				margin: 10,
				padding: 3,
				width: 230,
				cursor: '-webkit-grab',
				position: 'absolute',
				top: this.props.position.top,
				left: this.props.position.left,
				color: 'black'
			},
			name: {
				textAlign: 'center',
				marginBottom: 5,
				height: 15,
			},
			controlsContainer: {
				position: 'relative',
				display: 'inline-flex',
				alignItems: 'center',
				width: 258,
				height: this.cardWorkspace - 20,
				left: -13,
			},
			inputContainer:{
				display:'inline-block',
				cursor: 'default',
				width: 79,
				height: this.cardWorkspace - 45,
			},
			iconContainer: {
				display: 'inline-flex',
				width: 90,
				height: (this.cardWorkspace - 25)*0.85,
				textAlign: 'center',
				verticalAlign: 'center'
			},
			outputContainer:{
				display: 'inline-block',
				cursor: 'default',
				height: this.cardWorkspace - 45,
				width: 79,
			}
		}

		console.log("localhost:3004/assets/svg/" + this.props.device.iconName + ".svg")

		const inputs = {
			deviceContainer: {
				style: styles.deviceContainer,
				draggable: true,
				onDragStart : (event) => {this.onDragStart(event)},
				onDrag : (event) => {console.log('dragging'); this.onDrag(event)},
				onDragEnd: (event) => {this.sendPositionToServer()},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.sendPositionToServer()},
			},
			name: {
				style: styles.name,
				draggable: true,
				onDragStart : (event) => {this.onDragStart(event)},
				onDrag : (event) => {this.onDrag(event)},
				onDragEnd: (event) => {this.sendPositionToServer()},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.sendPositionToServer()},

			},
			controlsContainer: {
				style: styles.controlsContainer
			},
			inputContainer: {
				style: styles.inputContainer,
				draggable: false,
			},
			iconContainer: {
				style: styles.iconContainer,
				draggable: true,
				onDragStart : (event) => {this.onDragStart(event)},
				onDrag : (event) => {console.log('dragging'); this.onDrag(event)},
				onDragEnd: (event) => {this.sendPositionToServer()},
				onTouchStart: (event) => {this.onTouchStart(event)},
				onTouchMove : (event) => {this.onDrag(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.sendPositionToServer()},
			},
			icon: {
				deviceID: this.props.device.deviceID,
				controlID: this.props.controlInputs.length == 0 ? this.props.controlOutputs[0] : this.props.controlInputs[0] ,
				width: styles.iconContainer.width,
				height: styles.iconContainer.height
			},
			svgIcon: {
		        style: {
		          maxHeight: '100%',
		          maxWidth: '100%'
		        },
		        type:"image/svg+xml",
		        data: "/src/assets/svg/" + this.props.device.iconName + ".svg"
		    },
			outputContainer: {
				draggable: false,
				style: styles.outputContainer
			}
		}
			


		return (<Paper {...inputs.deviceContainer} ref="device"> 

					<Grid container direction='column' alignItems='center' spacing={8}> 
						<Grid item >
							{this.deviceName()}
						</Grid>

						<Grid item style={{paddingRight:0, paddingLeft:0 }}>
							<Grid container direction='row' justify='space-around'  spacing={0} >
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
					
				</Paper>
			);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(Device);