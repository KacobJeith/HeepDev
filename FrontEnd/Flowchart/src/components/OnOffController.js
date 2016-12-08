import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Icon from '../assets/icons';
import {ICONS} from '../assets/iconConstants';

class OnOffController extends React.Component {
	constructor() {
		super();
		this.controlValue = 0;
	}
	
	sendCommand() {

	    let commandQueueString = [];

	    if(this.controlValue == 0){
	    	this.controlValue = 1;
	    }
	    else {
	    	this.controlValue = 0;
	    }

	    //SetCommand:destID,controlName,controlValue
	    
    	commandQueueString.push('SetCommand'+ ':' + 
    							this.props.ClientID + ',' +
    							this.props.ControlName + ',' +
								this.controlValue + '\n');

	    
	    const messagePacket = {command: commandQueueString};
	    $.ajax({
	      url: '/api/commands',
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	        console.log("Commands Sent Successfully");
	        console.log(this.controlValue);
	      },
	      error: function(xhr, status, err) {
	        console.error('/api/commands', status, err.toString());
	        console.log('Hitting Commands sendDataToServer error')
	      }
	    });
	}

	render() {
		console.log(this.props.ClientID);

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
				onClick: () => this.sendCommand(),
				style: styles.button
			},
			icon: {
				icon: ICONS.POWER,
		        color: "#43464c",
		        size: 30
			}

		};

		return  <div {...inputs.button}>
					<Icon  {...inputs.icon}/>
				</div>
            	
	}


}

export default OnOffController;