import 'babel-polyfill'
import Immutable from 'immutable'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import heepApp from './redux/reducers'
import App from './containers/AppContainer'
import thunk from 'redux-thunk';
import $ from 'jquery'


function loadClientsFromServer(url) {

  $.ajax({
    url: url,
    cache: false,
    success: (data) => {

      data.url = window.location.protocol.concat('//', window.location.hostname,':3001');

      var immutableMap = Immutable.Map(data);
      const store = createStore(heepApp, data, applyMiddleware(thunk));
      console.log(data);

      render(
        <Provider store={store}>
          <App/>
        </Provider>,
        document.getElementById('root')
      )
    },
    error: function(xhr, status, err) {
      console.error(url, status, err.toString());
      }
    });
}

loadClientsFromServer(window.location.protocol.concat('//', window.location.hostname,':3001').concat('/api/clients'));


