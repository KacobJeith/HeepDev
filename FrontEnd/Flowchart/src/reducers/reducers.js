import { combineReducers } from 'redux'
import 'babel-polyfill'
import * as actions from '../actions/actions'

const initialState = {
  clients: {},
  positions: {},
  vertexList: {},
  url: ''
}

function clients(state = initialState, action) {
  switch (action.type) {
    default:
      return state
  }
}

function url(state = initialState, action) {
  switch (action.type) {
    case 'STORE_URL':      
      return (action.url)
    default:
      return state
  }
}

function vertexList(state = initialState, action) {
  switch (action.type) {
    case 'ADD_VERTEX':
      return (action.vertex)
    case 'POSITION_VERTEX':
      console.log(action)
      return state
    default:
      return state
  }
}

function positions(state = initialState, action) {
  switch (action.type) {
    case 'POSITION_CLIENT':
      return {...state,
              [action.clientID]: {top: action.newPosition['top'] + state[action.clientID]['top'], left: action.newPosition['left'] + state[action.clientID]['left']}
            }
    default:
      return state
  }
}

const heepApp = combineReducers({
	clients,
  vertexList,
  positions,
  url
})

export default heepApp


