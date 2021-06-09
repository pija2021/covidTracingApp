var express = require('express');
var router = express.Router();

const CLIENT_ID = 'YOUR_GOOGLE_OAUTH_CLIENT_ID';

const {OAuth2Client} = require('google-auth-library');
const client = new OAuth2Client(CLIENT_ID);



/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});










/*let users = {
    test: 'password',
    test2: 'p2'
};

router.post('/login', function(req, res, next) {

    if( 'user' in req.body ) {
        if(req.body.user in users){
            if(users[req.body.user] === req.body.pass){
                req.session.user = req.body.user;
                res.send(req.session.user);
            } else {
                res.sendStatus(401);
            }
        } else {
            res.sendStatus(401);
        }
    } else if( 'token' in req.body ) {

        async function verify() {
          const ticket = await client.verifyIdToken({
              idToken: req.body.token,
              audience: CLIENT_ID,  // Specify the CLIENT_ID of the app that accesses the backend
              // Or, if multiple clients access the backend:
              //[CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3]
          });
          const payload = ticket.getPayload();
          req.session.user = payload['email'];
          res.send(req.session.user);
          // If request specified a G Suite domain:
          // const domain = payload['hd'];
        }
        verify().catch(function(){res.sendStatus(401);});

    }

});

router.post('/logout', function(req, res, next) {

    delete req.session.user;
    res.send();

});*/


router.use(function(req, res, next) {
    if('user' in req.session){
        next();
    } else {
        res.sendStatus(401);
    }
});


module.exports = router;
