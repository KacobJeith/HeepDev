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

  const variantID = productData.variants[0].id;

   if (checkoutID == null ) {
      createCart(AddToCheckout, variantID)
   } else {
      AddToCheckout(checkoutID, variantID);
   }
}

export const RemoveProductFromCart = (checkoutID, variantID) => {

  const lineItemIDsToRemove = [variantID];

  client.checkout.removeLineItems(checkoutID, lineItemIdsToRemove).then((checkout) => {
    setup.store.dispatch(actions.saveCartLocally(checkout));
  });

}



export const AddToCheckout = (checkoutID, variantID) => {

  const lineItemsToAdd = [
     {
       variantId: variantID, 
       quantity: 1
     }
   ];

   client.checkout.addLineItems(checkoutID, lineItemsToAdd).then((checkout) => {
     setup.store.dispatch(actions.saveCartLocally(checkout));
   });
}

export const UpdateQuantityInCart = (checkoutID, lineItemID, newQuantity) => {

  const lineItemsToUpdate = [
     {
       id: lineItemID, 
       quantity: newQuantity
     }
   ];

   client.checkout.updateLineItems(checkoutID, lineItemsToUpdate).then((checkout) => {
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

export const retrieveCheckout = (checkoutID, callback = (checkout) => setup.store.dispatch(actions.saveCartLocally(checkout))) => {


  client.checkout.fetch(checkoutID).then((checkout) => {
    // Do something with the checkout
    callback(checkout)

  });
}


