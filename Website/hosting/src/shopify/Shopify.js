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
  });

  client.checkout.create().then((checkout) => {
      var checkoutID = checkout.id;

      setup.store.dispatch(actions.setCheckout(checkoutID));
  });

   client.product.fetchAll().then((products) => {
    AddProductsToRedux(products);
  }); 
}

const AddProductsToRedux = (products) => {
  
  setup.store.dispatch(actions.populateShopify(products));
}

export const AddProductToCart = (checkoutID, productData) => {

  var client = ShopifyBuy.buildClient({
    domain: 'shopheep.myshopify.com',
    storefrontAccessToken: 'a444eb17144b5b4e7841eaa1e4cf8698'
    // appId: '6',
  });


 const lineItemsToAdd = [
    {
      variantId: productData.variants[0].id, 
      quantity: 1
    }
  ];

  // Add an item to the checkout
  client.checkout.addLineItems(checkoutID, lineItemsToAdd).then((checkout) => {
    // Do something with the updated checkout
    console.log(checkout.lineItems); // Array with one additional line item
  });
}
