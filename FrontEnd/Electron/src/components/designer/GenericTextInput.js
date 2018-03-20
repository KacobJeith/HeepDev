import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'

import Input, { InputLabel } from 'material-ui/Input';
import { FormControl, FormHelperText } from 'material-ui/Form';


export default class GenericTextInput extends React.Component {

	render() {
	    return (
	    	<FormControl style={{
			    margin: 24,
			    minWidth: 120,
			    width: '60%'
			  }}>
	    	  <InputLabel htmlFor="text-input">{this.props.title}</InputLabel>
	    	  <Input id="name-input"  
	    	    onChange={ (event) => {this.props.onChange(event.target.value)}}/>
	    	  <FormHelperText>{this.props.helperText}</FormHelperText>
	    	</FormControl>

	    )
	}
}
