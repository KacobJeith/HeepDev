import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_classic'
import $ from 'jquery'

import none from '../../serverside/assets/svg/none.svg'
import lightbulb from '../../serverside/assets/svg/lightbulb.svg'
import lightswitch from '../../serverside/assets/svg/lightswitch.svg'
import outlet from '../../serverside/assets/svg/outlet.svg'
import powerButton from '../../serverside/assets/svg/powerButton.svg'
import cuckooClock from '../../serverside/assets/svg/cuckooClock.svg'
import maglock from '../../serverside/assets/svg/maglock.svg'
import rfid from '../../serverside/assets/svg/rfid.svg'
import motor from '../../serverside/assets/svg/motor.svg'

var iconStrings = {
	none: none,
	lightbulb: lightbulb,
	lightswitch: lightswitch,
	outlet: outlet,
	powerButton: powerButton,
	cuckooClock: cuckooClock,
	maglock: maglock,
	rfid: rfid,
	motor: motor
}

var mapStateToProps = (state, ownProps) => ({
  value: state.controls[ownProps.controlID]['valueCurrent'],
  highValue: state.controls[ownProps.controlID]['valueHigh'],
  icon: state.icons[ownProps.deviceID],
  defaultIcon: iconStrings.none,
  height: ownProps.height,
  width: ownProps.width
})


class DynamicIcon extends React.Component {

	constructor(props) {
		super(props);

		var dummydiv = document.createElement('div');
		dummydiv.innerHTML = iconStrings[props.icon];

		if ($(dummydiv).find('svg')[0] == null){
			dummydiv.innerHTML = props.defaultIcon
		}

		this.icon = $(dummydiv).find('svg')[0];
		this.setDimensions();
	}

	setDimensions() {

		this.icon.setAttribute("height", String(this.props.height).concat('px'));
		this.icon.setAttribute("width", String(this.props.width).concat('px'));
	}


	updateColor() {
		var LEDelement = $(this.icon).find('#LEDState')
		
		if(LEDelement.length > 0) {

			var edit = LEDelement[0];
			edit.setAttribute('opacity', this.props.value / this.props.highValue);

		}
	}

	render() {
		
		// this.updateColor();

		var inputs = {
			icon: {
				dangerouslySetInnerHTML: {__html: $(this.icon).prop('outerHTML')},
			}
		}


		return (
			<div {...inputs.icon}/>
		);
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(DynamicIcon);
