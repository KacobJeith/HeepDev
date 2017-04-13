import React from 'react';
import ReactDOM from 'react-dom';
import Icon from '../assets/icons';
import {ICONS} from '../assets/iconConstants';

class OnOffController extends React.Component {
	constructor(props){
		super(props);
		this.lastSentControlValue = this.props.value;
	}

	sendCommand() {
		var newVal = 1 - this.props.value;
	    this.lastSentControlValue = newVal;
	    this.props.updateControlValue(this.props.ClientID, this.props.controlID, newVal, this.props.url);
	    
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
				style: styles.button
			},
			icon: {
				icon: ICONS.POWER,
		        color: this.props.value == 0 ?  "#43464c" : "gold" ,
		        size: 30
			}

		};

		return  <div {...inputs.button}>
					<Icon  {...inputs.icon}/>
				</div>
            	
	}


}

export default OnOffController;