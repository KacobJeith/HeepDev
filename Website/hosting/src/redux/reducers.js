import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import { initialState } from '../index'
import * as actions from './actions'
import * as auth from './FirebaseAuth'
import * as database from './FirebaseDatabase'
import * as shopify from './Shopify'

export default function(state = initialState, action) {
  switch (action.type) {
    case 'LOGIN' :

      setTimeout(() => {auth.handleLogin()}, 100);

      return state
    case 'POPULATE_SHOPIFY' :

        var newState = Immutable.Map(state.shopify).toJS();

        for (var i = 0; i < action.products.length; i++){
          newState[action.products[i].id] = action.products[i];
        }

      return Immutable.Map(state).set('shopify', newState).toJS()

    case 'CREATE_CHECKOUT' :

      return Immutable.Map(state).set('checkoutID', action.checkoutID).toJS()

    case 'ADD_PRODUCT_TO_CART' :

      shopify.AddProductToCart(state.checkoutID, state.shopify[action.productID]);

      return Immutable.Map(state).set('itemsInCart', state.itemsInCart += 1).toJS();
      
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

/* <-------------------------------------------------------Paper Signals---------------------------------------------------------------------->*/
    case 'INIT_PAPER_SIGNALS' :

      // setTimeout(() => {auth.VerifyUser()}, 50);
      // setTimeout(() => {database.readUserSignals()}, 50);
      // setTimeout(() => {database.downloadAssets()}, 50);

      return state
    case 'ADD_SIGNAL':

      setTimeout(() => {database.addSignal(action.name, action.intent)}, 50);

      return state

    case 'UPDATE_NAME':
      setTimeout(() => {database.updateName(action.signalId, action.name)}, 50);

      return state

    case 'DELETE_SIGNAL':
    
      setTimeout(() => {database.deleteSignal(action.id)}, 1000);

      var newState = Immutable.Map(state.signals).delete(action.id).toJS();

      return Immutable.Map(state).set('signals', newState).toJS()

    case 'POP_SIGNAL':

      var newSignal = {
        id: action.id,
        content: action.content
      }

      var newState = Immutable.Map(state.signals).toJS();
      newState[action.id] = newSignal;

      return Immutable.Map(state).set('signals', newState).toJS()
    case 'STORE_FILE':

      var newState = Immutable.Map(state.files).toJS();
      newState[action.filename] = action.blob;

      return Immutable.Map(state).set('files', newState).toJS()

    case 'STORE_ICONURL':

      var newState = Immutable.Map(state.iconURLs).toJS();
      newState[action.iconName] = action.url;

      return Immutable.Map(state).set('iconURLs', newState).toJS()
  
    case 'STORE_INTENT_BACKGROUND_URL':

      var newState = Immutable.Map(state.intentBackgrounds).toJS();
      newState[action.intent] = action.url;

      return Immutable.Map(state).set('intentBackgrounds', newState).toJS()

    default:
      return state
  }
}
