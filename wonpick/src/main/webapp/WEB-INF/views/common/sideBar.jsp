<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

/* 오른쪽 알림창 */
	.sidebar-alert {
		width: 300px;
		background-color: #fff;
		max-height: 220px;
		padding: 10px 15px;
		box-sizing: border-box;
		position: fixed;
		right: 0;
		/* Todo --수정 */
		top: 129px;
		bottom: 0;
		border-left: 1px solid #ddd;
		overflow-y: auto;
		border-bottom: 1px solid #ddd;
	}
	.sidebar-alert::-webkit-scrollbar {
		display:none;
	}
	.sidebar-alert h3 {
		margin-bottom: 15px;
		font-size: 16px;
		font-weight: bold;
		color: #333;
	}
	.notification-list {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
	
	
    .notification-item {
        background-color: #ffffff;
        padding: 15px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease, background-color 0.4s;
    }

    .notification-item:hover {
        background-color: #eeeeee;
    }

    .notification-item p {
        font-size: 0.7rem;
        margin: 0;
        color: #555;
    }

/* 오른쪽 WM창 */
.sidebar-message {
	width: 300px;
	background-color: #fff;
	height: 100%;
	padding: 10px 15px;
	box-sizing: border-box;
	position: fixed;
	right: 0;
	/* Todo --수정 */
	top: 350px;
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

.message-sent {
   margin: 10px 0;
   padding: 10px;
   border-radius: 20px;
   font-size: 10px;
   background-color: rgb(35, 59, 59);
   color: #fff;
   margin-left: auto;
   word-break:break-all;
}

.message-received {
   margin: 10px 0;
   padding: 10px;
   border-radius: 20px;
   font-size: 10px;
   background-color: #e0e0e0;
   color: #333;
   align-self: flex-start;
   text-align:center;
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
	.sent-userId{
		text-align:right;
		padding-top:5px;
		line-height: 0px;
		font-size: 12px;
	}
	.receive-userId{
		padding-top:5px;
		line-height: 0px;
		font-size: 12px;
	}
.sidebar-message::-webkit-scrollbar {
    display: none;
}
a {
	text-decoration: none;
	color:#000;
}
a:hover {
	text-decoration: none;
	color:#000;
}
/* 오른쪽 WM창 끝 */

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
					$(".sidebar-message").append("<p class='sent-userId'><a href='/wonpick/myprofile/profileInfo?userId=" + userId+"'>"+ userId +"</a></p><p><div class='message-sent'>" + msg + "</div></p>");
					if(time !== $("#sent-time").val()){
						$(".sidebar-message").append("<div class='time-sent'>" + time + "</div>");
						$("#sent-time").val(time);
					}
				} else {
					$(".sidebar-message").append("<p class='receive-userId'><a href='/wonpick/myprofile/profileInfo?userId=" + userId+"'>"+ userId +"</a></p><div class='message-received'>" + msg + "</div>");
					if(time !== $("#received-time").val()){
						$(".sidebar-message").append("<div class='time-received'>" + time + "</div>");
						$("#received-time").val(time);
					}
				}
			}
			let chatUl = document.querySelector('.sidebar-message');
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
	<!-- 내 프로필 -->
	<div class="myprofile"
		onclick="location.href='<%=request.getContextPath()%>/myprofile/profileInfo';"
		style="cursor: pointer;">
		<h4>내 프로필</h4>
		<div class="myprofile2">
			<img src="${ loginUser.pfImg }"
				onerror="src='/wonpick/resources/img/logo.jpg'"> <span
				class="myname">${ loginUser.nickName }</span>
		</div>
	</div>
	
	<div class="sidebar-alert"
		onclick="location.href='<%=request.getContextPath()%>/alert/notification';"
		style="cursor: pointer;">
		<h3>알림</h3>
		<div class="notification-list">
           
            
        </div>
    </div>


	<div class="sidebar-message"
		onclick="location.href='<%=request.getContextPath()%>/wonMessage/chat';"
		style="cursor: pointer;">
		<h3>메시지</h3>
		<div class="chat-list">
           
            
        </div>
    </div>
		<input type="hidden" id="chatUser" value="${loginUser.userId }">
		<input type="hidden" id="sent-time"> <input type="hidden" id="received-time">

<script>
	$(function() {
		getNoticeList('${ loginUser.userId }')
	})
	
	function getNoticeList(userId){
		$.ajax({
            url: "/wonpick/alert/alertList",
            type: 'post',
            data: { userId: userId },
            success: function(result) {
            	$(".notification-list").text("");
                for(let r of result){
                	
                	$(".notification-list").append(
                			'<div class="notification-item">'
                            +'<p>'+r.alertMessage+'</p></div>')
                }
            },
            error: function(err) {
  
            }
        });
	}
</script>

</body>
</html>