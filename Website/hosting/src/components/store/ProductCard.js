import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'
import { Grid, Typography }   from 'material-ui';

var mapStateToProps = (state, ownProps) => ({
  product: state.shopify[ownProps.productID],
  productID: ownProps.productID
})

class ProductCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false,
      deletionHover: false
    }
  }

  render() {

    var useBuyButtonUI = false;

    const inputs = {
      container: {
        style: {
          marginTop: useBuyButtonUI ? 0 : 25,
          marginLeft: useBuyButtonUI ? 50 : 25,
          position: "relative",
          boxShadow: this.state.hover ? "0px 5px 15px #999" : "" ,
          width: 300,
          height: 300,
          transition: "transform 400ms",
          transform: this.state.hover ? "translate(0px, -5px)" : "translate(0px, 0px)"
        },
        id: String(this.props.product.id),
        onMouseEnter: () => this.setState({hover: true}),
        onMouseLeave: () => this.setState({hover: false})
      },
      addCard: {
        style: {
          height: 230,
          width: 300,
          backgroundColor: "black",
          position: "absolute",
          top: 0,
          left: 0,
          opacity: 0.3,
          boxShadow: this.state.hover ? "5px 5px 5px #111" : ""
        }
      },
      imageContainer: {
        style: {
          position: 'relative',
          height: 230,
          width: 300,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }
      },
      image: {
        src: this.props.product.images[0].src,
        style: {
          // // position: "absolute",
          // left: 0,
          // top: 0,
          maxHeight: "calc(100vw / 4)",
          maxWidth: "100%"
        }
      },
      optionsBar: {
        style: {
          position: "absolute",
          alignItems: "center",
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
          top: 230,
          left: 0,
          bottom: 0,
          height: 70,
          width: "100%",
          backgroundColor: "lightGray",
          color: "black",
          //fontSize: 18,
          cursor: 'pointer'
        },
        onClick: () => {this.props.addProductToCart(this.props.productID)}
      }
    }

    return (
      <Grid item xs={4}>
        <Grid container alignItems='center' direction='column' spacing={0}>
          <Grid item >
            <img {...inputs.image}/>
          </Grid>
          <Grid item>
            <Typography align='center' 
            style={{
              backgroundColor:'black',
              opacity: 0.25,
              color:'white',
              width:'100%'
            }}>
              {this.props.product.title}
            </Typography>
          </Grid>
        </Grid>
      </Grid>

    );

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(ProductCard)
