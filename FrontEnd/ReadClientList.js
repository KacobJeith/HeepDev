// Read the file and print its contents.
var fs = require('fs');
var filename = 'clientList.tbl'

fs.readFile(filename, 'utf8', function(err, data) {
  if (err) throw err;
  console.log('OK: ' + filename);
  console.log(data)
});

console.log('Im Here');