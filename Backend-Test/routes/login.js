var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'capstone_27',
    password : 'capstone_27',
    database : 'capstone_27'
});
connection.connect();

/* GET home page. */
router.get('/', function(req, res, next) {

    if(!req.session.nickname)
        res.render('login', { title: 'Hi!' });
    else
        res.render('index_logined', { nickname: req.session.nickname });

});

router.post('/', function(req, res, next) {

    connection.query('CALL `login`(\''+req.body.id+'\', \''+req.body.password+'\')', function(err, results, fields) {
        if (err) {
            console.log('login failed');
            res.render('login', { title: 'Hi!' });
        }
        else {
            console.log(results);

            //length == 0 -> fale
            if(results[0].length == 1) {
                var nickname = results[0][0]['nickname'];
                console.log('login success');
                req.session.nickname = nickname;
                req.session.save();
                res.render('index_logined', { nickname: nickname });
            }
            else {
                res.render('login', { title: 'Hi!' });
            }

        }
    });


});

module.exports = router;
