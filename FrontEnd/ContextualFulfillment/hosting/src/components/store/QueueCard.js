import React                  from 'react'
import { bindActionCreators } from 'redux'
import { connect }            from 'react-redux'
import { withRouter, Link }         from 'react-router-dom'

import * as Actions         from '../../redux/actions'
import { withTheme } from 'material-ui/styles';
import { buttonLink, buttonLinkWithAction } from '../utilities/ButtonUtils'

import { List,
         ListItem, 
         ListItemText, 
         ListItemIcon, 
         ListItemSecondaryAction, 
         IconButton,
         Tooltip,
         Button,
         Divider,
         Typography, 
         Paper,
         CircularProgress,
         Grid,
         Collapse }                 from 'material-ui'


import {  ExpandLess, 
          ExpandMore,
          Home }   from 'material-ui-icons'

import QueueContentCard          from './QueueContentCard'

var mapStateToProps = (state, ownProps) => ({
  queueID: ownProps.queueID,
  contents: state.fulfillmentQueue[ownProps.queueID]
})

class QueueCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: false
    }
  }

  collapsedDetails() {

    return (

      <Collapse in={this.state.view} timeout="auto" unmountOnExit>

          <Grid container justify='center' style={{marginTop: 20, maxWidth:'100%'}}>
            <Grid item xs={12} sm={11} style={{padding:24}}>
              <Grid container direction='row' alignItems='stretch' spacing={16} style={{minWidth:770}}>

                <Paper elevation={6} style={{padding:this.props.theme.spacing.unit*4}}>
                  
                  <QueueContentCard titleBar={true}/>
                  <Divider style={{margin: this.props.theme.spacing.unit * 2}}/>

                  {Object.keys(this.props.contents.devices).map((variantID) => (
                    <QueueContentCard 
                    key={variantID + 'test'} 
                    productID={variantID} 
                    quantity={1}
                    lineItemID={'asdf'}
                    titleBar={false}/>)
                  )}

                </Paper>

              </Grid>
            </Grid>
          </Grid>
        
      </Collapse>
    )
  }
  
  render() {
    var inputs = {
      item: {
        button: true,
        onClick: () => this.setState({view: !this.state.view})
      }
    }

    return (
      <div>
        <ListItem {...inputs.item}>
          <ListItemIcon >
              <Home style={{
                color:this.props.theme.palette.primary.main
              }}/>
          </ListItemIcon>
          <ListItemText inset  primary={this.props.queueID} />
          {this.state.view ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        {this.collapsedDetails()}

      </div>

    )
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(QueueCard)))