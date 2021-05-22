var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
const multer = require("multer");
const path = require("path");
var uuid = require("uuid");

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

module.exports = router;
