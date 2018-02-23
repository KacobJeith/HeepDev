import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'
import ProductCard from './ProductCard'
import { withStyles } from 'material-ui/styles';
import PropTypes from 'prop-types';
import ProductCardMUI from './ProductCardMUI'
import GridList, { GridListTile, GridListTileBar } from 'material-ui/GridList';
import Subheader from 'material-ui/List/ListSubheader';
import ProductGrid from './ProductGrid'

import { withRouter } from 'react-router-dom'

var mapStateToProps = (state) => ({
  products: state.shopify
})

const styles = theme => ({
  root: {
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'space-around',
    overflow: 'hidden',
    backgroundColor: theme.palette.background.paper,
  },
  gridList: {
    width: "100%",
    height: "100%",
  }
});

class Store extends React.Component {
  
  render() {
    const { classes } = this.props;

  	const styles = {
        container : { 
   		  display: "flex",
   		  flexDirection: "row",
   		  flexFlow: "row wrap",
        position: "relative",
        top: 0
        }
      };

    const inputs = {
      container: {
        style: styles.container,
        id: "page-wrap"
      }
    }
    
    var useGrid = true;

    if (useGrid) {

      var products = []

      for (var key in this.props.products) {
        products.push(<ProductGrid key={key} productID={key}/>);
      } 

      return (
          <div className={classes.root}>
            <GridList cellHeight={"auto"} className={classes.gridList}>
              <GridListTile key="Subheader" cols={2} style={{ height: 'auto' }}>
                <Subheader component="div">December</Subheader>
              </GridListTile>
            {products}
            </GridList>
          </div>
      );


    } else {
      var products = []

      for (var key in this.props.products) {
        // products.push(<ProductCard key={key} productID={key}/>);
        products.push(<ProductCardMUI key={key} productID={key}/>);
      } 

      return (
          <div {...inputs.container}>
            {products}
          </div>
      );
    }
    
  }
}

Store.propTypes = {
  classes: PropTypes.object.isRequired,
};

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(Store)))