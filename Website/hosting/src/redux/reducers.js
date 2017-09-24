import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import * as actions from './actions'
import * as auth from './FirebaseAuth'

const initialState = Immutable.Map({
  shopify: {},
  scrollPosition: 0,
  webGLStatus: false,
  loginStatus: false,
  providers: {}
})

export default function(state = initialState, action) {
  switch (action.type) {
    case 'POPULATE_SHOPIFY' :

        var newState = Immutable.Map(state.shopify).toJS();

        for (var i = 0; i < action.products.length; i++){
          newState[action.products[i].id] = action.products[i].attrs;
        }

      return Immutable.Map(state).set('shopify', newState).toJS()
      
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

    default:
      return state
  }
}
