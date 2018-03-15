import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import { PowerSettingsNew }   from 'material-ui-icons'
import { IconButton }                 from 'material-ui'

const mapStateToProps = (state, ownProps) => ({
  controlID: state.controls[ownProps.thisControl]['controlID'],
  DeviceID: ownProps.DeviceID,
  value: state.controls[ownProps.thisControl]['valueCurrent']
})

class OnOffController extends React.Component {
	constructor(props){
		super(props);
		this.lastSentControlValue = this.props.value;
	}

	sendCommand() {
		var newVal = 1 - this.props.value;
	    this.lastSentControlValue = newVal;
	    this.props.updateControlValue(this.props.DeviceID, this.props.controlID, newVal);
	    
	}

	render() {

		var styles = {
			button: {
				display: 'block',
				verticalAlign: 'center',
				marginLeft: 'auto',
				marginRight: 'auto',
				height: 30
			}
		};

		var inputs = {
			button: {
				onClick: () => {this.sendCommand()},
			}
		};

		return  (
			<IconButton onClick={() => this.sendCommand()} style={{maxWidth:'100%', height: 35}}>
				<PowerSettingsNew style={{maxWidth:'100%'}}/>
			</IconButton>
		)           	
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}


export default connect(mapStateToProps, mapDispatchToProps)(OnOffController)
