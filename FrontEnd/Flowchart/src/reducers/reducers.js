import { combineReducers } from 'redux'
import 'babel-polyfill'
import * as actions from '../actions/actions'

const initialState = {
  clients: {},
  positions: {},
  vertexList: {},
  controls: {},
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
              [action.clientID]: {client: {top: action.newPosition['top'] + state[action.clientID]['client']['top'], left: action.newPosition['left'] + state[action.clientID]['client']['left']}}
            }
    default:
      return state
  }
}

function controls(state = initialState, action) {
  switch (action.type) {
    default:
      return state
  }
}


const heepApp = combineReducers({
	clients,
  vertexList,
  positions,
  controls,
  url
})

export default heepApp


