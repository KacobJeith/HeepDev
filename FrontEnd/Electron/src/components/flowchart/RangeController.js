import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { Tooltip }  from 'material-ui'
import * as Actions from '../../redux/actions_classic'

var mapStateToProps = (state, ownProps) => ({
  control: state.controls[ownProps.thisControl],
  controlID: state.controls[ownProps.thisControl]['controlID'],
  value: state.controls[ownProps.thisControl]['valueCurrent'],
  DeviceID: ownProps.DeviceID
})


class RangeController extends React.Component {

	constructor(props) {
		super(props);
		this.displayMin = 7;
		this.displayMax = 60;

		this.state = {
			x: this.convertCtrlVal(),
			radius: 7,
      mouseDrag: false,
      fill: '#455a64',
      fontSize: 8.5,
      textCenter: 14
		}

		this.dragging = 0;

		this.lastPosition =  {top:  0,
							  left: 0};
		this.runningOffset = {top:  0,
							  left: 0};

		this.lastSentControlValue = this.props.control['valueCurrent'];
		this.newControlValue = this.props.control['valueCurrent'];
	}

	componentWillReceiveProps(nextProps) {
		if (this.props.control['valueCurrent'] != this.lastSentControlValue) {

			this.setState({x: this.convertCtrlVal()});

		}
	}

	convertCtrlVal() {
		return this.displayMin + (this.displayMax-this.displayMin)*(this.props.control['valueCurrent']/(this.props.control['valueHigh']-this.props.control['valueLow']))

	}

	sendCommand() {
	    var newVal = this.calcNewControlValue();
	    this.props.updateControlValue(this.props.DeviceID, this.props.controlID, newVal);
	}

	calcNewControlValue() {//15
		var newVal = Math.round((this.state['x'] - this.displayMin)/(this.displayMax-this.displayMin)*(this.props.control['valueHigh']-this.props.control['valueLow']) + this.props.control['valueLow']);
		this.lastSentControlValue = newVal;
		return newVal
	}

	onMouseDown(event) {
		this.dragging = 1;
		this.lastPosition['left'] = event.screenX;
	}

	onMouseMove(event) {
		// The final drag event is always 0, whichthrows off tracking unless you catch and ignore it
		this.runningOffset['left'] = event.screenX - this.lastPosition['left'];

		if ((event.screenX == 0 && event.screenY == 0) || !this.dragging || this.runningOffset['left'] == 0){
			return;
		}

		var setPosition = this.state['x'] + this.runningOffset.left;
		if (setPosition < this.displayMin){
			setPosition = this.displayMin;
		}
		else if (setPosition > this.displayMax){
			setPosition = this.displayMax;
		}

		this.lastPosition['left'] = event.screenX;
		this.setState({x: setPosition});
		this.sendCommand();
	}

	onWheel(event) {
		event.preventDefault();

		if (event.deltaY < 0){
			var newVal = this.state.x + this.displayMin

			if (newVal > this.displayMax){
				newVal = this.displayMax;
			}

			this.setState({x: newVal });
		}
		else {
			var newVal = this.state.x - this.displayMin;
			if (newVal < this.displayMin){
				newVal = this.displayMin;
			}
			this.setState({x: newVal});
		}

		this.sendCommand();
	}

	render() {

		var styles = {
			button: {
				display: 'block',
				draggable: false,
				verticalAlign: 'center',
				marginRight: 'auto',
				height: 35
			}
		};

		var inputs = {
			button: {
				style: styles.button,
				onMouseUp : (event) => {this.dragging = 0},
				onMouseLeave : (event) => {this.dragging = 0},
				onMouseMove : (event) => {this.onMouseMove(event)},
				onWheel : (event) => this.onWheel(event),
				onTouchMove : (event) => {this.onMouseMove(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.dragging = 0},
			},
			rangeContainer: {
				width: 68,
				height: 35,
				viewBox: '0 0 68 35',
        overflow: 'visible'
			},
			unselected:{
				strokeWidth: 1,
				stroke: 'grey',
				x1: this.displayMin,
				x2: this.displayMax,
				y1: 11,
				y2: 11,
			},
			selected:{
				strokeWidth: 2,
				stroke: '#8ed0ee',
				x1: this.displayMin,
				x2: this.state.x,
				y1: 11,
				y2: 11,
			},
			dragDot: {
				onMouseEnter : () => this.setState({radius: 11, fill: '#02a8f4', fontSize: 15, textCenter: 16}),
				onMouseLeave : () => this.setState({radius: 7, fill: '#455a64', fontSize: 8.5, textCenter: 14}),
				onMouseDown : (event) => {this.onMouseDown(event);},
				onMouseUp : (event) => {this.dragging = 0;},
				onTouchStart: (event) => {event.preventDefault(); this.onMouseDown(event.nativeEvent.changedTouches[0])},
				onTouchMove : (event) => {this.onMouseMove(event.nativeEvent.changedTouches[0])},
				onTouchEnd: (event) => {this.dragging = 0},
				cx: this.state.x,
				cy: 11,
				r: this.state.radius,
				fill: this.state.fill,
			},
			text: {
				x: this.state.x,
				y: this.state.textCenter,
				fontFamily: "Verdana",
				fontSize: this.state.fontSize,
				fill: '#e1e3e8',
				textAnchor: 'middle',
				pointerEvents: 'none',
        style: {
          userSelect: 'none'
        }

			}
		};

		return  <div {...inputs.button}>
          <Tooltip id="tooltip-right" title={this.props.control['valueCurrent']} placement="right-start">
  					<svg {...inputs.rangeContainer}>
  						<line {...inputs.unselected}/>
  						<line {...inputs.selected}/>
  						<circle {...inputs.dragDot} ref='dragDot'/>
  						<text {...inputs.text}> {this.props.control['valueCurrent']} </text>
  					</svg>
          </Tooltip>
				</div>

	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(RangeController)
