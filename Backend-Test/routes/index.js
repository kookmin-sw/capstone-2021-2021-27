var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  if(!req.session.idx)
    res.render('index_guest');
  else
    res.render('index_logined', { nickname: req.session.nickname });

});

module.exports = router;
