import React                  from 'react'
import { bindActionCreators } from 'redux'
import { connect }            from 'react-redux'
import { withRouter, Link }         from 'react-router-dom'

import { Grid, Typography, Paper, Divider, Hidden }   from 'material-ui';

import * as Actions         from '../../redux/actions'
import CartItemCard          from './CartItemCard'
import { withTheme } from 'material-ui/styles';
import { buttonLink, buttonLinkWithAction } from '../utilities/ButtonUtils'

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

  cartEmpty() {

    const inputs = {
      gridContainer: {
        style: {
          height: '70vh',
          width: '100vw',
          overflowX: 'hidden',
          margin: 0,
          maxWidth: '100%'
        }
      },
    };

    return (
      <Grid container
        {...inputs.gridContainer}
        justify='center'
        alignItems='center'>
        <Grid item xs={12} sm={4}>
          <Paper style={{
            position: "relative",
            padding: this.props.theme.spacing.unit * 4,
            backgroundColor: this.props.theme.palette.background.paper,
          }}>
          <Grid container
            direction='column'
            justify='center'
            alignItems='center'
            styles={{
              overflowX: 'hidden',
              margin: 0
            }}>
              <Grid item sm={12}>
                <Typography align='center' variant="title" gutterBottom paragraph >
                  Add some items to experience the power of Heep!
                </Typography>
              </Grid>
              <Grid item sm={12}>
                {buttonLink('Back to Store', '/Shop')}
            </Grid>
            </Grid>

          </Paper>
        </Grid>
      </Grid>
    )
  }

  orderInProgress = () => (
      <Grid container justify='center' style={{marginTop: 20, maxWidth:'100%'}}>
        <Grid item xs={12} sm={11} style={{padding:24}}>
          <Grid container direction='row' alignItems='stretch' spacing={16} style={{minWidth:770}}>
            <Grid item xs={12}>
              {this.cartTitleLine()}
            </Grid>
            <Paper elevation={6} style={{padding:this.props.theme.spacing.unit*4}}>

              <Divider style={{margin: this.props.theme.spacing.unit * 2}}/>

              {this.props.lineItems.map((cartItem) => (
                <CartItemCard
                key={cartItem.variant.id}
                productID={cartItem.variant.id}
                quantity={cartItem.quantity}
                lineItemID={cartItem.id}
                titleBar={false}/>)
              )}

              <Divider style={{margin: this.props.theme.spacing.unit * 4}}/>
              {this.cartSubtotal()}
            </Paper>
            <Grid item xs={12} style={{marginTop: this.props.theme.spacing.unit * 4}}>
              {buttonLinkWithAction('Proceed to Checkout', '/Checkout', () => this.props.pushCartToFulfillmentQueue() )}
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
