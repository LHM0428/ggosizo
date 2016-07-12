	var https = require('https');
	 
	 var client_id = 'X36hn5S4udKO5mXkb3IK';
	 var client_secret = 'gul5uME41h';
	 var host = 'openapi.naver.com';
	 var port = 443;
	 var uri = 'https://openapi.naver.com/v1/search/blog.xml';
 	 
	 var options = {
	 		host: host,
	 		port: port,
	 		path: uri,
	 		method: 'POST',
	 		headers: {'X-Naver-Client-Id':client_id, 'X-Naver-Client-Secret': client_secret}
	 };
	 
	 var req = https.request(options, function(res) {
	 		console.log('STATUS: ' + res.statusCode);
	 		console.log('HEADERS: ' + res.headers);
	 		res.setEncoding('utf8');
	 		res.on('data', function (chunk) {
	 				console.log('BODY: ' + chunk);
	 		});
	 });
	 req.end();