import React from 'react';
import $ from 'jquery';

class DynamicIcon extends React.Component {

	constructor(props) {
		super(props);

		var dummydiv = document.createElement('div');
		dummydiv.innerHTML = this.props.icon;

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

export default DynamicIcon;