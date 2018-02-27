import React from 'react';
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'
import PropTypes from 'prop-types';

import { withStyles } from 'material-ui/styles';
import { AddShoppingCart } from 'material-ui-icons';
import { Grid, Badge, IconButton }   from 'material-ui';
import GridList, { GridListTile, GridListTileBar } from 'material-ui/GridList';



var mapStateToProps = (state, ownProps) => ({
  product: state.shopify[ownProps.productID],
  productID: ownProps.productID
})

const styles = theme => ({
  icon: {
    color: 'rgba(255, 255, 255, 0.54)',
  },
});

class TitlebarGridList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        expanded: false,
        countInCart: 0
    }
  }

  addToCart() {
    this.props.addProductToCart(this.props.productID);
    this.setState({countInCart: this.state.countInCart + 1});
  }

  render() {
    const { classes } = this.props;

    var cartIcon = [];

    if (this.state.countInCart > 0) {
      cartIcon = (
      <Badge color="secondary" badgeContent={this.state.countInCart} className={classes.margin}>
        <AddShoppingCart onClick={this.addToCart.bind(this)}/>
      </Badge>);

    } else {

      cartIcon = <AddShoppingCart onClick={this.addToCart.bind(this)}/>;
    }

    return (
            <GridListTile key={this.props.product.title} cols={1} style={{width:250, height:250}}>
              
              <img  src={this.props.product.images[0].src} 
                    alt={this.props.product.title}
                  />

              <GridListTileBar
                title={this.props.product.title}
                subtitle={<span>by: {this.props.product.vendor}</span>}
                actionIcon={
                  <IconButton className={classes.icon}>
                    {cartIcon}
                  </IconButton>
                }
              />
            </GridListTile>

      );
    }
}

TitlebarGridList.propTypes = {
  classes: PropTypes.object.isRequired,
};


var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}


export default connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(TitlebarGridList));
