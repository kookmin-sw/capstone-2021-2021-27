var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var connection = mysql.createConnection({
    host     : 'localhost',
    port     : '3306',
    user     : 'capstone_27',
    password : 'zoqtmxhs27wh!',
    database : 'capstone_27'
});
connection.connect();

/* GET home page. */
router.get('/', function(req, res, next) {
    if(!req.session.idx)
        res.render('login');

    res.render('view_work');
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

router.get('/admit/:fidx', function(req, res, next) {
    if(!req.session.idx)
        res.render('login');

    connection.query(util.format('CALL `capstone_27`.`admitWork`(\'%s\');', req.params.fidx), function(err, results, fields) {
        if (err) {
            console.log('admit work error');
            res.send('error');
        }
        else {
            console.log('sucess admit work');
            res.redirect('/view_work');
        }
    });
});

module.exports = router;