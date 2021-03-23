var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  if(!req.session.nickname)
    res.render('index_guest', { title: 'guest!' });
  else
    res.render('index_logined', { nickname: req.session.nickname });

});

module.exports = router;
