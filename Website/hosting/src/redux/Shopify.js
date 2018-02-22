import ShopifyBuy from 'shopify-buy'
import * as setup from '../index'
import * as actions from '../redux/actions'

export const InitializeShopify = () => {

  var client = ShopifyBuy.buildClient({
    domain: 'shopheep.myshopify.com',
    storefrontAccessToken: 'a444eb17144b5b4e7841eaa1e4cf8698'
    // appId: '6',
  });

   

  client.collection.fetchAllWithProducts().then((collections) => {
    // Do something with the collections
    console.log(collections);
    console.log(collections[0].products);
  });

  client.checkout.create().then((checkout) => {
      console.log("CHECKOUT: ", checkout);
      var checkoutID = checkout.id;

      setup.store.dispatch(actions.setCheckout(checkoutID));
  });

   client.product.fetchAll().then((products) => {
    console.log("PRODUCTS: ", products);
    AddProductsToRedux(products);
  }); 
}

const AddProductsToRedux = (products) => {
  
  setup.store.dispatch(actions.populateShopify(products));
}
