var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var connection = mysql.createConnection({
    host     : 'capstone.louissoft.kr',
    port     : '26773',
    user     : 'capstone_27',
    password : 'zoqtmxhs27wh!',
    database : 'capstone_27'
});
connection.connect();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render(`manager`);
    rds.send()
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


router.post('/', function(req, res, next) {

    connection.query(util.format('CALL `capstone_27`.`reqWithdraw`(\'%s\', \'%s\');', req.session.idx, req.body.wd), function(err, results, fields) {
        if (err) {
            console.log('withdraw request failed');
        }
        else {
            console.log(results);

        }
    });
});

module.exports = router;
