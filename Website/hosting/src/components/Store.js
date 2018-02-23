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
import { InputLabel } from 'material-ui/Input';
import { MenuItem } from 'material-ui/Menu';
import { FormControl } from 'material-ui/Form';
import Select from 'material-ui/Select';
import Button from 'material-ui/Button';

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
  },
  button: {
    display: 'block',
    marginTop: theme.spacing.unit * 2,
  },
  formControl: {
    margin: theme.spacing.unit,
    minWidth: 120,
  }
});

class Store extends React.Component {
  state = {
    viewMode: 'Grid',
    age: '',
    open: false
  }

  handleChange = event => {
    this.setState({ [event.target.name]: event.target.value });
  };

  viewModeSelection(classes) {
    return (<form autoComplete="off" style={{width:"100%"}}>
            <FormControl className={classes.formControl}>
              <InputLabel htmlFor="controlled-open-select">View Mode</InputLabel>
              <Select
                value={this.state.viewMode}
                onChange={this.handleChange}
                inputProps={{
                  name: 'viewMode',
                  id: 'controlled-open-select',
                }}
              >
                <MenuItem value={'Grid'}>Grid</MenuItem>
                <MenuItem value={'Card'}>Card</MenuItem>
                <MenuItem value={'Classic'}>Classic</MenuItem>
              </Select>
            </FormControl>
          </form>);
  }
  
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
    
    var selectViewMode = this.viewModeSelection(classes);

    if (this.state.viewMode == 'Grid') {

      var products = []

      for (var key in this.props.products) {
        products.push(<ProductGrid key={key} productID={key}/>);
      } 


      return (
        <div>
          
          {selectViewMode}
          <div className={classes.root}>
            <GridList cellHeight={"auto"} className={classes.gridList}>
              <GridListTile key="Subheader" cols={2} style={{ height: 'auto' }}>
                <Subheader component="div">Viewing Heep Store in {this.state.viewMode} Mode</Subheader>
              </GridListTile>
            {products}
            </GridList>
          </div>
        </div>
      );


    } else if (this.state.viewMode == 'Card') {
      var products = []

      for (var key in this.props.products) {
        // products.push(<ProductCard key={key} productID={key}/>);
        products.push(<ProductCardMUI key={key} productID={key}/>);
      } 

      return (
          <div {...inputs.container}>

            {selectViewMode}
            {products}
          </div>
      );
    } else if (this.state.viewMode == 'Classic') {
      var products = [];

      for (var key in this.props.products) {
        products.push(<ProductCard key={key} productID={key}/>);
      } 

      return (
          <div {...inputs.container}>

            {selectViewMode}
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