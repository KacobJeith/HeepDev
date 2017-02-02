import fs from 'fs';
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

