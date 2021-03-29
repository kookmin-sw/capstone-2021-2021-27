var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session')
var MySQLStore = require('express-mysql-session')(session);

var options = {
  host: 'capstone.louissoft.kr',
  port: 26773,
  user: 'capstone_27',
  password: 'zoqtmxhs27wh!',
  database: 'capstone_27'
};

var sessionStore = new MySQLStore(options);

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  store: sessionStore
}))
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', require('./routes/index'));
app.use('/login', require('./routes/login'));
app.use('/join', require('./routes/join'));
app.use('/dupCheck', require('./routes/dupCheck'));
app.use('/cash_board', require('./routes/cash_board'));
app.use('/manager', require('./routes/manager'));
app.use('/fileUpload', require('./routes/fileUpload'));
app.use('/logout', require('./routes/logout'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
