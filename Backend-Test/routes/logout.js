var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var connection = mysql.createConnection({
    host     : 'localhost',
    port     : '3306',
    user     : 'capstone_27',
    password : 'zoqtmxhs27wh!',
    database : 'capstone_27'
});
connection.connect();

/* GET logout */
router.get('/', function(req, res, next) {
        delete req.session.idx;
        res.render('index_guest');
});


module.exports = router;
