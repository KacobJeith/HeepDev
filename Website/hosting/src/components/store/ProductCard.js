import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../redux/actions'

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
          maxHeight: "100%",
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


    if (useBuyButtonUI) {

      setTimeout(ShopifyBuildProduct(this.props.product.id), 200);

      return (<div {...inputs.container}/>);

    } else {

      return (
                <div {...inputs.container}>
                  <div {...inputs.imageContainer}>
                    <img {...inputs.image}/>
                  </div>
                  <div {...inputs.optionsBar}>
                    {this.props.product.title}
                  </div>
                </div>

      );
    }

  }
}

var mapDispatchToProps = (dispatch) => {
  return bindActionCreators(Actions, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(ProductCard)

function ShopifyBuildProduct(productID) {
    var client = ShopifyBuy.buildClient({
      domain: 'shopheep.myshopify.com',
      storefrontAccessToken: 'a444eb17144b5b4e7841eaa1e4cf8698'
      // appId: '6',
    });

    var ui = ShopifyBuy.UI.init(client).createComponent('product', {
        id: [productID],
        node: document.getElementById(String(productID)),
        options: {
            product: {
              buttonDestination: 'modal'
            },
            cart: {
              startOpen: true
            }
          }
        });

        // node: document.getElementById(String(productID)),
        // moneyFormat: '%24%7B%7Bamount%7D%7D',
        // options: {
        //   "product": {
        //     "variantId": "all",
        //     "width": "240px",
        //     "contents": {
        //       "imgWithCarousel": false,
        //       "variantTitle": false,
        //       "description": false,
        //       "buttonWithQuantity": false,
        //       "quantity": false
        //     },
        //     "styles": {
        //       "product": {
        //         "@media (min-width: 601px)": {
        //           "max-width": "100%",
        //           "margin-left": "0",
        //           "margin-bottom": "50px"
        //         }
        //       },
        //       "compareAt": {
        //         "font-size": "12px"
        //       }
        //     }
        //   },
        //   "cart": {
        //     "contents": {
        //       "button": true
        //     },
        //     "styles": {
        //       "footer": {
        //         "background-color": "#ffffff"
        //       }
        //     }
        //   },
        //   "modalProduct": {
        //     "contents": {
        //       "img": false,
        //       "imgWithCarousel": true,
        //       "variantTitle": true,
        //       "buttonWithQuantity": true,
        //       "button": false,
        //       "quantity": true
        //     },
        //     "styles": {
        //       "product": {
        //         "@media (min-width: 601px)": {
        //           "max-width": "100%",
        //           "margin-left": "0px",
        //           "margin-bottom": "0px"
        //         }
        //       }
        //     }
        //   },
        //   "productSet": {
        //     "styles": {
        //       "products": {
        //         "@media (min-width: 601px)": {
        //           "margin-left": "-20px"
        //         }
        //       }
        //     }
        //   }
        // }
      // });
    // });
  }
