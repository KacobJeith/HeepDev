import fs from 'fs';
var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var app = express();

var CLIENT_FILE = path.join(__dirname, '../../../Server/clientList.json');
var COMMAND_FILE = path.join(__dirname, '../../../Server/CommandQueue.tmp');

var cmd_fd = fs.openSync(COMMAND_FILE,'r');

app.set('port', (process.env.PORT || 3001));

app.use('/', express.static(__dirname));
app.use('/static', express.static(path.join(__dirname, '../../../Server')))
console.log(path.join(__dirname, '../../../Server'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

// Additional middleware which will set headers that we need on each request.
app.use(function(req, res, next) {
    // Set permissive CORS header - this allows this server to be used only as
    // an API server in conjunction with something like webpack-dev-server.
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Disable caching so we'll always get the latest clients.
    res.setHeader('Cache-Control', 'no-cache');
    next();
});

app.get('/api/clients', function(req, res) {
  fs.readFile(CLIENT_FILE, function(err, data) {
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

app.post('/api/commands', function(req, res) {
  console.log("entering server code");
  console.log(req.body);
  const command = req.body["command"];

  fs.appendFile(COMMAND_FILE, command, function(err, data) {
    if (err) {
      console.error(err);
      res.end("AJAX FAILED :(");
      console.log("re-trying");
      //Server attempts to re-send a command after 200ms if the file is busy
      setTimeout(function(err, data) {
          fs.appendFile(COMMAND_FILE, command, function(err, data) {
            if (err) {
              console.error(err);
              res.end("AJAX FAILED :(");
            }
            console.log(command);
            fs.close(cmd_fd);
          });}
          , 200);
    }

    console.log(command);
    fs.close(cmd_fd);
  });

  res.end("AJAX WORKED?!");

});


app.listen(app.get('port'), function() {
  console.log('Server started: http://localhost:' + app.get('port') + '/');
});



var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');

var webpackDevConfig = require('./webpack.config.development');
console.log(webpackDevConfig);

new WebpackDevServer(webpack(webpackDevConfig), {
  quiet: false,
  stats: { colors: true },
  historyApiFallback: true,
  headers: {
    'Access-Control-Allow-Origin': 'http://localhost:3001',
    'Access-Control-Allow-Headers': 'X-Requested-With'
  }
}).listen(3000, '0.0.0.0', function (err) {
  if (err) {
    console.log(err);
  }

  console.log('webpack dev server listening on localhost:3000');
});
