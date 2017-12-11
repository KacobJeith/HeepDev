import React from 'react'
import {HashRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import {ControlLabel, FormGroup, FormControl} from 'react-bootstrap'


export default class GenericTextInput extends React.Component {
	constructor(props) {
		super(props);
		
	}

	render() {

	    return(
	    	<FormGroup controlId="formBasicText" >
              <ControlLabel  style={{color:"white"}}>{this.props.title}</ControlLabel>
              <FormControl
                type="text"
                defaultValue={this.props.defaultValue}
                onChange={(change) => this.props.onChange(change.target.value)}/>
            </FormGroup>
            );
	    
	}
}
