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
    res.render('join',{title: 'express'});
});

router.post('/', function(req, res, next) {

    connection.query(util.format('CALL `capstone_27`.`join`(\'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\');', req.body.id, req.body.password, req.body.name, req.body.nickname, req.body.phone, req.body.email, req.body.bank, req.body.bank_num), function(err, results, fields) {
        if (err) {
            console.log('join failed');
        }
        else {
            console.log(results);
            if(results[0][0].result == 'success') {
                console.log('join success');
                res.render('login', { msg: '' });
            }
            else {
                res.render('join', { msg: '회원가입에 실패하였습니다. 회원가입을 진행하여 주십시오.' });
            }

        }
    });


});


module.exports = router;
