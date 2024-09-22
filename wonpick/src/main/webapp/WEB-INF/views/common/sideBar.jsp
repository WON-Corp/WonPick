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

        .myprofile h4{
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
	</style>
</head>
<body>
 <!-- 내 프로필 -->
    <div class="myprofile" 
      onclick="location.href='<%= request.getContextPath() %>/myprofile/profileInfo';" style="cursor: pointer;">
        <h4>내 프로필</h4>
        <div class="myprofile2">
        <img src="${ loginUser.pfImg }" onerror="src='/wonpick/resources/img/logo.jpg'">
        <span class="myname">${ loginUser.nickName }</span>
        </div>
    </div>



    <div class="sidebar-message" onclick="location.href='<%= request.getContextPath() %>/message/message';" style="cursor: pointer;">
        <h3>메시지</h3>
        <ul class="message-list">
            <li>
                <img src="/wonpick/resources/img/profile01.png" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">이지은</span>
                    <span class="message-text">얏호</span>
                    <span class="time">1분</span>
                </div>
            </li>
            <li>
                <img src="/wonpick/resources/img/profile02.jpg" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">유지민</span>
                    <span class="message-text">저녁 뭐먹지?</span>
                    <span class="time">20분</span>
                </div>
            </li>
            <li>
                <img src="/wonpick/resources/img/profile03.jpg" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">김민정</span>
                    <span class="message-text">3분 전에 활동</span>
                    <span class="time"></span>
                </div>
            </li>
            <!-- 메시지 목록 표시됨 -->

</body>
</html>