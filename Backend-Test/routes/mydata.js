var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
const multer = require("multer");
const path = require("path");
var uuid = require("uuid");

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
    else
        res.render('mydata');

});

router.get('/my_board', function(req, res, next) {
    if(!req.session.idx)
        res.send('need login');
    else {
        connection.query('SELECT * FROM work_board WHERE writer_idx=' + req.session.idx, function(err, results, fields) {
            if (err) {

            }
            else {
                res.json(results);
            }
        });
        return;
    }

});

router.get('/download_data', function(req, res, next) {
    if(!req.session.idx)
        res.send('need login');
    else {
        connection.query('SELECT * FROM work_board WHERE writer_idx=' + req.session.idx, function(err, results, fields) {
            if (err) {

            }
            else {
                res.render('get_download');
            }
        });
        return;
    }
});

router.get('/download_data/:idx', function(req, res, next) {
    if(!req.session.idx)
        res.send('need login');
    else {
        var tmp = parseInt(req.params.idx);
        connection.query('CALL `getData`(\''+req.params.idx+'\')', function(err, results, fields)  {
            if (err) {

            }
            else {
                res.json(results[0]);
            }
        });
        return;
    }
});

module.exports = router;
