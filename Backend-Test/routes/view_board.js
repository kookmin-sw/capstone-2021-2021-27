var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var bodyParser = require('body-parser');

var connection = mysql.createConnection({
    host     : 'capstone.louissoft.kr',
    port     : '26773',
    user     : 'capstone_27',
    password : 'zoqtmxhs27wh!',
    database : 'capstone_27'
});
connection.connect();


/* GET home page. */
router.get('/:board_idx', function(req, res, next) {

    res.render('view_board');
});

router.get('/', function(req, res, next) {
    if(!req.session.idx)
        res.render('index_guest');
    else
        res.render('index_logined')
});


module.exports = router;
