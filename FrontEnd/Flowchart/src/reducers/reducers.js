import { combineReducers } from 'redux'
import { SET_VISIBILITY_FILTER, VisibilityFilters } from '../actions/actions'

const initialState = {
  visibilityFilter: VisibilityFilters.SHOW_ALL,
  vertexPaths: [],
  clientList: []
}

function clientList(state = initialState, action) {
  switch (action.type) {
    case SET_VISIBILITY_FILTER:
      return Object.assign({}, state, {
        visibilityFilter: action.filter
      })
    default:
      return state
  }
}

const heepApp = combineReducers({
	clientList
})

export default heepApp
