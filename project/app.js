var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var bodyParser = require('body-parser');
var mysql = require('mysql');



var dbConnectionPool = mysql.createPool({
    host:'localhost',
    database: 'tables'
});


var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();


app.use(function(req,res,next){
    req.pool = dbConnectionPool;
    next();
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


//setting login page as default
app.use(express.static(path.join(__dirname, 'public'),{index:'login.html'}));



app.use('/', indexRouter);
app.use('/users', usersRouter);

module.exports = app;
