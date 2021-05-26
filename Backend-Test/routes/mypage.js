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
        res.render('mypage');

});

module.exports = router;
