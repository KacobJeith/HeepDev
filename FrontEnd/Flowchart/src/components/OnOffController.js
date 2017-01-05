import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Icon from '../assets/icons';
import {ICONS} from '../assets/iconConstants';

class OnOffController extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			controlValue: this.props.control['CurCtrlValue']
		}
	}
	
	sendCommand(url) {

	    let commandQueueString = [];
	    var newControlValue = 0;
	    if(this.state.controlValue == 0){
	    	var newControlValue = 1;
	    	this.setState({controlValue: newControlValue});
	    }
	    else {
	    	this.setState({controlValue: newControlValue});
	    }

	    this.props.action(this.props.ClientID, newControlValue);

	    //SetCommand:destID,controlName,controlValue
	    
    	commandQueueString.push('SetCommand'+ ':' + 
    							this.props.ClientID + ',' +
    							this.props.control['ControlName'] + ',' +
								newControlValue + '\n');

	    
	    const messagePacket = {command: commandQueueString};
	    $.ajax({
	      url: url,
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	        console.log(commandQueueString);
	        console.log("Commands Sent Successfully");
	      },
	      error: function(xhr, status, err) {
	        console.error(url, status, err.toString());
	        console.log('Hitting Commands sendDataToServer error')
	      }
	    });


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
				onClick: () => {this.sendCommand(this.props.url.concat('/api/commands'))},
				style: styles.button
			},
			icon: {
				icon: ICONS.POWER,
		        color: this.state['controlValue'] == 0 ?  "#43464c" : "gold" ,
		        size: 30
			}

		};

		return  <div {...inputs.button}>
					<Icon  {...inputs.icon}/>
				</div>
            	
	}


}

export default OnOffController;