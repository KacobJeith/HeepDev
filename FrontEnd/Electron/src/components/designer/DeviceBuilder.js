import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions_designer'
import { NavLink, withRouter } from 'react-router-dom';

import DeviceIdentity from './DeviceIdentity'
import ControlBuilder from './ControlBuilder'

import { Button, Grid } from 'material-ui'

export default class DeviceBuilder extends React.Component {
  constructor(props) {
    super(props);
  }

  downloadButton = () => (
    <Button 
      variant='raised' 
      color="primary" 
      onClick={() => {this.props.packageSourceFiles()}}>
      Download Source
    </Button>
  )

  render () {

    var inputs = {
      builder: {
        style: {
          backgroundColor: "#f1f1f1",
          height:'100%',
          fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen-Sans,Ubuntu,Cantarell,Helvetica Neue,sans-serif"
        }
      },
      contents: {
        style: {
          width: "80%",
          margin: "auto",
        }
      },
      spacer: {
        style: {
          height: 20
        }
      }
    }

    return (
      <Grid container direction='column' spacing={24}>
        <Grid item>
            <DeviceIdentity/>
        </Grid>
        <Grid item>
            <ControlBuilder/>
        </Grid>
        <Grid item xs>
          <Grid container justify='flex-end' >
            <Grid item style={{marginRight:24}}>
              {this.downloadButton()}
            </Grid>
          </Grid>
        </Grid>
        <Grid item >
          <div {...inputs.spacer}/>
        </Grid>
     </Grid>
    );
  }
}

