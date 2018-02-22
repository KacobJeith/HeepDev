import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import * as Actions from '../redux/actions'
import ShopifyBuy from 'shopify-buy'

const mapStateToProps = (state) => ({
  checkoutID: state.checkoutID
})


class Checkout extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      checkoutData: {},
      webURL: "",

    }

  }

  getCheckoutData() {

    var client = ShopifyBuy.buildClient({
    domain: 'shopheep.myshopify.com',
    storefrontAccessToken: 'a444eb17144b5b4e7841eaa1e4cf8698'
    });


    client.checkout.fetch(this.props.checkoutID).then((checkout) => {
      // Do something with the checkout
      console.log(checkout);
      // this.setState({checkoutData: checkout})

      if (checkout.webUrl != this.state.webURL) {
        this.setState({
          webURL: checkout.webUrl
        })
      }

      if (checkout.lineItems.length != this.state.lineItems) {
        this.setState({
          lineItems: checkout.lineItems.length
        })
      }

    });
  }
  
  render() {

    this.getCheckoutData();

    var inputs = {
      checkoutFrame: {
        src: this.state.webURL,
        width: "100%",
        height: 1500,
        frameBorder: 0
      }
    }

  	
    if (this.state.lineItems > 0) {

         return (<div> 
            <iframe {...inputs.checkoutFrame}/>
          </div>);

    } else {

      return <div> Add some items to your cart before checkout out!</div>
    }
	 
  
  }
}



function mapDispatchToProps(dispatch) {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Checkout))
