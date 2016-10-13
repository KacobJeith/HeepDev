var http = require('http'),
      fs = require('fs'),
     url = require('url'),
 choices = ["hello world", "goodbye world"];

var filename = '../Server/clientList.tbl'

var parseStuff = function(path, response)
{
	var truePath = path;
	
	if(path == "/")
	{
		truePath = "/index.html";
	}
	
	console.log("True Path " + truePath);
	
	fs.readFile("." + truePath, function(err, file) {  
            if(err) {  
                // write an error response or nothing here  
                return;  
            }  
            //response.writeHead(200, { 'Content-Type': 'text/html' });  
            response.end(file, "utf-8");
        });
}

http.createServer(function(request, response){
    var path = url.parse(request.url).pathname;
	console.log("Path is " + path);
    if(path=="/getstring")
    {
        console.log("request recieved");
        var string = fs.readFile(filename, 'utf8', function(err, data) {
            if (err) throw err;
            console.log('OK: ' + filename);
            console.log(data);
            response.writeHead(200, {"Content-Type": "text/plain"});
            response.end(data, "utf-8");
        });
    }
    else{
		parseStuff(path, response);
    }
}).listen(8001);
console.log("server initialized");
