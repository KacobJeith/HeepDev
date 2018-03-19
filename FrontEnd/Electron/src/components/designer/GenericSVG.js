import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'
import $ from 'jquery'

import none from '../../assets/svg/none.svg'
import lightbulb from '../../assets/svg/lightbulb.svg'
import lightswitch from '../../assets/svg/lightswitch.svg'
import outlet from '../../assets/svg/outlet.svg'
import powerButton from '../../assets/svg/powerButton.svg'
import cuckooClock from '../../assets/svg/cuckooClock.svg'
import maglock from '../../assets/svg/maglock.svg'
import rfid from '../../assets/svg/rfid.svg'
import motor from '../../assets/svg/motor.svg'

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
  icon: ownProps.iconName,
  height: ownProps.height,
  width: ownProps.width
})

class GenericSVG extends React.Component {

	setDimensions() {

		this.icon.setAttribute("height", String(this.props.height).concat('px'));
		this.icon.setAttribute("width", String(this.props.width).concat('px'));
	}

	render() {

		var dummydiv = document.createElement('div');
		dummydiv.innerHTML = iconStrings[this.props.icon];

		this.icon = $(dummydiv).find('svg')[0];
		this.setDimensions();

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

export default connect(mapStateToProps, mapDispatchToProps)(GenericSVG);
