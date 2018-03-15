import React from 'react';

import { bindActionCreators } from 'redux'
import { connect }            from 'react-redux'
import { withRouter, Link }         from 'react-router-dom'

import * as Actions         from '../../redux/actions'
import { Typography, Grid, Paper } from 'material-ui';
import { withStyles } from 'material-ui/styles';

var mapStateToProps = (state, ownProps) => ({
  product: state.collections['featuredItems'].products[ownProps.productIndex],
  products: state.collections
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
        <Typography variant='title' align='center'>
        {this.props.product.title}
        </Typography>
    );
  };

  productImage() {
    const inputs = {
      imageContainer: {
        style: {
          textAlign: 'center'
        }
      },
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
      <div {...inputs.imageContainer}>
        <img {...inputs.image}/>
      </div>
    )
  };

  productPrice() {
    return (
      <Typography variant="subheading" align='center' gutterBottom paragraph wrap>
        {"$" + this.props.product.variants[0].price}
      </Typography>
    )
  }

  render() {

    const { classes } = this.props;
    console.log(this.props.products)

    return(
      <Paper className={classes.root} elevation={1}>
          <Link to={'/product/' + this.props.product.variants[0].id} style={{textDecoration: 'none'}}>
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

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(FeaturedItems)))
