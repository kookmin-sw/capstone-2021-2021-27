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
            console.log('get board_idx error');
        }
        else {
            console.log('sucess get board_idx');
            console.log(results);
            var title = results[0][0]['title'];
            var content = results[0][0]['content'];
            var price = results[0][0]['price'];
            var writer_idx = results[0][0]['writer_idx'];
            var quantity = results[0][0]['quantity'];
            var example_file_idx = results[0][0]['example_file_idx'];
            var total_price = results[0][0]['total_price'];
            var status = results[0][0]['status'];
            var date = results[0][0]['date'];

            res.render('view_board',{title : title, content : content, price:price, writer_idx:writer_idx, quantity: quantity, example_file_idx : example_file_idx, total_price:total_price, status:status, date:date});
        }
    });

});



module.exports = router;
