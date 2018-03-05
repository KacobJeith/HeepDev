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
         Avatar,
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
  contents: state.fulfillmentQueue[ownProps.queueID],
  user: state.users[state.fulfillmentQueue[ownProps.queueID].userID],
  checkout: state.checkouts[state.fulfillmentQueue[ownProps.queueID].checkoutID]
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

  calculateQuantity() {

    var totalQuantity = 0;

    for (var item in this.props.checkout.lineItems) {

      if (item != 'type') {
        var lineItemQuantity = this.props.checkout.lineItems[item].quantity;
        totalQuantity += lineItemQuantity;
      }
    }

    return totalQuantity
  }
  
  render() {
    var inputs = {
      item: {
        button: true,
        onClick: () => this.setState({view: !this.state.view})
      }
    }

    const displayName = this.props.user ? this.props.user.displayName : 'name';
    const avatarSrc = this.props.user ? this.props.user.photoURL : ''
    const initials = displayName.split(' ').map((element) => element[0]).join('');
    const date = this.props.checkout ? this.props.checkout.updatedAt : 'date';

    const quantity = this.props.checkout ? this.calculateQuantity() : 0;

    return (
      <div>
        <ListItem {...inputs.item}>
          <Avatar src={avatarSrc} alt={initials}/>
          <ListItemText inset primary={displayName}/>
          <ListItemText inset primary={date}/>
          <ListItemText inset primary={quantity.toString()} />
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