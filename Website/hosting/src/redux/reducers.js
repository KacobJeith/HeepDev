import { combineReducers } from 'redux'
import Immutable from 'immutable'
import 'babel-polyfill'
import * as actions from './actions'
import * as database from './firebase'

const initialState = Immutable.Map({
  shopify: {}
})

export default function(state = initialState, action) {
  switch (action.type) {
    case 'POPULATE_SHOPIFY' :
        console.log("IN REDUCER: ", action.products);
        var newState = Immutable.Map(state.shopify).toJS();

        for (var i = 0; i < action.products.length; i++){
          newState[action.products[i].id] = action.products[i].attrs;
        }

      return Immutable.Map(state).set('shopify', newState).toJS()
    case 'LOGOUT':

      database.logout();

      return initialState
    default:
      return state
  }
}
