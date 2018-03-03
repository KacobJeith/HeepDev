import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../../redux/actions'
import { buttonLink } from '../utilities/ButtonUtils'

import { Grid }   from 'material-ui';

const mapStateToProps = (state) => ({
  checkoutID: state.checkoutID,
  cart: state.shoppingCart
})


class Checkout extends React.Component {
  
  render() {

    var inputs = {
      checkoutFrame: {
        src: this.props.cart.webUrl,
        width: "100%",
        height: 1500,
        frameBorder: 0
      }
    }

    if (this.props.cart.webUrl != null) {

         return (
          <Grid container spacing={24} style={{maxWidth:'100%', padding:24}}>
            <Grid item xs={12}>
              {buttonLink('Back to Cart', '/MyCart', 'left')}
            </Grid>

            <Grid item xs={12}>
              <iframe {...inputs.checkoutFrame}/>
            </Grid>
          </Grid>);

    } else {

      return <div> Add some items to your cart before checkout out!</div>
    }
	 
  
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Checkout))
