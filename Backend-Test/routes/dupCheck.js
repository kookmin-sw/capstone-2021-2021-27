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

// 아이디, 이메일, 닉네임 중복을 확인해주는 API
router.post('/', function(req, res, next) {
    // made by jiho park
    if(req.body.mode == 'id')
    {
        connection.query(util.format('CALL `isDuplicateID`(\'%s\')', req.body.param), function(err, results, fields) {
            if (err) {
                console.log('error db');
                res.render('join');
            }
            else {
                if(results[0][0].result == 'success') {
                    res.send(results[0][0]);
                }
                else {
                    res.send(results[0][0]);
                }
            }
        });
    }
    // made by jihyeon jung
    else if(req.body.mode == 'email')
    {
        connection.query(util.format('CALL `isDuplicateEmail`(\'%s\')', req.body.param), function(err, results, fields) {
            if (err) {
                console.log('error db');
                res.render('join');
            }
            else {
                if(results[0][0].result == 'success') {
                    res.send(results[0][0]);
                }
                else {
                    res.send(results[0][0]);
                }
            }
        });
    }
    // made by jiho park
    else if(req.body.mode == 'nickname')
    {
        connection.query(util.format('CALL `isDuplicateNickname`(\'%s\')', req.body.param), function(err, results, fields) {
            if (err) {
                console.log('error db');
                res.render('join');
            }
            else {
                if(results[0][0].result == 'success') {
                    res.send(results[0][0]);
                }
                else {
                    res.send(results[0][0]);
                }
            }
        });
    }
    else {
        console.log(req.body);
        res.status(400).end();
    }
});

module.exports = router;
