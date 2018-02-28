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
    
    return (
        <Grid container justify='center' style={{marginTop: 20}}>
          <Grid item xs={10} style={{padding:24}}>
            <Grid container direction='row' alignItems='stretch' spacing={16}>
              {Object.keys(this.props.products).map((key) => (
                <ProductCard key={key} productID={key}/>)
              )}
            </Grid>
          </Grid>
        </Grid>
    );
  
    
  }
}

Store.propTypes = {
  classes: PropTypes.object.isRequired,
};

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(Store)))