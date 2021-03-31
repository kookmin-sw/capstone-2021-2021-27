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

        callback(null, fname);


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
    console.log(req.files);
    console.log(req.body);

    let result = {
        originalName : files[0].originalname,
        size : files[0].size,
        text : req.body.postText,
    }

    res.json(result);bnvcxzcdvbfjmyihtdfgcsxzc vbnm,kjhgfdvxcdsfszxasqdwgzszb ad vefvf




});


module.exports = router;
