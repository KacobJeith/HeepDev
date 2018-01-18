import React from 'react'
import {Button, FormGroup, FormControl} from 'react-bootstrap'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'

const mapStateToProps = (state) => ({
  
})


class Contact extends React.Component {
	  
  render() {

  	var styles = {
  		container: {
  			width: '100%',
  			height: '100%',
  			overflow: 'auto',
  			position: 'absolute',
  			backgroundColor: '#21ea94'
  		},
  		message: {
  			display: 'block',
        position: 'absolute',
        top:'50%',
        left:'50%',
        bottom:'auto',
        right:'auto',
        transform: 'translate(-50%,-50%)',
  			verticalAlign: 'middle',
  			textAlign: 'center',
  			color: '.secondary',
  			font: '400 22px/45px Roboto,sans-serif',
  		},
  	}

  	var inputs = {
  		container: {
  			style: styles.container
  		},
  		message: {
  			style: styles.message
  		},
      build: {
        style: styles.build
      },
      install: {
        style: styles.install
      },
      use: {
        style: styles.use
      },
      contact: {
        style: styles.contact,
      }
  	}
    
	return (<div {...inputs.container}>
        			<div {...inputs.message}> 
          			<h1> CONTACT Your World </h1>
        			</div> 
               
            </div>
    );
  }
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Contact))
