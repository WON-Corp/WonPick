<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>WonPick</title>
    <style>
    .post {
            background-color: #fff;
            padding: 20px 100px;
            margin-bottom: 15px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            max-width: 750px;
        }

        .post-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .post-profile-img {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            object-fit: cover;
        }

        .post-info h3 {
            margin: 0;

            font-size: 14px;
            font-weight: bold;

        }

        .post-time {
            font-size: 12px;

            color: #888;
        }

        .post-options {
            font-size: 20px;

            cursor: pointer;
        }

        .post-image {
            width: 100%;
            margin-top: 15px;
            border-radius: 10px;
        }

        .post-content {
            margin-top: 10px;

        }

        .post-actions ion-icon {
            font-size: 20px;

            margin-right: 10px;
            cursor: pointer;
        }
        
         .heart {
            width:21px;
            height:22px;
            margin-right: 10px;
            cursor: pointer;
            margin-bottom:11px;
        }
        

        .view-comments {
            color: #888;

            font-size: 12px;
            cursor: pointer;
        }
    
    </style>
</head>

<body>

    
		<c:if test="${ empty list }">
		<script>
			location.href = "errorPost/selectErrorList";
		</script>
		</c:if>
			

	<%@ include file="common/menuBar.jsp" %>
    
    
    <div class="content">

    <%@ include file="common/storybar.jsp" %>

        <!-- 게시물 -->
        <c:forEach var="list" items="${ list }">
                <div class="feed">
                    <div class="post">
                        <div class="post-header">
                            <div class="post-info">
                            	<br>
                                <h3>${ list.userId }</h3>
                                <span class="post-time">${ list.postingTime }</span>
                            </div>
                            <img src="${ list.userPfImg }" onerror="src='resources/img/logo.jpg'" class="post-profile-img">
                        </div>
                        <c:if test="${ not empty list.imgFile }">
                        	<c:if test="${ not fn:contains( list.imgFile, '.mp4') && not fn:contains( list.imgFile, '.avi')}">
                        		<img src="${ list.imgFile }" alt="게시물 이미지" class="post-image">
                        	</c:if>
                        	<c:if test="${ fn:contains( list.imgFile, '.mp4') || fn:contains( list.imgFile, '.avi')}">
                        		<video src="${ list.imgFile }" class="post-image" controls autoplay loop></video>
                        	</c:if>
                        </c:if>
                        <img src="resources/img/sizing_space.jpg" alt="공백" class="post-image">
                        <div class="post-content">
                            <p><strong>${ list.postTitle }</strong></p>
                        </div>
                        <div class="post-comments">
                            <p>&nbsp; ${ list.postContent }</p>
                            <div class="post-actions">
                                <img src="resources/img/logo.jpg" alt="WonPick 로고" class="heart">
                                <ion-icon name="chatbubble-outline"></ion-icon>
                                <ion-icon name="bookmark-outline"></ion-icon>
                            </div>
                            <p class="view-comments">댓글모두 보기</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        <!-- 추가할 게시물 작성 가능합니당 -->
    </div>
  	
		<%@ include file="common/sideBar.jsp" %>
   	
    </div>
    
    <% session.removeAttribute("list"); %>
</body>

</html>