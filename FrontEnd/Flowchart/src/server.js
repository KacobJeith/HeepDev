import fs from 'fs';
import React from 'react';
import { createStore } from 'redux';
import heepApp from './reducers/reducers';
import { renderToString } from 'react-dom/server';
import { Provider } from 'react-redux';
import App from './components/App';
import path from 'path';
import express from 'express';
import bodyParser from 'body-parser';


var app = express();
var CLIENT_FILE = path.join(__dirname, '../../../Server/clientList.json');
var COMMAND_FILE = path.join(__dirname, '../../../Server/CommandQueue.tmp');
var cmd_fd = fs.openSync(COMMAND_FILE,'r');

app.set('port', (process.env.PORT || 3001));

//CORS middleware
var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', 'http://localhost:8080');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}

app.use(allowCrossDomain);
app.use('/', express.static(__dirname));
app.use('/static', express.static(path.join(__dirname, '../../../Server')))
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));


app.get('/api/clients', (req, res) => {
  fs.readFile(CLIENT_FILE, (err, data) => {
    if (err) {
      console.error(err);
      process.exit(1);
    }
    else {
      console.log(JSON.parse(data));
      res.json(JSON.parse(data));
    }

  });
});

// //y time the server side receives a request
// app.use(handleInitialRender)


// function handleInitialRender(req, res) {
//   console.log('entering handleReceiver');
//   fs.readFile(CLIENT_FILE, (err, data) => {
//     if (err) {
//       console.error(err);
//       process.exit(1);
//     }
//     else {
//       console.log('handling initial server side render...');
//       // Compile an initial state
//       const preloadedState = {clientList: JSON.parse(data) }
//       console.log(preloadedState)

//       // Create a new Redux store instance
//       const store = createStore(heepApp, preloadedState);

//       // Render the component to a string
//       const html = renderToString(
//         <Provider store={store}>
//           <App clientList={preloadedState.clientList}/>
//         </Provider>
//       )

//       // Grab the initial state from our Redux store
//       const finalState = store.getState()

//       // Send the rendered page back to the client
//       res.send(renderFullPage(html, finalState))
//     }
//   })
// }

// function renderFullPage(html, preloadedState) {
//   return `
//     <!doctype html>
//     <html>
//       <style> *{margin: 0px;  padding: 0px; } </style>
//       <head>
//         <title>Redux Universal Example</title>
//       </head>
//       <body>
//         <div id="root">${html}</div>
//         <script>
//           window.__PRELOADED_STATE__ = ${JSON.stringify(preloadedState).replace(/</g, '\\x3c')}
//         </script>
//         <script type="text/javascript" src="./dist/bundle.js"></script>
//       </body>
//     </html>
//     `
// }



app.post('/api/commands', (req, res) => {
  const command = req.body["command"];

  fs.appendFile(COMMAND_FILE, command, (err, data) => {
    if (err) {
      console.error(err);
      res.end("AJAX FAILED :(");
      console.log("re-trying");
      
      //Server attempts to re-send a command after 200ms if the file is busy
      setTimeout((err, data) => {
          fs.appendFile(COMMAND_FILE, command, (err, data) => {
            if (err) {
              console.error(err);
              res.end("AJAX FAILED :(");
            }

          });}
          , 200);
    }

    console.log(command);
  });

  res.end("AJAX WORKED?!");
});



app.listen(app.get('port'), (error) => {
  if (error) {
    console.error(error)
  } else {
    console.log('Server started: http://localhost:' + app.get('port') + '/');
  }
});

