import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import ProductCard from './ProductCard'

import { withRouter } from 'react-router-dom'

var mapStateToProps = (state) => ({
  products: state.shopify
})

class Store extends React.Component {
  
  render() {

    
  	const styles = {
        container : { 
   		  display: "flex",
   		  flexDirection: "row",
   		  flexFlow: "row wrap",
        position: "relative",
        top: 70
        }
      };

    const inputs = {
      container: {
        style: styles.container,
        id: "page-wrap"
      }
    }
    

    var products = []

    for (var key in this.props.products) {
      products.push(<ProductCard key={key} productID={key}/>);
    } 

    return (
        <div {...inputs.container}>
		      {products}
        </div>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Store))