import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Icon from '../assets/icons';
import {ICONS} from '../assets/iconConstants';

class ControlPopup extends React.Component {
	
	sendCommand() {
	    const ControlValue = this.state.newValue;
	    let commandQueueString = [];
	    for (var i = 0; i < this.props.thisCommand['DestIP'].length; i++){
	    	commandQueueString.push(this.props.thisCommand['DestIP'][i] 	+ ':' + 
	    							this.props.thisCommand['DestControl'][i] + ',' + 
    								ControlValue + '\n');

	    }
	    
	    const messagePacket = {command: commandQueueString};
	    $.ajax({
	      url: '/api/commands',
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	        console.log("Commands Send Successfully");
	      },
	      error: function(xhr, status, err) {
	        console.error('/api/commands', status, err.toString());
	        console.log('Hitting Commands sendDataToServer error')
	      }
	    });
	}

	render() {
		console.log(this.props.activeInput);

		var styles = {
			svg: {
				width: '100%',
				height: '100%',
				viewBox: "0 0 100 100",
			},
			rect: {
				color: "#40528a",
				opacity: 0.75,
				position: "fixed",
				width: 80,
				height: 80,
				left: 0,
				top: 0,
			},
			div: {
				position: 'absolute',
				margin: 'auto',
				top: this.props.top - 80,
				left: this.props.left - 80,
				width: 80,
				height: 80,
			}
		};

		var inputs = {
			svg: {
				style: styles.svg,
			},
			rect: {
				style: styles.rect,
			},
			div: {
				style: styles.div
			}

		};

		return  <div {...inputs.div}> 
					<svg {...inputs.svg}>
						<rect {...inputs.rect}/>
					</svg>
					<Icon icon={ICONS.POWER} 
	                	  color={"#e1e3e8"} 
	                	  size={60}/>
            	</div>
	}


}

export default ControlPopup;