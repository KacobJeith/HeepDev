import React from 'react'
import {HashRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'
import {Modal, Button} from 'react-bootstrap';

import IconSelectWrapper from './IconSelectWrapper'

export default class IconSVGSelect extends React.Component {
	
	constructor(props) {
		super(props);
	}

	render() {
		
	    var options = [];

	    var iconOptions = [
	    	'none', 
	    	'lightbulb',
	    	'lightswitch',
	    	'outlet',
	    	'powerButton',
	    	'cuckooClock',
	    	'maglock',
	    	'rfid',
	    	'motor'
	    ]

	    for (var i in iconOptions) {

	    	var inputs = {
	    		wrapper: {
	    			iconID: i,
	    			key: iconOptions[i] + '_key',
	    			iconName: iconOptions[i]
	    		}
	    	}

	    	options.push (<IconSelectWrapper {...inputs.wrapper}/> )
	    }

	    var inputs = {
	    	iconsContainer: {
	    		style: {
	    			display: "flex",
	    			flexDirection: "row",
	    			flexWrap: "wrap",
	    			justifyContent: "space-evenly"
	    		}
	    	}
	    }

	    return(<div className="static-modal">
				<Modal.Dialog>
					<Modal.Header>
						<Modal.Title>Select an Icon</Modal.Title>
					</Modal.Header>

					<Modal.Body>
					<div {...inputs.iconsContainer}>
						{options}
					</div>
					
					</Modal.Body>

					<Modal.Footer>
						<Button>Close</Button>
						<Button bsStyle="primary">Save changes</Button>
					</Modal.Footer>
				</Modal.Dialog>
			</div>);
	    
	}
}
