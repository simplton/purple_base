const express = require('express');
const app = express();
const server = require('http').createServer(app);
const io = require('socket.io').listen(server);
const request = require('request');

const port = process.env.PORT || '8080';

var allcities = {};


app.use(express.static(__dirname + '/'));

app.get('/', function (req, res) {
  res.sendfile('socketio.html');
});

app.get('/citidata', function (req, res) {
  res.send(allcities);
});

var requestIpLookup = 'http://ipinfo.io/'
io.on('connection', function (socket){

  setInterval(function(){
    io.emit('cityList', allcities);
  }, 1000);

  // io.emit('cityList', allcities);

  socket.on('mousePozi', function(actual){
    io.emit('mousePozi2', actual);
  });

  socket.on('disconnect', function(){
    console.log('user disconnected');
  });
});

server.listen(port, function () {
  console.log('Example app listening on port ' + port + '!');
});

exports.allcities = allcities;
