<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>WonPick</title>

<style>

/* 헤더 시작*/
header {
   display: flex;
   border-radius: 15px;
   background-color: #f5f5f5;
}

/* 대화창 스타일 */
.feed {
   display: flex;
   flex-direction: column;
   justify-content: space-between;
   height: 90%;
}

.chat-header {
   display: flex;
   align-items: center;
   justify-content: flex-start;
   padding: 15px;
   background-color: #f5f5f5;
   width: 100%;
   max-width: 1150px;
   margin: 0 auto;
}

.container {
   display: flex;
   flex-direction: column;
   justify-content: space-between;
   height: 97%;
   background-color: #fff;
   border-radius: 10px;
   box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
   padding: 10px 30px;
   margin-bottom: 20px;
}

.chat-profile {
   width: 40px;
   height: 40px;
   border-radius: 50%;
   margin-right: 10px;
}

.chat-username {
   font-size: 16px;
   font-weight: 600;
}

/* 채팅 박스 스타일 */
.chat-box {
   flex: 1;
   height: 100%;
   display: flex;
   flex-direction: column;
   justify-content: flex-end;
   margin-top: 10px;
   transition: 0.4s;
   flex-direction:column_reverse;
}
.message-chat {
	padding-top:10px;
   overflow-y: auto;
}
.message-chat::-webkit-scrollbar {
    display: none;
}

.message-sent {
   max-width:60%;
   margin: 10px 0;
   padding: 10px;
   border-radius: 20px;
   font-size: 14px;
   background-color: rgb(35, 59, 59);
   color: #fff;
   margin-left: auto;
   word-break:break-all;
}

.message-received {
   max-width:60%;
   margin: 10px 0;
   padding: 10px;
   border-radius: 20px;
   font-size: 14px;
   background-color: #e0e0e0;
   color: #333;
   align-self: flex-start;
   text-align:right;
   word-break:break-all;
}

.time-sent{
	text-align:right;
	color:#aaa;
	font-size:xx-small;
	padding-right:10px;
	line-height: 0px;
	padding-bottom:10px;
}

.time-received{
	color:#aaa;
	font-size:xx-small;
	padding-left:10px;
	line-height: 0px;
	padding-bottom:10px;
}

.message {
   display: flex;
   padding: 10px;
   background-color: #fff;
   border-radius: 20px;
   width: 100%;
}

.message input {
   flex: 1;
   border-radius: 20px;
   border: 1px solid #ddd;
   outline: none;
   margin-right: 10px;
   padding: 10px;
}

.message button {
   padding: 10px 20px;
   border-radius: 20px;
   background-color: rgb(35, 59, 59);
   color: #fff;
   border: none;
   cursor: pointer;
}

@media all and (max-width: 1100px) {
   .content {
      margin-right: 50px;
   }
   .message {
      width: calc(100% - 20px);
   }
}

/* my profile 창 */
.myprofile {
   width: 300px;
   height: 129px;
   box-sizing: border-box;
   position: fixed;
   right: 0;
   top: 0;
   border-left: 1px solid #ddd;
   border-bottom: 1px solid #ddd;
   overflow: hidden;
}

.myprofile h4 {
   margin-top: 10px;
   margin-left: 10px;
   margin-bottom: 5px;
}

.myprofile img {
   width: 60px;
   height: 60px;
   border-radius: 50%;
   background-color: #ddd;
   margin: 10px 15px;
   object-fit: cover;
}

.myprofile .myname {
   position: absolute;
   top: 65px;
}

.logout {
   cursor: pointer;
   font-size: x-small;
   color: #aaa;
   margin-top: 0px;
}

/* my profile 창 끝 */

/* 오른쪽 WM창 */
.sidebar-message {
   width: 300px;
   background-color: #fff;
   max-height: 1000px;
   padding: 10px 15px;
   box-sizing: border-box;
   position: fixed;
   right: 0;
   /* Todo --수정 */
   top: 130px;
   bottom: 0;
   border-left: 1px solid #ddd;
   overflow-y: auto;
}

.sidebar-message h3 {
   margin-bottom: 15px;
   font-size: 16px;
   font-weight: bold;
   color: #333;
}

.message-list {
   list-style: none;
   padding: 0;
   margin: 0;
}

.message-list li {
   display: flex;
   align-items: center;
   padding: 8px 5px;
   border-bottom: 1px solid #ddd;
   cursor: pointer;
}

.message-list li:hover {
   background-color: #f0f0f0;
   transition: 0.4s ease-in-out;
}

.message-list img {
   width: 50px;
   height: 50px;
   border-radius: 50%;
   margin-right: 10px;
   object-fit: cover;
}

.message-list .message-info {
   display: flex;
   flex-direction: column;
   justify-content: center;
}

.message-list .message-info .name {
   font-weight: bold;
   color: #333;
}

.message-list .message-info .message-text {
   font-size: 14px;
   color: #888;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}

.message-list .message-info .time {
   font-size: 11px;
   color: #aaa;
   margin-top: 2px;
}

/* 오른쪽 WM창 끝 */

/* 더보기 팝업 메뉴 */



@media all and (min-width:0px) and (max-width:1100px) {
   .sidebar-message {
      display: none;
   }
   .myprofile {
      display: none;
   }
   .content {
      margin-right: 50px;
   }
   .chat-header {
      width: 100%;
   }
}

	.sent-userId{
		text-align:right;
		padding-top:5px;
		line-height: 0px;
	}
	.receive-userId{
		padding-top:5px;
		line-height: 0px;
	}
	
	a {
	text-decoration: none;
	color:#000;
	}
	a:hover {
	text-decoration: none;
	color:#000;
	}
</style>
</head>
<script>
	var ws;

	window.onload = function() {
		ws = new WebSocket("ws://" + location.host + "<%= request.getContextPath() %>/chating");
		wsOpen();
	}
	
	function wsOpen(){
		wsEvt();
	}
		
	function wsEvt() {
		
		ws.onmessage = function(data) {
			var list = data.data;
			var userId = list.substring(0, list.indexOf(','));
			var msg = list.substring(list.indexOf(',')+1, list.lastIndexOf(','));
			var time = list.substring(list.lastIndexOf(',')+1);
			if(msg != null && msg.trim() != ''){
				if(userId === $("#chatUser").val()){
					$(".message-chat").append("<div class='sent-userId'><a href='/wonpick/myprofile/profileInfo?userId=" + userId+"'>"+ userId +"</a></div><div class='message-sent'>" + msg + "</div>");
					if(time !== $("#sent-time").val()){
						$(".message-chat").append("<div class='time-sent'>" + time + "</div>");
						$("#sent-time").val(time);
					}
				} else {
					$(".message-chat").append("<p class='receive-userId'><a href='/wonpick/myprofile/profileInfo?userId=" + userId+"'>"+ userId +"</a></p><div class='message-received'>" + msg + "</div>");
					if(time !== $("#received-time").val()){
						$(".message-chat").append("<div class='time-received'>" + time + "</div>");
						$("#received-time").val(time);
					}
				}
			}
			let chatUl = document.querySelector('.message-chat');
			chatUl.scrollTop = chatUl.scrollHeight;
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function send() {
		var msg = $("#chatting").val();
		var userId = $("#chatUser").val();
		var today = new Date();
		var hours = ('0' + today.getHours()).slice(-2); 
		var minutes = ('0' + today.getMinutes()).slice(-2);
		var time = hours + ':' + minutes;
		
		
		ws.send([userId, msg, time]);

		$('#chatting').val("");
	}
</script>

<body>

   <%@ include file="../common/menuBar.jsp" %>


   <div class="content">
      <header class="chat-header">
         <img src="${message.pfImg}" onerror="this.src='<%=request.getContextPath()%>/resources/img/logo.jpg'"
            class="chat-profile"> <span class="chat-username">WONCHAT</span>
      </header>

      <div class="feed">
         <div class="container">
            <!-- 대화 내용 영역 -->
            <div class="chat-box">
               <!-- 대화 내용 -->
               <div class="message-chat">
                  
                  
               </div>

               <!-- 메시지 입력 창 -->
               <div class="message">
                  <input id="chatting" placeholder="메시지를 입력하세요..." />
                  <button onclick="send()" id="sendBtn">보내기</button>
                  <input type="hidden" id="chatUser" value="${loginUser.userId }">
               </div>
            </div>
         </div>
      </div>
   </div>
   <input type="hidden" id="sent-time">
   <input type="hidden" id="received-time">

</body>

</html>