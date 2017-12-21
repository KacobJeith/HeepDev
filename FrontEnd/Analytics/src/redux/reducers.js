import { combineReducers } from 'redux'
import Immutable from 'immutable'
// import 'babel-polyfill'
import { initialState } from '../index.jsx'

export default function(state = initialState, action) {
  switch (action.type) {
    case 'ADD_MEMORY_DUMP' :

      console.log("Adding data to redux: ", action.data);

      return Immutable.Map(state).set('data', action.data).toJS();

    default:
      return state
  }
}
