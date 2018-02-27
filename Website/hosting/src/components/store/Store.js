import React                  from 'react'
import { bindActionCreators } from 'redux'
import PropTypes              from 'prop-types'
import { connect }            from 'react-redux'
import { withRouter }         from 'react-router-dom'

import GridList, { GridListTile, GridListTileBar }  from 'material-ui/GridList';

import { Grid, Select, Button }   from 'material-ui';
import Subheader                  from 'material-ui/List/ListSubheader';
import { InputLabel }             from 'material-ui/Input';
import { MenuItem }               from 'material-ui/Menu';
import { FormControl }            from 'material-ui/Form';
import { withStyles }             from 'material-ui/styles';

import ProductGrid          from './ProductGrid'
import * as Actions         from '../../redux/actions'
import ProductCardMUI       from './ProductCardMUI'
import ProductCard          from './ProductCard'

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
    viewMode: 'Classic',
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

      return (
        <div>
          
          {selectViewMode}

          <div className={classes.root}>
            <GridList cellHeight={180} className={classes.gridList}>
              <GridListTile key="Subheader" cols={2} >
                <Subheader component="div">Viewing Heep Store in {this.state.viewMode} Mode</Subheader>
              </GridListTile>
            {Object.keys(this.props.products).map((key) => (
              <ProductGrid key={key} productID={key}/>)
            )}
            </GridList>
          </div>
        </div>
      );

    } else if (this.state.viewMode == 'Card') {

      return (
          <div {...inputs.container}>

            {selectViewMode}

            {Object.keys(this.props.products).map((key) => (
              <ProductCardMUI key={key} productID={key}/>)
            )}
          </div>
      );
    } else if (this.state.viewMode == 'Classic') {
      
      return (

            <Grid container spacing={0} >
              {Object.keys(this.props.products).map((key) => (
                <ProductCard key={key} productID={key}/>)
              )}
            </Grid>
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