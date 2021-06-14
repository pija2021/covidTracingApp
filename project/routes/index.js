var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var path = require('path');



var connection = mysql.createConnection({
	host     : 'localhost',
	database : 'tables'
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

router.post('/auth', function(req, res, next) {
    var username = req.body.username;
	var password = req.body.password;
	if (username && password) {
	    var query = "SELECT * FROM User WHERE username=? AND password=?";
		connection.query(query, [username, password], function(error, results, fields) {
			if (results.length > 0) {
				req.session.loggedin = true;
				req.session.username = username;
				res.redirect('/home');
			} else {
				res.send('Incorrect Username and/or Password!');
			}
			res.end();
		});
	} else {
		res.send('Please enter Username and Password!');
		res.end();
	}
});


router.get('/home', function(req,res){
  res.sendFile(path.resolve('public/home_page.html'));
});


//used to make new check in history
router.post('/history/new', function(req,res){

});

//used to acquire checkin history to display
router.get('/history', function(req,res){

});

//used to acquire users profile json
router.get('/profile', function(req,res){
    connection.query("SELECT * FROM User", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//used to update user json
router.post('/profile/update', function(req,res){

});

//used to get hotspots for map
router.get('/hotspot', function(req,res){
  connection.query("SELECT * FROM Hotspot", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//used to add more hotspots or to remove
router.post('/hotspot/update', function(req,res){
  connection.query("INSERT INTO `Hotspot` VALUES (2,NULL,'Home');", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//used to get contact message
router.post('/contactmessage/new', function(req,res){

});

//gets address
router.get('/address', function(req,res){
  connection.query("SELECT * FROM AddressLine", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//create new address
router.post('/address/new', function(req,res){
  connection.query("INSERT INTO AddressLine VALUES (AdelaideUni)", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//delete address
router.post('/address/delete', function(req,res){

});

//get latitude and longitude
router.get('/location/LNG&LAT', function(req,res){

});

//authenticate login
router.get('/login/authenticate', function(req,res){

});

module.exports = router;