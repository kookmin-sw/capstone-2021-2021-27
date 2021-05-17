var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var bodyParser = require('body-parser');

var connection = mysql.createConnection({
    host     : 'capstone.louissoft.kr',
    port     : '26773',
    user     : 'capstone_27',
    password : 'zoqtmxhs27wh!',
    database : 'capstone_27'
});
connection.connect();

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('manager');
});

// Get list
router.post('/', function(req, res, next) {

    connection.query('CALL `capstone_27`.`cashReqList`();', function(err, results, fields) {
        if (err) {
            console.log('deposit request failed');
        }
        else {
            var resultmsg = JSON.stringify(results[0]);
            res.send(resultmsg);
        }
    });
});

// confirm
router.post('/confirm', function(req, res) {
    // idx, type - Withdraw, Deposit
    // if
    console.log('confirm');
    var type = req.body.type;
    var check_idx = req.body.idx;
    console.log(type);
    console.log(check_idx);
    req.session.check_idx = check_idx;
    if(type == 0){
        connection.query(util.format('CALL `capstone_27`.`resDeposit`(\'%s\');',req.session.check_idx), function(err, results, fields) {
            if (err) {
                console.log('deposit response failed');
            }
            else {
                console.log(results);
                res.send(results[0][0]['result']);
            }
        });
    }
    else if (type == 1){
        connection.query(util.format('CALL `capstone_27`.`resWithdraw`(\'%s\');',req.session.check_idx), function(err, results, fields) {
            if (err) {
                console.log('withdraw response failed');
            }
            else {
                console.log(results);
                res.send(results[0][0]['result']);
            }
        });
    }
    else {
        console.log('exception');
    }

});

module.exports = router;
