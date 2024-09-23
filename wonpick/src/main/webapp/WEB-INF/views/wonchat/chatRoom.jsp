<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Wonpick</title>

<!-- Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
	#headere {
		display: flex;
		justify-content: flex-end;
	}
    body {
        font-family: 'Poppins', sans-serif;
        background: #ffffff;
        color: #333;
        margin: 0;
        padding: 0;
    }
    .stories {
    	flex-direction: column;
    	position: fixed;
    	right: 0;
    	margin-right: 8%;
    }


    .chat-page {
        text-align: left;
        padding: 20px;
        min-width: 700px;
        margin: 20px auto;
    }

    .chat-page h1 {
        font-size: 1.5rem;
        margin-bottom: 20px;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
    }

    .chat-list {
        gap: 10px;
    }

    .chat-item {
        background-color: #ffffff;
        padding: 15px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease, background-color 0.4s;
        display: flex;
        flex-direction: row;
        align-items:center;
    }

    .chat-item:hover {
        background-color: #eeeeee;
    }

    .chat-item p {
        font-size: 0.9rem;
        margin: 0;
        color: #555;
    }

    @media all and (min-width:0px) and (max-width:1100px) {
    	.stories {
        	display: none;
        }
        .chat-page {
            padding: 15px;
        }

        .chat-item {
            padding: 10px;
            display:flex;
            flex-direction: row;
            justify-content: space-around;
        }

        .chat-item p {
            font-size: 0.8rem;
        }
    }
    .chat-item img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #356060;
            /* ToDo - 그라데이션 입혀서 새 스토리 확인 */
            object-fit: cover;
        }
     .chatting-detail{
     	margin-left: 20px;
     	width:100%;
     }
     
     #userId {
     	font-size: large;
     	padding: 5px;
     }
     
     .chatting-time{
     	font-size: small;
     	color:#aaa;
     	text-align:right;
     }
     
</style>

</head>
<body>

<%@ include file="../common/menuBar.jsp" %>
<div class="content">
<%@ include file="../common/storyBar.jsp" %>
    <div class="chat-page">
        <h1>채팅방</h1>
        <div class="chat-list">
           <div class="chat-item">
           		<img alt="" src="/wonpick/resources/img/logo.jpg">
           		<div class="chatting-detail"><p id="userId">test1</p><p>야 뭐하냐ㅋㅋㅋㅋㅋ</p></div>
           		<div class="chatting-time">10:11</div>
           </div>
            
        </div>
    </div>
</div>

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
            	console.log(result)
            	//$(".chat-list").text("");
                for(let r of result){
                	
                	//$(".chat-list").append(
                		//	'<div class="chat-item">'
                           // +'<p>'+r.alertMessage+'</p></div>')
                }
            },
            error: function(err) {
  
            }
        });
	}
</script>
</body>

</html>
