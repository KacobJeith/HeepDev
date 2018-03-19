import React from 'react'
import {HashRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../../redux/actions_designer'
import {Button} from 'react-bootstrap';

export default class GenericButton extends React.Component {
	
	constructor(props) {
		super(props);
	}

	render() {

	    const inputs = {
	      buttonContainer: {
	        style: {
	          height: 50,
	          width: "100%",
	          display: "flex",
	          alignItems: "center",
	          flexDirection: "row",
	          justifyContent: "center"
	        },
	        onClick: () => {this.props.onClick()}
	      }
	    }

	    return(<div {...inputs.buttonContainer}>
	    			<Button bsStyle="danger" bsSize="xsmall"> {this.props.text} </Button>
	    		</div>);
	    
	}
}
