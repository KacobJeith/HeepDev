import React from 'react'
import {HashRouter as Router, Route} from 'react-router-dom'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import * as Actions from '../../redux/actions_designer'
import {FormGroup, FormControl, ControlLabel, option} from 'react-bootstrap';

export default class ControlledSelect extends React.Component {
	
	constructor(props) {
		super(props);
	}

	render() {
		
	    var options = [];

	    for (var i in this.props.options) {
	    	options.push (<option 
	    		key={this.props.options[i]}
	    		value={this.props.options[i]}>{this.props.options[i]}
	    		</option>)
	    }

	    return(<FormGroup controlId="formControlsSelect">
	              <ControlLabel style={{color:"white"}}>{this.props.title}</ControlLabel>
	              <FormControl 
	                componentClass="select" 
	                value={this.props.value}
	                onChange={
	                  (change) => {this.props.onChange(change.target.value);}
	                }>
	                {options}
	              </FormControl>
	            </FormGroup>);
	    
	}
}