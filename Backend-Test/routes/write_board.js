var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
const multer = require("multer");
const path = require("path");
var uuid = require("uuid");

let storage = multer.diskStorage({
    destination: function(req, file ,callback){
        callback(null, "uploads/")
    },
    filename: function(req, file, callback){
        let extension = path.extname(file.originalname);
        let basename = path.basename(file.originalname, extension);
        var fname = uuid.v4() + extension;
        var index = req.files.length - 1;
        var labelData = JSON.parse(req.body.labelData);
        var nowData = labelData[index];

        var x = nowData['x'];
        var y = nowData['y'];
        var width = nowData['width'];
        var height = nowData['height'];

        if(!req.body.labelIdx)
            req.body.labelIdx = '';

        connection.query(util.format('CALL `capstone_27`.`fileUpload`(\'img\',\'%s\',  \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\');',fname, width, height, x, y, 1, req.session.idx +';'), function(err, results, fields) {
            if (err) {
                console.log('error');
                callback(null, fname);
            }
            else {
                req.body.labelIdx += (results[0][0]["file_idx"]) + ';';
                callback(null, fname);
            }
        });


    }
});
let upload = multer({
    storage: storage
});


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
    else
        res.render('write_board');

});

router.post('/', upload.array('imgFile', 5), function(req, res, next) {
    let files = req.files

    console.log(util.format('CALL `capstone_27`.`writeBoard`(\'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\');',req.body.title, req.session.idx, req.body.price, req.body.content, req.body.quantity, 'img', req.body.labelIdx));

    connection.query(util.format('CALL `capstone_27`.`writeBoard`(\'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\');',req.body.title, req.session.idx, req.body.price, req.body.content, req.body.quantity, 'img', req.body.labelIdx), function(err, results, fields) {
        if (err) {
            console.log('error');
        }
        else {
            res.send('finish');
        }
    });






});

module.exports = router;
