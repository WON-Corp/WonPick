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
    body {
        font-family: 'Poppins', sans-serif;
        background: #ffffff;
        color: #333;
        margin: 0;
        padding: 0;
    }

    .notification-page {
        text-align: left;
        padding: 20px;
        max-width: 700px;
        margin: 20px auto;
    }

    .notification-page h1 {
        font-size: 1.5rem;
        margin-bottom: 20px;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
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
        font-size: 0.9rem;
        margin: 0;
        color: #555;
    }

    @media (max-width: 780px) {
        .notification-page {
            padding: 15px;
        }

        .notification-item {
            padding: 10px;
        }

        .notification-item p {
            font-size: 0.8rem;
        }
    }
</style>

</head>
<body>

<%@ include file="../common/menuBar.jsp" %>
<div class="content">
    <div class="notification-page">
        <h1>새로운 알림</h1>
        <div class="notification-list">
           
            
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
