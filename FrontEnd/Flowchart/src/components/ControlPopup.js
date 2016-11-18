import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import Icon from '../assets/icons';
import {ICONS} from '../assets/iconConstants';

class ControlPopup extends React.Component {
	render() {

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