var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var mysql = require('mysql');
var bodyParser = require('body-parser');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

//var dbConnectionPool = mysql.createPool({ host: 'localhost', database: 'wdcoverflow'});
//app.use(function(req, res, next) {
//    req.pool = dbConnectionPool;
//    next();
//});


//modify this
var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : '',
	database : 'nodelogin'
});


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(session({                             //           //
  secret: 'a string of your choice',          //           //
  resave: false,                              // THIS CODE //
  saveUninitialized: true,                    //           //
  cookie: { secure: false }                   //           //
}));
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());

//setting login page as default
app.use(express.static(path.join(__dirname, 'public'),{index:'login.html'}));

app.post('/auth', function(request, response) {
	var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		connection.query('SELECT * FROM User WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				response.redirect('/home');
			} else {
				response.send('Incorrect Username and/or Password!');
			}
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

app.get('/home', function(request, response) {
	if (request.session.loggedin) {
		response.send('Welcome back, ' + request.session.username + '!');
	} else {
		response.send('Please login to view this page!');
	}
	response.end();
});

app.listen(3000);

app.use('/', indexRouter);
app.use('/users', usersRouter);

module.exports = app;
