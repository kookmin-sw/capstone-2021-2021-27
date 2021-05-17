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

    connection.query(util.format('CALL `capstone_27`.`getKrwInfo`(\'%s\');', req.session.idx), function(err, results, fields) {
        if (err) {

            console.log('deposit request failed');
        }
        else {
            console.log('sucess deposit request');
            var total = results[1][0]['TotalKRW'];
            var withdraw = results[1][0]['Withdraw_KRW'];
            var worked = results[1][0]['Worked_KRW'];
            var available = results[1][0]['Available_KRW'];

            if(withdraw == '')
                withdraw = '0';
            if(worked =='')
                worked='0';


            res.render('cash_board', { title: 'total price', total: total, withdraw: withdraw, worked: worked, available: available });

        }
    });


});


router.post('/', function(req, res, next) {

    if(req.body.mode == 'deposit') {
        connection.query(util.format('CALL `capstone_27`.`reqDeposit`(\'%s\', \'%s\');', req.session.idx, req.body.param), function(err, results, fields) {
            if (err) {
                console.log('deposit request failed');
            }
            else {
                console.log('sucess deposit request');
                res.send(results[0][0]["result"]);
            }
        });

    }
    else {
        connection.query(util.format('CALL `capstone_27`.`reqWithdraw`(\'%s\', \'%s\');', req.session.idx, req.body.param), function(err, results, fields) {
            if (err) {
                console.log('withdraw request failed');
            }
            else {
                console.log(results);
                res.send(results[1][0]["result"]);

            }
        });
    }

});


module.exports = router;
