<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	
	<input type="text" id="sender" size="10" placeholder="보내는 이름">
	<input type="text" id="receiver" size="10" placeholder="받는사람 이름">
	<input type="text" id="msg" placeholder="전송할 메세지 입력">
	<button onclick="sendMsg();">전송</button>
	
	<div id="msgContainer">
		
	</div>
	
	<script>
		// 웹소켓 서버에 연결하기
		// WebSocket 객체 생성하기 ip주소 = 192.168.30.190
		// const socket = new WebSocket("ws://ip:port/<%= request.getContextPath() %>/chatting.do")
		const socket = new WebSocket("ws://192.168.30.190:8082/<%= request.getContextPath() %>/chatting2.do");
		// https://ip:포트번호/~~
		// 로컬환경에서는 http사용
		// http -> ws:~
		// https -> wss:~
	
		// socket 설정하기
		// 1. 접속후 실행되는 이벤트 핸들러 등록
		socket.onopen = function(e){
			console.log("접속 성공");
			console.log(e);
		}
		
		//2. 웹소켓 서버에서 sendText, sendObject메소드를 실행하면 실행되는 함수
		socket.onmessage = function(e){
			console.log("메세지 수신");
			// 수신된 데이터를 받으려면 이벤트객체(e)의 data속성을 이용함
			console.log(e);
			console.log(e.data);
			// Object형태의 String데이터를 객체로 변환해주기(JSONObject)
			console.log(JSON.parse(e.data));
			
			let msg = JSON.parse(e.data);
			if(msg["sender"] == $("#sender").val()){
				$("#msgContainer").append( $("<p>").text("<"+msg["sender"]+">"+msg["msg"]  ).css("text-align", "left") );
			} else{
				$("#msgContainer").append( $("<p>").text("<"+msg["sender"]+">"+msg["msg"]  ).css("text-align", "right") );
			}
			
// 			let msg = e.data.split(",");
// 			if(msg[0] == $("#sender").val()){
// 				$("#msgContainer").append( $("<p>").text("<"+msg[0]+">"+msg[2]).css("text-align", "left") );
// 			}else{
// 				$("#msgContainer").append( $("<p>").text("<"+msg[1]+">"+msg[2]).css("text-align", "right") );
// 			}
		}
		
		// 3. 웹소켓 서버에서 메세지를 전송하는 함수
		const sendMsg = () => {
			// 함수임
			// 전송할 메세지 전처리 작업 수행
			// 전처리한 메세지를 전송하는 방법 : socket.send(데이터);
			// 발송자 , 수신자, 메세지 내용
// 			socket.send($("#sender").val()+","+ $("#receiver").val()+","+$("#msg").val() );
// 			let msg = {
// 					sender : $("#sender").val(),
// 					receiver : $("#receiver").val(),
// 					msg : $("#msg").val()
// // 					toString : function(){
// 						//좋은 방법은아님
// // 					}
// 					};
			let msg = new Message( $("#sender").val(), $("#receiver").val(), $("#msg").val() );
			
			// 객체를 제이슨 형태로 변경해줌. 문자열형태로 전송
			socket.send(JSON.stringify(msg)); // msg == msg.toString()
		};
		
		function Message(sender, receiver, msg){
			// this = {} 객체형태
			
			this.sender = sender;
			this.receiver = receiver;
			this.msg = msg;
		
			// return this => return 시키는 부분이 묵시적으로 실행
		}
	
	</script> 
</body>
</html>