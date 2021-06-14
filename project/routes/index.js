var express = require('express');
var router = express.Router();
var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "",
  password: "",
	database: 'tables'
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

//used to make new check in history
router.post('/history/new', function(req,res){

});

//used to acquire checkin history to display
router.get('/history', function(req,res){

});

//used to acquire users profile json
router.get('/profile', function(req,res){
    con.query("SELECT * FROM User", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//used to update user json
router.post('/profile/update', function(req,res){

});

//used to get hotspots for map
router.get('/hotspot', function(req,res){
  con.query("SELECT * FROM Hotspot", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//used to add more hotspots or to remove
router.post('/hotspot/update', function(req,res){
  con.query("INSERT INTO `Hotspot` VALUES (2,NULL,'Home');", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//used to get contact message
router.post('/contactmessage/new', function(req,res){

});

//gets address
router.get('/address', function(req,res){
  con.query("SELECT * FROM AddressLine", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//create new address
router.post('/address/new', function(req,res){
  con.query("INSERT INTO AddressLine VALUES (AdelaideUni)", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
});

//delete address
router.post('/adress/delete', function(req,res){

});

//get latitude and longitude
router.get('/location/LNG&LAT', function(req,res){

});

//authenticate login
router.get('/login/authenticate', function(req,res){

});

module.exports = router;