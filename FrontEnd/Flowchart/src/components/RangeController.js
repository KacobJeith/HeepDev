import React from 'react';
import $ from 'jquery';

class RangeController extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			x: 5 + (64-5)*this.props.ControlValue,
			radius: 3
		}

		this.dragging = 0;

		this.lastPosition =  {top:  0,
							  left: 0};
		this.runningOffset = {top:  0,
							  left: 0};
	}
	
	sendCommand() {

	    let commandQueueString = [];

	    //SetCommand:destID,controlName,controlValue
	    
    	commandQueueString.push('SetCommand'+ ':' + 
    							this.props.ClientID + ',' +
    							this.props.ControlName + ',' +
								this.props.ControlValue + '\n');

	    
	    const messagePacket = {command: commandQueueString};
	    $.ajax({
	      url: '/api/commands',
	      type: 'POST',
	      data: messagePacket,
	      success: (data) => {
	        console.log("Commands Sent Successfully");
	      },
	      error: function(xhr, status, err) {
	        console.error('/api/commands', status, err.toString());
	        console.log('Hitting Commands sendDataToServer error')
	      }
	    });
	}

	onDragStart(event) {
		console.log('starting drag');
		this.dragging = 1;
		this.lastPosition['left'] = event.screenX;
		
	}

	onDrag(event) {
		// The final drag event is always 0, whichthrows off tracking unless you catch and ignore it
		if ((event.screenX == 0 && event.screenY == 0) || !this.dragging){
			return;
		}

		this.runningOffset['left'] = event.screenX - this.lastPosition['left']  ;
		var setPosition = this.state['x'] + this.runningOffset.left;
		if (setPosition < 5){
			setPosition = 5;
		}
		else if (setPosition > 64){
			setPosition = 64;
		}

		this.lastPosition['left'] = event.screenX;
		this.setState( {x: setPosition});
		
	}

	onDragEnd(event) {
		this.dragging = 0;
	}

	onWheel(event) {
		event.preventDefault(); 

		if (event.deltaY < 0){
			var newVal = this.state.x + 5

			if (newVal > 64){
				newVal = 64;
			}

			this.setState({x: newVal });
		}
		else {
			var newVal = this.state.x - 5;
			if (newVal < 5){
				newVal = 5;
			}
			this.setState({x: newVal});
		} 
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
				style: styles.button,
				onMouseUp : (event) => {this.dragging = 0;},
				onMouseLeave : (event) => {this.dragging = 0;},
				onMouseMove : (event) => {this.onDrag(event)},
				onWheel : (event) => this.onWheel(event),
			},
			rangeContainer: {
				width: 69,
				height: 30,
				viewBox: '0 0 69 30'
			},
			unselected:{
				strokeWidth: 1,
				stroke: 'grey',
				x1: 5,
				x2: 64,
				y1: 20,
				y2: 20,
			},
			selected:{
				strokeWidth: 2,
				stroke: 'black',
				x1: 5,
				x2: this.state.x,
				y1: 20,
				y2: 20,
			},
			dragDot: {		
				draggable: true,
				onMouseEnter : () => this.setState({radius: 3.5}),
				onMouseLeave : () => this.setState({radius: 3}),
				onMouseDown : (event) => {this.onDragStart(event);},
				onMouseUp : (event) => {this.dragging = 0;},
				cx: this.state.x,
				cy: 20,
				r: this.state.radius,
				fill: "black"
			}
		};

		return  <div {...inputs.button}>
					<svg {...inputs.rangeContainer}>
						<line {...inputs.unselected}/>
						<line {...inputs.selected}/>
						<circle {...inputs.dragDot} ref='dragDot'/>
					</svg>
				</div>
            	
	}


}

export default RangeController;