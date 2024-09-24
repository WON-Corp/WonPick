<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 관리</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }
        
        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
        }
        
        th, td {
            padding: 12px;
            text-align: center;
            text-overflow: ellipsis;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .action-btn {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        .delete-btn {
            background-color: #f44336;
        }
        
        .action-btn:hover {
            opacity: 0.8;
        }
        
         /* 특정 열에 비율 설정 */
        th:nth-child(1), td:nth-child(1) {
            width: 10%;
        }

        th:nth-child(2), td:nth-child(2) {
            width: 60%;
        }

        th:nth-child(3), td:nth-child(3) {
            width: 15%;
        }

        th:nth-child(4), td:nth-child(4) {
            width: 15%;
        }

        input[type="text"] {
            width: 95%;
            padding: 5px;
            font-size: 14px;
        }
        
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../common/adminSideBar.jsp" %>

<div class="content">
    <h1>게시글 관리</h1>
    <table id="postTable">
        <thead>
            <tr>
                <th>게시글 번호</th>
                <th>내용</th>
                <th>글쓴이 ID</th>
                <th>관리 기능</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="post" items="${postList}">
                <tr id="row-${post.postId}">
                    <td>${post.postId}</td>
                    <td id="content-${post.postId}">${post.postContent}</td>
                    <td>${post.userId}</td>
                    <td>
                        <button class="action-btn" onclick="editPost('${post.postId}')">수정</button>
                        <button class="action-btn save-btn" id="save-${post.postId}" style="display:none;" onclick="savePost('${post.postId}')">저장</button>
                        <button class="action-btn delete-btn" onclick="confirmDelete('${post.postId}','${post.userId }')">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
    function editPost(postId) {
        let contentField = $("#content-" + postId);
        contentField.html('<input type="text" value="' + contentField.text() + '" />');
        $("#save-" + postId).show();
    }

    function savePost(postId) {
        let postData = {
            postId: postId,
            postContent: $("#content-" + postId + " input").val(), // 입력된 내용 값 가져오기
        };

        $.ajax({
            url: "/wonpick/admin/updatePost",
            type: "POST",
            data: JSON.stringify(postData),
            contentType: "application/json",
            success: function(response) {
                alert("게시글이 수정되었습니다.");
                $("#content-" + postId).html(postData.postContent); // 수정된 내용 업데이트
                $("#save-" + postId).hide();
            },
            error: function(err) {
                console.log(err);
                alert("게시글 수정에 실패했습니다.");
            }
        });
    }

    function confirmDelete(postId,userId) {
        if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
            postDelete(postId,userId);
        }
    }
    function postDelete(postId,userId){
    	$.ajax({
			url : "/wonpick/post/deletePost",
			type : 'post',
			data : {userId : userId , postId : postId},
			success : function (result){
				if(result == 0){
					alert("게시물을 삭제했습니다.")
					location.href = "/wonpick/admin/managePosts"
				}else{
					alert("게시물 삭제에 실패했습니다.")
				}
			},
			error : function (err){
				consol.log(err)
			}
		});
    }
</script>

</body>
</html>
