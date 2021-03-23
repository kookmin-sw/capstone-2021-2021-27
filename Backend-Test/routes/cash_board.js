var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'capstone_27',
    password : 'capstone_27',
    database : 'capstone_27'
});
connection.connect();

/* GET home page. */
router.get('/', function(req, res, next) {
    if(!req.session.idx)
        res.render('login', { title: 'have to login' });
    else
        res.render('cash_board', { title: req.session.nickname });

});


router.post('/', function(req, res, next) {

    connection.query(util.format('CALL `capstone_27`.`reqDeposit`(\'%s\', \'%s\');', req.session.idx, req.body.dps), function(err, results, fields) {
        if (err) {
            console.log('deposit request failed');
        }
        else {
            console.log('sucess deposit request');
            res.render('cash_board')
        }
    });


});

module.exports = router;
