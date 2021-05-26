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

router.get('/api/:text', function(req, res, next) {
    if(req.params.text == 'all') {
        connection.query('CALL `getBoardList`()', function(err, results, fields) {
            if (err) {

            }
            else {
                res.json(results[0]);
            }
        });
        return;
    }
    connection.query('CALL `search`(\''+req.params.text+'\')', function(err, results, fields) {
        if (err) {

        }
        else {
           res.json(results[0]);
        }
    });
});

router.get('/', function(req, res, next) {
    if(!req.session.idx) {
        res.render('search_board_guest');
        return;
    }
    res.render('search_board');
});

module.exports = router;
