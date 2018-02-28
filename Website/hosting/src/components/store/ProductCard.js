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

  render() {

    const inputs = {
      
      image: {
        src: this.props.product.images[0].src,
        style: {
          maxHeight: "100%",//"calc(25vw - 8px)",
          maxWidth: "100%",
          display: 'block',
          margin: 'auto'
        }
      }
    }

    // <SmartBadge count={this.state.countInCart}>
    //                           <AddShoppingCart nativeColor={this.props.theme.palette.secondary.contrastText} style={{display:'inline-block', margin: this.props.theme.spacing.unit}}/>
    //                       </SmartBadge>

    return (
      <Grid item xs={12}>
        <Grid container alignItems='stretch' direction='row' spacing={24}>
          <Grid item xs={12} sm={3} >
            <Grid container alignItems='stretch' justify='center' direction='row' spacing={16}>
              <Grid item xs>
                <Link to={"/product/" + this.props.productID} >
                  <div style={{
                    height:'100%',
                    width:'100%',
                    position:'relative'
                  }}> 
                    <img {...inputs.image}/>
                 
                    <div style={{
                        backgroundColor:'white',
                        opacity: this.state.hover ? 0.15 : 0.0,
                        height:'100%',
                        position:'absolute',
                        top:0,
                        width:'100%'
                      }}
                      onMouseEnter={()=>{this.setState({hover: true})}}
                      onMouseLeave={()=>{this.setState({hover: false})}}
                    />
                  </div>
                </Link>
              </Grid>
            </Grid>
          </Grid>
          <Grid item xs={12} sm={9} >
            <Grid container alignItems='stretch' direction='column' justify='space-between' style={{width:'100%'}}>
              <Grid item xs>
                <Link to={"/product/" + this.props.productID} >
                  <Typography align='left' variant="title" gutterBottom paragraph >
                    {this.props.product.title}
                  </Typography>
                </Link>

                <Typography align='left' variant="caption" gutterBottom paragraph>
                    {this.props.product.description}
                </Typography>
              </Grid>
              <Grid item xs>
                <div >
                <Grid container alignItems='center'>
                      <Grid item xs>
                  <Button 
                    variant="raised" 
                    color="secondary" 
                    size='large' 
                    style={{
                      zoom: 0.4, 
                      margin: this.props.theme.spacing.unit,
                      justifyContent: 'center',
                      align:'center',
                      padding: 0
                    }} 
                    onClick={() => {
                      this.props.addProductToCart(this.props.productID);
                      this.setState({countInCart: this.state.countInCart + 1});
                    }}>
                    
                          <Typography variant='caption' style={{display:'inline-block', margin: this.props.theme.spacing.unit * 2, color:this.props.theme.palette.secondary.contrastText}} >
                            Add to Cart 
                          </Typography>
                          {SmartBadge(this.state.countInCart,
                            <AddShoppingCart 
                              nativeColor={this.props.theme.palette.secondary.contrastText} 
                              style={{
                                display:'inline-block', 
                                margin: this.props.theme.spacing.unit
                              }}/>)
                          }
                            
                      </Button>
                      <Typography variant='body1'  style={{display:'inline-block', margin: this.props.theme.spacing.unit}}>
                          $ {this.props.product.variants[0].price}
                      </Typography>
                          
                    </Grid>
                  </Grid>
                </div>
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

