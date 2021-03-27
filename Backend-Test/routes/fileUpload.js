var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
const multer = require("multer");
const path = require("path");

let storage = multer.diskStorage({
    destination: function(req, file ,callback){
        callback(null, "uploads/")
    },
    filename: function(req, file, callback){
        let extension = path.extname(file.originalname);
        let basename = path.basename(file.originalname, extension);
        callback(null, basename + "-" + Date.now() + extension);
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
    res.render('fileUpload');
});


router.post('/', upload.array('imgFile', 5), function(req, res, next) {
    let files = req.files
    console.log(req.files);


    let result = {
        originalName : files[0].originalname,
        size : files[0].size,
        text : req.body.postText,
    }

    res.json(result);




});


module.exports = router;
