var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'capstone_27',
    password : 'capstone_27',
    database : 'capstone_27'
});
connection.connect();

/* GET home page. */
router.get('/', function(req, res, next) {
    if(!req.session.idx)
        res.render('join', { title: 'guest!' });
    else
        res.render('index_logined', { title: req.session.nickname });

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
                res.render('login', { title: 'Hi!' });
            }
            else {
                console.log('join failed');
                res.render('join', { title: 'Hi!' });
            }

        }
    });


});


module.exports = router;
