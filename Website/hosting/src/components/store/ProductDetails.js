import React from 'react';
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { withRouter } from 'react-router-dom'
import * as actions from '../../redux/actions'
import PropTypes from 'prop-types';
import { withStyles } from 'material-ui/styles';
import Paper from 'material-ui/Paper';
import Grid from 'material-ui/Grid';
import GridList, { GridListTile, GridListTileBar } from 'material-ui/GridList';
import IconButton from 'material-ui/IconButton';
import StarBorderIcon from 'material-ui-icons/StarBorder';

var mapStateToProps = (state, ownProps) => ({
  product: state.shopify[ownProps.match.params.productID]
})

const styles = theme => ({
  root: {
    flexGrow: 1,
    margin: "20px"
  },
  paper: {
    padding: theme.spacing.unit * 2,
    textAlign: 'center',
    color: theme.palette.text.secondary,

  },
  gridList: {
    flexWrap: 'wrap',
    // Promote the list into his own layer on Chrome. This cost memory but helps keeping high FPS.
    transform: 'translateZ(0)',
  },
  title: {
    color: theme.palette.primary.light,
  },
  titleBar: {
    background:
      'linear-gradient(to top, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.3) 70%, rgba(0,0,0,0) 100%)',
  },
});

class ProductDetails extends React.Component { 
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      viewing: 0
    }
  }

  render() {
    const { classes } = this.props;

    console.log("MATCH: ", this.props.match);
    console.log("Matched Product: ", this.props.product);

    if (!this.props.product) {
      return (<div> No product found </div>)
    } else {
      return (
        <div style={{margin: 25, flexGrow: 1}}>
          <Grid container spacing={24}>
            <Grid item xs>
                <img 
                  src={this.props.product.images[this.state.viewing].src} 
                  alt={this.props.product.title} 
                  style={{maxWidth:400, maxHeight:400}}
                />
            </Grid>
            <Grid item xs>
              
              <GridList className={classes.gridList} cols={1}>
                      {this.props.product.images.map((tile, index) => (
                        <GridListTile key={tile.img}>
                          <img 
                            src={tile.src} 
                            alt={tile.altText} 
                            style={{
                              cursor: 'pointer'
                              
                            }}
                            onClick={ () => {console.log('clicked: ', index); this.setState({viewing: index})}}
                          />
                        </GridListTile>
                      ))}
                    </GridList>
             
            </Grid>
            <Grid item xs>
              <Paper className={classes.paper}>xs</Paper>
            </Grid>
          </Grid>
          <Grid container spacing={24}>
            <Grid item xs>
              <Paper className={classes.paper}>xs</Paper>
            </Grid>
            <Grid item xs={6}>
              <Paper className={classes.paper}>xs=6</Paper>
            </Grid>
            <Grid item xs>
              <Paper className={classes.paper}>xs</Paper>
            </Grid>
          </Grid>
        </div>
      );
    }
    
  }
  
}

ProductDetails.propTypes = {
  classes: PropTypes.object.isRequired,
};

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(actions, dispatch)
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(withStyles(styles)(ProductDetails)))
