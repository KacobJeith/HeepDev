import React                  from 'react'
import { bindActionCreators } from 'redux'
import { connect }            from 'react-redux'
import { withRouter, Link }         from 'react-router-dom'

import { Grid, Typography, Paper, Divider }   from 'material-ui';

import * as Actions         from '../../redux/actions'
import CartItemCard          from './CartItemCard'
import { withTheme } from 'material-ui/styles';
import { buttonLink } from '../utilities/ButtonUtils'

var mapStateToProps = (state) => ({
  cart: state.shoppingCart,
  lineItems: state.shoppingCart.lineItems
})

class ManageCart extends React.Component {

  cartTitleLine = () => (
    <Typography align='left' variant="title" gutterBottom paragraph >
      Your Order
    </Typography>
  )

  cartSubtotal = () => (
    <Typography align='right' variant="title" gutterBottom paragraph >
      Subtotal: ${this.props.cart.subtotalPrice}
    </Typography>
  )

  cartEmpty = () => (

    <Paper style={{
      position: "absolute",
      backgroundColor: this.props.theme.palette.background.paper,
      minWidth: 500,
      minHeight: 200,
      top: '50%',
      left: '50%',
      height:'40vh',
      transform: 'translate(-50%, -50%)',
      maxWidth: '100%'
    }}>
        <Grid container justify='center' alignItems='center' style={{marginTop: 20,height:'100%'}}>
          <Grid item xs={12} sm={11} style={{padding:24}}>
            <Typography align='center' variant="title" gutterBottom paragraph >
              Add some items to experience the power of Heep!
            </Typography>
            {buttonLink('Back to Store', '/Shop')}
            
          </Grid>
        </Grid>

      </Paper>

  )

  orderInProgress = () => (

    <Grid container justify='center' style={{marginTop: 20, maxWidth:'100%'}}>
      <Grid item xs={12} sm={11} style={{padding:24}}>
        <Grid container direction='row' alignItems='stretch' spacing={16}>
          <Grid item xs={12}>
            {this.cartTitleLine()}
          </Grid>
          <Paper elevation={6} style={{padding:this.props.theme.spacing.unit*4}}>
            {this.props.lineItems.map((cartItem) => (
              <CartItemCard 
              key={cartItem.variant.id} 
              productID={cartItem.variant.id} 
              quantity={cartItem.quantity}
              lineItemID={cartItem.id}/>)
            )}

            <Divider style={{margin: this.props.theme.spacing.unit * 4}}/>
            {this.cartSubtotal()}
          </Paper>
          <Grid item xs={12} style={{marginTop: this.props.theme.spacing.unit * 4}}>
            {buttonLink('Proceed to Checkout', '/Checkout' )}
          </Grid>
        </Grid>
      </Grid>
    </Grid>

  )

  
  render() {
    
    if (this.props.lineItems.length == 0) {

      return this.cartEmpty()

    } else {

      return this.orderInProgress()
    }
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withTheme()(ManageCart)))