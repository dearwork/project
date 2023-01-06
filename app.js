const express = require('express') //설치한 express 모듈 불러오기
const socket = require ('socket.io')
const http = require('http')
const app = express()
const server = http.createServer(app)
const io = socket(server)

app.get('/', function(request, response) {
	console.log("유저가 / 으로 접속하였습니다.")
	response.send("Hello, Express Server!!")
})
server.listen(8080, function() {
	console.log("서버 실행 중...");
})
