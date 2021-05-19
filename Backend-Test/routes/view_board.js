var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var bodyParser = require('body-parser');
const multer = require("multer");
const path = require("path");
var uuid = require("uuid");

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
            var showReply = 'false';

            if(req.session.idx == writer_idx)
                showReply = 'true';
            var myNickname = req.session.nickname;


            res.render('view_board',{myNickname: myNickname, showReply: showReply, title : title, content : content, price:price, writer_idx:writer_idx, quantity: quantity, file_idx:split_example_file_idx, total_price:total_price, status:status, date:date});
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

router.get('/api/detail/:bidx', function(req, res, next) {
    console.log('api');
    connection.query(util.format('CALL `capstone_27`.`getBoardInfo`(\'%s\');', req.params.bidx), function(err, results, fields) {
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

router.post('/reply', function(req, res, next) {
    var replyMsg = req.body.reply_text;
    var qa_idx = req.body.qa_idx;

    connection.query(util.format('CALL `capstone_27`.`writeAnswer`(\'%s\',\'%s\');',  qa_idx, replyMsg), function(err, results, fields) {
        if (err) {
            console.log('write answer request failed');
            res.send('error');
        }
        else {
            console.log('success write answer request');
            res.redirect(req.get('referer'));
        }
    });

});

let storage = multer.diskStorage({
    destination: function(req, file ,callback){
        callback(null, "uploads/")
    },
    filename: function(req, file, callback){
        console.log('save file start');
        let extension = path.extname(file.originalname);
        let basename = path.basename(file.originalname, extension);
        var fname = uuid.v4() + extension;
        var index = req.files.length - 1;

        var x = req.body.x;
        var y = req.body.y;
        var width = req.body.width;
        var height = req.body.height;

        var work_board_idx = req.body.work_board_idx;
        var uploader_idx = req.session.idx;

        if(!req.body.fileidx)
            req.body.fileidx = '';

        // show all 0으로 설정, board_idx 기반으로 게시물 작성자에게만 보여줄 수 있도록.
        connection.query(util.format('CALL `capstone_27`.`workUpload`(\'img\',\'%s\',  \'%s\', \'%s\', \'%s\', \'%s\', \'%s\');',fname, width, height, x, y, work_board_idx), function(err, results, fields) {
            if (err) {
                console.log('error');
                callback(null, fname);
            }
            else {
                console.log('my file is ' + results[0][0]["file_idx"]);
                req.body.fileidx += results[0][0]["file_idx"] + ';';
                callback(null, fname);
            }
        });
    }
});
let upload = multer({
    storage: storage
});

router.post('/upload', upload.array('imgFile', 1), function(req, res, next) {
    console.log('upload main post function');
    console.log('my upload file is ' + req.body.fileidx);
    res.send('finish');
});


module.exports = router;