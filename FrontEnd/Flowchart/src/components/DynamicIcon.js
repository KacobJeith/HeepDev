import React from 'react';
import $ from 'jquery';

class DynamicIcon extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			icon: 'none'
		}

		this.icon = '';
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
			this.updateColor();
		}, 'text');
	}

	setDimensions() {
		this.icon.setAttribute("height", String(this.props.height).concat('px'));
		this.icon.setAttribute("width", String(this.props.width).concat('px'));
	}

	updateColor() {
		
		if($(this.icon).find('#LEDState').length > 0) {
			var edit = $(this.icon).find('#LEDState')[0];
			edit.setAttribute('opacity', this.props.client['ControlList'][0]['CurCtrlValue'] / this.props.client['ControlList'][0]['HighValue']);
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