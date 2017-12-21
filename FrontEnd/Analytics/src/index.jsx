import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import Immutable from 'immutable'
import { createStore, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import {HashRouter as Router, Route} from 'react-router-dom'

import * as auth from './firebase/FirebaseAuth.js'
import reducers from './redux/reducers.js'
import BarChart from './components/BarChart.jsx'


const startState = {
	data: ""
};

console.log(startState);

export const initialState = Immutable.Map(startState)
export const store = createStore(reducers, startState, applyMiddleware(thunk));

auth.initializeFirebase();

render(
  <Provider store={store}>
    <Router >
		<Route path="/" component={BarChart}/>
	</Router>
  </Provider>,

  document.getElementById('root')
);



