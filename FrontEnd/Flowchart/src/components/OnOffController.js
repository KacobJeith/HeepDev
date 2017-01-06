import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Icon from '../assets/icons';
import {ICONS} from '../assets/iconConstants';

class OnOffController extends React.Component {
	constructor(props){
		super(props);
		this.lastSentControlValue = this.props.control['CurCtrlValue'];
	}

	componentWillReceiveProps(nextProps) {

		if (this.props.control['CurCtrlValue'] != this.lastSentControlValue){
			
			this.sendCommand(this.props.url.concat('/api/commands'), this.props.control['CurCtrlValue']);
		}

	}

	sendCommand(url, newVal) {

	    var commandQueueString = [];

	    this.lastSentControlValue = newVal;
	    
	    if( this.props.control['ControlDirection'] == 0){
	    	
	    	commandQueueString.push('SetCommand'+ ':' + 
	    							this.props.ClientID + ',' +
	    							this.props.control['ControlName'] + ',' +
									newVal + '\n');

		    console.log(commandQueueString);
		    
		    var messagePacket = {command: commandQueueString};
		    $.ajax({
		      url: url,
		      type: 'POST',
		      data: messagePacket,
		      success: (data) => {
		      },
		      error: function(xhr, status, err) {
		        console.error(url, status, err.toString());
		        console.log('Hitting Commands sendDataToServer error')
		      }
		    });

	    }


	    this.props.updateAllConnectedClients(this.props.ClientID, this.props.control['ControlName'], newVal);
	    
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
				onClick: () => {this.sendCommand(this.props.url.concat('/api/commands'), 1 - this.props.control['CurCtrlValue'])},
				style: styles.button
			},
			icon: {
				icon: ICONS.POWER,
		        color: this.props.control['CurCtrlValue'] == 0 ?  "#43464c" : "gold" ,
		        size: 30
			}

		};

		return  <div {...inputs.button}>
					<Icon  {...inputs.icon}/>
				</div>
            	
	}


}

export default OnOffController;