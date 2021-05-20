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
    if(!req.session.idx)
        res.render('login');
});

router.get('/api', function(req, res, next) {
    if(!req.session.idx)
        res.render('login');

    connection.query(util.format('CALL `capstone_27`.`getWorkInfo`(\'%s\');', req.session.idx), function(err, results, fields) {
        if (err) {
            console.log('get work_info error');
        }
        else {
            console.log('sucess get work_info');
            console.log(results);
            res.send(results[0]);


        }
    });
});

module.exports = router;
