var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var util = require('util');
var fs = require('fs');
var mime = require('mime');
var path = require('path');

var connection = mysql.createConnection({
    host     : 'capstone.louissoft.kr',
    port     : '26773',
    user     : 'capstone_27',
    password : 'zoqtmxhs27wh!',
    database : 'capstone_27'
});
connection.connect();

/* GET home page. */
router.get('/:fidx', function(req, res, next) {

    connection.query(util.format('CALL `capstone_27`.`getFileInfo`(\'%s\');', req.params.fidx), function(err, results, fields) {
        if (err) {
            console.log('error');

        }
        else {
            if(results[0].length == 0) {
                res.send('no file');
            }
            else {

                var list = results[0][0]['show_idx'];
                list = list.split(';');
                var find = false;
                for(var i = 0; i < list.length; i++) {
                    if(list[i] == req.session.idx) {
                        find = true;
                        break;
                    }
                }

                if (find) { // 파일이 존재하는지 그리고 권한이 있는지 체크
                    var filename = results[0][0]['url']; // 파일 경로에서 파일명(확장자포함)만 추출
                    filename = filename.split('.')[0] + '.txt';
                    var mimetype = 'text/plain' // 파일의 타입(형식)을 가져옴

                    res.setHeader('Content-disposition', 'attachment; filename=' + filename); // 다운받아질 파일명 설정
                    res.setHeader('Content-type', mimetype); // 파일 형식 지정

                    var resultStr = results[0][0]['label_x'] + ',' + results[0][0]['label_y'] + ',' + results[0][0]['label_width'] + ',' + results[0][0]['label_height'];
                    res.send(resultStr);
                } else {
                    res.send('해당 파일이 없거나 권한이 없습니다.');
                    return;
                }


            }

        }
    });

});


module.exports = router;
