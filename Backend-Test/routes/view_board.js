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


/* GET home page. */
router.get('/', function(req, res, next) {
    connection.query(util.format('CALL `capstone_27`.`getBoardInfo`(\'%s\');', req.query.board_idx), function(err, results, fields) {
        if (err) {
            console.log('get board_info error');
        }
        else {
            console.log('sucess get board_info');
            console.log(results);
            var title = results[0][0]['title'];
            var content = results[0][0]['content'];
            var price = results[0][0]['price'];
            var writer_idx = results[0][0]['writer_idx'];
            var quantity = results[0][0]['quantity'];
            var param_example_file_idx = results[0][0]['example_file_idx'];
            var total_price = results[0][0]['total_price'];
            var status = results[0][0]['status'];
            var date = results[0][0]['date'];
            var split_example_file_idx = param_example_file_idx.split(';');

            res.render('view_board',{ title : title, content : content, price:price, writer_idx:writer_idx, quantity: quantity, file_idx:split_example_file_idx, total_price:total_price, status:status, date:date});
        }
    });
});

router.get('/api/:bidx', function(req, res, next) {
    console.log('api');
    connection.query('CALL `getQABoard`(\''+req.params.bidx+'\')', function(err, results, fields) {
        if (err) {

        }
        else {
            res.json(results[0]);
        }
    });
});

router.post('/', function(req, res, next) {
    connection.query(util.format('CALL `capstone_27`.`writeQuestion`(\'%s\',\'%s\',\'%s\');',  req.query.board_idx, req.body.qa_text, req.session.idx), function(err, results, fields) {
        if (err) {
            console.log('write question request failed');
            res.send('error');
        }
        else {
            console.log('sucess write question request');
            res.redirect('/view_board/?board_idx=' + req.query.board_idx);
        }
    });

});



module.exports = router;
