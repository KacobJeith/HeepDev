import React from 'react';

import { bindActionCreators } from 'redux'
import { connect }            from 'react-redux'
import { withRouter }         from 'react-router-dom'

import * as Actions         from '../../redux/actions'
import { Typography, Grid, Paper } from 'material-ui';

var mapStateToProps = (state, ownProps) => ({
  product: state.shopify[ownProps.productID],
  productID: ownProps.productID
});

const styles = theme => ({
  root: theme.mixins.gutters({
    paddingTop: 16,
    paddingBottom: 16,
    margin: theme.spacing.unit * 3,
  }),
});

class FeaturedItems extends React.Component {

  productTitle() {
    return(
        <Typography variant='title'>
        {this.props.product.title}
        </Typography>
    );
  };

  productImage() {
    const inputs = {
      image: {
        src: this.props.product.images[0].src,
        style: {
          maxHeight: 200,
          maxWidth: 200,
          paddingTop: 16
        },
      },
    };
    return(
      <img {...inputs.image}/>
    )
  };

  productPrice() {
    return (
      <Typography variant="subheading" gutterBottom paragraph wrap>
        {"$" + this.props.product.variants[0].price}
      </Typography>
    )
  }

  render() {

    const { classes } = this.props;

    return(
      <Paper className={classes.root} elevation={3}>
          <Link to={'/product/' + this.props.productID} style={{textDecoration: 'none'}}>
            {this.productTitle()}
            {this.productImage()}
            {this.productPrice()}
          </Link>
      </Paper>
    );
  };
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(FeaturedItems))
