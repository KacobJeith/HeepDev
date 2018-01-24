import React from 'react'
import { withRouter } from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../redux/actions'
import {Modal, Button} from 'react-bootstrap';
import {iconMappings} from '../assets/iconMappings'

import IconSelectWrapper from './IconSelectWrapper'

var mapStateToProps = (state) => ({
	selectingIcon: state.selectingIcon
})

class IconSVGSelect extends React.Component {

	render() {

		console.log("Rendering Modal: ", this.props.selectingIcon)

		if (!this.props.selectingIcon) {

			return <div/>
		}


		
	    var options = [];

	    for (var i in iconMappings) {

	    	var inputs = {
	    		wrapper: {
	    			iconID: i,
	    			key: iconMappings[i] + '_key',
	    			iconName: iconMappings[i]
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
						<Button onClick={() => {console.log("closing..."); this.props.closeIconModal()}}>Close</Button>
						<Button bsStyle="primary" onClick={()=> {console.log("saving..."); this.props.closeIconModal()}}>Save changes</Button>
					</Modal.Footer>
				</Modal.Dialog>
			</div>);
	    
	}
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(IconSVGSelect))
