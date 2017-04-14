import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import $ from 'jquery'

var mapStateToProps = (state, ownProps) => ({
  ClientID: ownProps.ClientID,
  value: state.controls[ownProps.controlID]['CurCtrlValue'],
  highValue: state.controls[ownProps.controlID]['HighValue'],
  icon: state.icons[state.icons[ownProps.clientID]],
  defaultIcon: state.icons['none'],
  height: ownProps.height,
  width: ownProps.width,
  url: state.url
})


class DynamicIcon extends React.Component {

	constructor(props) {
		super(props);

		var dummydiv = document.createElement('div');
		dummydiv.innerHTML = this.props.icon;

		if ($(dummydiv).find('svg')[0] == null){
			dummydiv.innerHTML = this.props.defaultIcon
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
		
		this.updateColor();

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
