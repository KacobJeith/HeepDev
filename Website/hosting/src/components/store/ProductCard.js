import React from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'
import { Grid, Typography, IconButton, Badge, Button, Paper }   from 'material-ui';
import { AddShoppingCart } from 'material-ui-icons';
import { withStyles, withTheme } from 'material-ui/styles';

import SmartBadge from '../utilities/SmartBadge'

var mapStateToProps = (state, ownProps) => ({
  product: state.shopify[ownProps.productID],
  productID: ownProps.productID
})

const styles = theme => ({
  card: {
    maxWidth: 400,
  }
});

class ProductCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      deletionHover: false,
      countInCart: 0
    }
  }

  productTitle() {

    return (
      <Link to={'/product/' + this.props.productID}>
        <Typography align='left' variant="title" gutterBottom paragraph >
          {this.props.product.title}
        </Typography>
      </Link>
    )
  }

  productDescription() {

    return (
      <Typography align='left' variant="caption" gutterBottom paragraph>
          {this.props.product.description}
      </Typography>
    )
  }

  imageWithOverlay() {

    const inputs = {
      image: {
        src: this.props.product.images[0].src,
        style: {
          maxHeight: "100%",
          maxWidth: "100%",
          display: 'block',
          margin: 'auto'
        }
      },
      imageAndOverlayContainer: {
        style: {
          height:'100%',
          width:'100%',
          position:'relative'
        }
      },
      overlay: {
        style: {
          backgroundColor:'white',
          opacity: this.state.hover ? 0.15 : 0.0,
          height:'100%',
          position:'absolute',
          top:0,
          width:'100%'
        },
        onMouseEnter: ()=> this.setState({hover: true}),
        onMouseLeave: ()=> this.setState({hover: false})
      },
    }

    return (
      <Link to={'/product/' + this.props.productID}>
        <div {...inputs.imageAndOverlayContainer}> 
          <img {...inputs.image}/>
          <div {...inputs.overlay}/>
        </div>
      </Link>
    )
  }

  buyButtonWithPrice() {

    const inputs = {
      addToCartButton: {
        variant: "raised",
        color: "secondary",
        size: 'large',
        style: {
          zoom: 0.4, 
          margin: this.props.theme.spacing.unit,
          padding: 0,
          marginRight: this.props.theme.spacing.unit * 3
        },
        onClick: () => {
          this.props.addProductToCart(this.props.productID);
          this.setState({countInCart: this.state.countInCart + 1});
        }
      },
      buttonAndPriceContainer: {
        style: {
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'flex-start'
        }
      },
      shoppingCartIcon: {
        nativeColor: this.props.theme.palette.secondary.contrastText, 
        style: {
          display:'inline-block', 
          margin: this.props.theme.spacing.unit
        }
      },
      typeButton: {
        variant:'caption',
        style: {
          margin: this.props.theme.spacing.unit * 2, 
          color:this.props.theme.palette.secondary.contrastText
        }
      }
    }

    return (
      <div {...inputs.buttonAndPriceContainer}>
        <Button {...inputs.addToCartButton}>
          <Typography  {...inputs.typeButton}>
            Add to Cart 
          </Typography>
          {SmartBadge(
            <AddShoppingCart {...inputs.shoppingCartIcon}/>,
            this.state.countInCart,
            'primary')
          }     
        </Button>
        <Typography variant='body1' >
            ${this.props.product.variants[0].price}
        </Typography>
      </div>
    )
  }

  render() {

    return (
      <Grid item xs={12}>
        <Grid container alignItems='stretch' direction='row' spacing={24}>
          <Grid item xs={12} sm={3} >
            {this.imageWithOverlay()}
          </Grid>

          <Grid item xs={12} sm={9} >
            {this.productTitle()}
            {this.productDescription()}
            {this.buyButtonWithPrice()}
          </Grid>
        </Grid>
     </Grid>
    );
  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(withTheme()(withStyles(styles)(ProductCard)))

