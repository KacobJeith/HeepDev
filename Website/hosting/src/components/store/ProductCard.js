import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'
import { Grid, Typography, IconButton, Badge }   from 'material-ui';
import { AddShoppingCart } from 'material-ui-icons';
import { withStyles, withTheme } from 'material-ui/styles';

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

  render() {

    const inputs = {
      
      image: {
        src: this.props.product.images[0].src,
        style: {
          height: "calc(25vw - 8px)",
          maxWidth: "100%"
        }
      }
    }

    return (
      <Grid item xs={4}>
        <Grid container alignItems='stretch' direction='column' spacing={0}>
          <Grid item>
            <Grid container alignItems='center' direction='column' spacing={0}>
              <Grid item>
                <img {...inputs.image}/>
              </Grid>
            </Grid>
          </Grid>
          <Grid item>
            <Grid container spacing={0} alignItems='center' style={{
                  backgroundColor: this.props.theme.palette.primary.light
                }}>
              <Grid item xs={10}>
                <Typography align='left' 
                style={{
                  color: this.props.theme.palette.primary.contrastText,
                  paddingLeft: 10,
                  opacity: 0.8
                }}>
                  {this.props.product.title}
                </Typography>
              </Grid>
              <Grid item xs>
                <IconButton>
                    {this.state.countInCart > 0 ? 
                      (<Badge color="secondary" badgeContent={this.state.countInCart} className={this.props.classes.margin}>
                        <AddShoppingCart 
                                              nativeColor={this.props.theme.palette.primary.contrastText}
                                              onClick={() => {
                                                this.props.addProductToCart(this.props.productID);
                                                this.setState({countInCart: this.state.countInCart + 1});
                                              }}/>
                      </Badge>)
                      : <AddShoppingCart 
                      nativeColor={this.props.theme.palette.primary.contrastText}
                      onClick={() => {
                        this.props.addProductToCart(this.props.productID);
                        this.setState({countInCart: this.state.countInCart + 1});
                      }}/>}
                </IconButton>
              </Grid>

          </Grid>
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
