import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../redux/actions'

var mapStateToProps = (state, ownProps) => ({
  product: state.shopify[ownProps.productID]
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

    var useBuyButtonUI = true;

  	const styles = {
        container : {
     		  marginTop: useBuyButtonUI ? 0 : 25,
          marginLeft: useBuyButtonUI ? 50 : 25,
          display: "flex",
          alignItems: "center",
          flexDirection: "row",
          justifyContent: "center",
          position: "relative",
          boxShadow: this.state.hover ? "5px 5px 5px #555" : "" 
        },
        addCard : {
          height: 230,
          width: 300,
          backgroundColor: "black", 
          position: "absolute",
          top: 0,
          left: 0,
          opacity: 0.3,
          boxShadow: this.state.hover ? "5px 5px 5px #555" : "" 
        },
        image: {
          position: "absolute",
          left: 0,
          top: 0
        },
        optionsBar: {
          position: "absolute", 
          alignItems: "center",
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
          left: 0,
          bottom: 0,
          height: 70,
          fontSize: 40,
          width: "100%",
          backgroundColor: "lightGray",
          color: "black"
        }

      };

    const inputs = {
      container: {
        style: styles.container,
        id: String(this.props.product.product_id)
      },
      addCard: {
        style: styles.addCard,
      },
      image: {
        src: this.props.product.images[0].src,
        height: 230,
        width: 300,
        style: styles.image
      },
      optionsBar: {
        style: styles.optionsBar
      }
    }


    if (useBuyButtonUI) {
      console.log(this.props.product);
      ShopifyBuildProduct(this.props.product.product_id);

      return (<div {...inputs.container}/>);

    } else {

      return (<div {...inputs.container}>
              <img {...inputs.image}/>
              <div {...inputs.addCard}> </div>
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
      apiKey: 'a444eb17144b5b4e7841eaa1e4cf8698',
      appId: '6',
    });

    ShopifyBuy.UI.onReady(client).then(function (ui) {
      ui.createComponent('product', {
        id: [productID],
        node: document.getElementById(String(productID)),
        moneyFormat: '%24%7B%7Bamount%7D%7D',
        options: {
          "product": {
            "variantId": "all",
            "width": "240px",
            "contents": {
              "imgWithCarousel": false,
              "variantTitle": false,
              "description": false,
              "buttonWithQuantity": false,
              "quantity": false
            },
            "styles": {
              "product": {
                "@media (min-width: 601px)": {
                  "max-width": "100%",
                  "margin-left": "0",
                  "margin-bottom": "50px"
                }
              },
              "compareAt": {
                "font-size": "12px"
              }
            }
          },
          "cart": {
            "contents": {
              "button": true
            },
            "styles": {
              "footer": {
                "background-color": "#ffffff"
              }
            }
          },
          "modalProduct": {
            "contents": {
              "img": false,
              "imgWithCarousel": true,
              "variantTitle": true,
              "buttonWithQuantity": true,
              "button": false,
              "quantity": true
            },
            "styles": {
              "product": {
                "@media (min-width: 601px)": {
                  "max-width": "100%",
                  "margin-left": "0px",
                  "margin-bottom": "0px"
                }
              }
            }
          },
          "productSet": {
            "styles": {
              "products": {
                "@media (min-width: 601px)": {
                  "margin-left": "-20px"
                }
              }
            }
          }
        }
      });
    });
  }