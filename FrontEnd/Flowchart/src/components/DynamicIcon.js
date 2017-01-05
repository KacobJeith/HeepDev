import React from 'react';
import $ from 'jquery';

class DynamicIcon extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			icon: 'none',

		}

		this.icon = {__html: ''};
		this.grabSVGIcon();
	}

	grabSVGIcon() {

		var subdirectory = 'default';
		if (this.props.client['IconCustom'] == 1 ){
			subdirectory = String(this.props.client['ClientID']);
		}

		var svgurl = this.props.url.concat('/static/assets/') + subdirectory + '/' + this.props.client['IconName'] + '.svg';
		
		$.get(svgurl, (svg) => {
			var parsed = $(svg);
			this.icon = parsed[parsed.length-1];
			this.setDimensions();
		}, 'text');
	}

	setDimensions() {
		this.icon.setAttribute("height", String(this.props.height).concat('px'));
		this.icon.setAttribute("width", String(this.props.width).concat('px'));
	}

	updateColor() {
		if(this.icon.find('#LEDState').length > 0) {
			var test = this.icon.find('#LEDState')[0].setAttribute('style','fill:#bbbbbb');
		}
	}

	render() {


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