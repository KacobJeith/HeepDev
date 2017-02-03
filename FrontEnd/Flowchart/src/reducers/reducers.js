import { combineReducers } from 'redux'
import 'babel-polyfill'
import * as actions from '../actions/actions'

const initialState = {
  vertexList: [],
  clientList: [],
  url: ''
}

function clientList(state = initialState, action) {
  switch (action.type) {
    case 'POSITION_CLIENT':
      return {
        ...state,
        clientList: action.clientList
      }
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
    case 'DELETE_VERTEX':
      return {
        ...state,
        vertexList: state.vertexList.pop()
      }
    case 'ADD_VERTEX':
      return {
        ...state,
        vertexList: state.vertexList.push(action.vertex)
      }
    default:
      return state
  }
}

const heepApp = combineReducers({
	clientList,
  vertexList,
  url
})

export default heepApp


