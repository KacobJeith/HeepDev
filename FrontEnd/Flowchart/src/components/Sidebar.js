import React from 'react';
import $ from 'jquery';
import Icon from '../assets/icons';
import {ICONS} from '../assets/iconConstants';

class Sidebar extends React.Component {
	
	render() {

		var styles = {
			sidebar : {
				position: "fixed",
				top: 40,
				left: -250,
				bottom: 30,
				width: 250,
				height: "100%",
				backgroundColor: "#43464c", 
				transition: "left .3s ease-in-out",
				color: "#e1e3e8"
			},
			arrowButton: {
				position: 'absolute',
				top: "89%",
				left:"84%",
				size: 35,
				backgroundColor: 'Transparent',
	            backgroundRepeat: 'no-repeat',
	            border: 'none',
	            cursor:'pointer',
	            overflow: 'auto',
			}
		}

		if (this.props.sidebarVisible){
			styles.sidebar['left'] = 0;
		}

		var inputs = {
			sidebar : {
				style: styles.sidebar,
			},
			arrowButton: {
				style: styles.arrowButton,
				onClick: ()=>this.props.closeSidebar()
			}
		}


		if (this.props.sidebarVisible){
			styles.sidebar['left'] = 0;
		}
		
		return <div {...inputs.sidebar}>
					<button {...inputs.arrowButton}> 
		                <Icon icon={ICONS.ARROWLEFT} 
		                	  color={"#e1e3e8"} 
		                	  size={25}/>
		            </button>
				</div>;
	}

}

export default Sidebar;