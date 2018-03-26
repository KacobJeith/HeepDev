import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import { initialState } from '../index'
import * as actions from './actions'
import * as auth from '../firebase/FirebaseAuth'
import * as database from '../firebase/FirebaseDatabase'
import * as shopify from '../shopify/Shopify'

export default function(state = initialState, action) {
  switch (action.type) {
    case 'LOGIN' :

      setTimeout(() => {auth.handleLogin()}, 100);

      return state
    case 'POPULATE_SHOPIFY' :

        var newState = Immutable.Map(state.shopify).toJS();

        for (var i = 0; i < action.products.length; i++){
          newState[action.products[i].variants[0].id] = action.products[i];
        }

      return Immutable.Map(state).set('shopify', newState).toJS()

    case 'POPULATE_COLLECTIONS' :

        let titleCollections = Immutable.Map(state.collections).toJS();

        for (let i = 0; i < action.collections.length; i++){
          titleCollections[action.collections[i].title] = action.collections[i];
        }

      return Immutable.Map(state).set('collections', titleCollections).toJS()

    case 'CREATE_CHECKOUT' :

      database.saveCheckoutID(action.checkoutID);

      return Immutable.Map(state).set('checkoutID', action.checkoutID).toJS()

    case 'SET_CHECKOUT' :

      shopify.retrieveCheckout(action.checkoutID);

      return Immutable.Map(state).set('checkoutID', action.checkoutID).toJS()

    case 'ADD_PRODUCT_TO_CART' :

      shopify.AddProductToCart(state.checkoutID, state.shopify[action.productID]);

      return Immutable.Map(state).set('itemsInCart', state.itemsInCart += 1).toJS();

    case 'UPDATE_QUANTITY_IN_CART' :

      shopify.UpdateQuantityInCart(state.checkoutID, action.lineItemID,  parseInt(action.newQuantity));

      return state

    case 'REMOVE_PRODUCT_FROM_CART' :

      shopify.RemoveProductFromCart(state.checkoutID, action.variantID)

      return state

    case 'SAVE_CART_LOCALLY' :

        var trueLineItemIDs = [];
        for (var i = 0; i < action.cart.lineItems.length; i++) {
          trueLineItemIDs.push(action.cart.lineItems[i].variant.id);
        }

        var knownLineItemIDs = Object.keys(state.cartContext);

        var newCartContext = Immutable.Map(state.cartContext).toJS();

        for (var lineItemID in trueLineItemIDs) {
          var value = trueLineItemIDs[lineItemID];

          if (!(value in newCartContext)) {

            if (Object.keys(state.places).length > 0) {

              newCartContext[value] = Object.keys(state.places)[0];

            } else {
              newCartContext[value] = 'none';
            }
          }
        }

      return Immutable.Map(state).set('shoppingCart', action.cart).set('cartContext', newCartContext).toJS()

    case 'UPDATE_CART_CONTEXT' :

      var newCartContext = Immutable.Map(state.cartContext).toJS();

      newCartContext[action.variantID] = action.placeID;


      return Immutable.Map(state).set('cartContext', newCartContext).toJS()

    case 'PUSH_CART_TO_QUEUE' :

      console.log('Pushing cart');

      const checkoutID = state.shoppingCart.id;


      database.pushCartToFulfillmentQueue(checkoutID, state.cartContext);

      return state

    case 'SCROLL':

      return Immutable.Map(state).set('scrollPosition', action.positionY).toJS()

    case 'UPDATE_WEBGL_STATUS':

      return Immutable.Map(state).set('webGLStatus', action.status).toJS()

    case 'LOGOUT':

      auth.logout();

      return initialState

    case 'LOGIN_STATUS' :

      return Immutable.Map(state).set('loginStatus', action.status).toJS()

    case 'LOAD_PROVIDER' :

      var newState = Immutable.Map(state.providers).set(action.provider.providerId, action.provider).toJS();

      return Immutable.Map(state).set('providers', newState).toJS()

    case 'UNLINK_PROVIDER' :

      var newState = Immutable.Map(state.providers).delete(action.providerId).toJS();

      return Immutable.Map(state).set('providers', newState).toJS()

    case 'ADD_DEVICE' :

      var newState = Immutable.Map(state.devices).set(action.deviceID, action.device).toJS();

      return Immutable.Map(state).set('devices', newState).toJS()

    case 'ADD_PLACE' :

      var newState = Immutable.Map(state.places).set(action.placeID, action.place).toJS();

      return Immutable.Map(state).set('places', newState).toJS()

    case 'ADD_GROUP' :

      var newState = Immutable.Map(state.groups).set(action.groupID, action.group).toJS();

      return Immutable.Map(state).set('groups', newState).toJS()

    case 'SAVE_NEW_PLACE' :

      setTimeout(() => {
        database.saveNewPlace(action.placeName, action.placeSSID, action.placeSSIDPassword)
      }, 100);

      return state

    case 'DELETE_PLACE_FROM_FIREBASE' :

      setTimeout(() => {
        database.deletePlace(action.placeID)
      }, 1000);

      return state

    case 'DELETE_PLACE':

      var newState = Immutable.Map(state.places).delete(action.placeID).toJS();

      return Immutable.Map(state).set('places', newState).toJS()

    default:
      return state
  }
}
