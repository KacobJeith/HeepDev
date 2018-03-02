import ShopifyBuy from 'shopify-buy'
import * as setup from '../index'
import * as actions from '../redux/actions'

var client = ShopifyBuy.buildClient({
    domain: 'shopheep.myshopify.com',
    storefrontAccessToken: 'a444eb17144b5b4e7841eaa1e4cf8698'
});

export const InitializeShopify = () => {


  client.collection.fetchAllWithProducts().then((collections) => {
    // Do something with the collections
    console.log('collections: ', collections)
  });

   client.product.fetchAll().then((products) => {
    AddProductsToRedux(products);
  }); 
}

const AddProductsToRedux = (products) => {
  
  setup.store.dispatch(actions.populateShopify(products));
}

export const AddProductToCart = (checkoutID, productData) => {

   if (checkoutID == null ) {
      createCart(updateCheckout, productData)
   } else {
      updateCheckout(checkoutID, productData);
   }
}

const updateCheckout = (checkoutID, productData) => {

  const lineItemsToAdd = [
     {
       variantId: productData.variants[0].id, 
       quantity: 1
     }
   ];

   client.checkout.addLineItems(checkoutID, lineItemsToAdd).then((checkout) => {
     setup.store.dispatch(actions.saveCartLocally(checkout));
   });
}

const createCart = (callback = (_checkoutID, _passData) => {}, passData) => {

  client.checkout.create().then((checkout) => {
      var checkoutID = checkout.id;

      setup.store.dispatch(actions.createCheckout(checkoutID));

      callback(checkoutID, passData);
  });

}

export const retrieveCheckout = (checkoutID) => {

  client.checkout.fetch(checkoutID).then((checkout) => {
    // Do something with the checkout
    console.log(checkout);
    setup.store.dispatch(actions.saveCartLocally(checkout));

  });
}


