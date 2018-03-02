import React                  from 'react'
import { bindActionCreators } from 'redux'
import { connect }            from 'react-redux'
import { withRouter }         from 'react-router-dom'

import { Grid }   from 'material-ui';

import * as Actions         from '../../redux/actions'
import CartItemCard          from './CartItemCard'

var mapStateToProps = (state) => ({
  cart: state.shoppingCart
})

class ManageCart extends React.Component {
  
  render() {
    
    return (
        <Grid container justify='center' style={{marginTop: 20}}>
          <Grid item xs={10} style={{padding:24}}>
            <Grid container direction='row' alignItems='stretch' spacing={16}>
              {this.props.cart.map((cartItem) => (
                <CartItemCard key={cartItem.variant.id} productID={cartItem.variant.id}/>)
              )}
            </Grid>
          </Grid>
        </Grid>
    );
  
    
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(ManageCart))