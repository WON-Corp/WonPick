<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	 /* 헤더 시작*/
        header {
            padding: 20px 0;
            display: flex;
            justify-content: center;
        }

        .stories {
            display: flex;
            gap: 15px;
            padding: 20px 0;
            padding-left: 30px;
        }

        .story {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 70px;
            text-align: center;
        }

        .story img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #356060;
            object-fit: cover;
        }

        .story span {
            margin-top: 5px;
            font-size: 12px;
            color: #333;
        }

        .feed {
            background-color: #fff;

            padding: 10px;
            margin-top: 20px;
            padding: 0 10%;
            display: flex;
            justify-content: center;
        }
        .stories a {
        	text-decoration:none;
        }
	</style>
</head>
<body>
 		<header id="headere">
            <!-- 프로필 스토리 섹션 -->
            <div class="stories">
                
            </div>
        </header>
        
        <script>
        	$(function() {
        		recentPostMember()
        	});
        	
        	function recentPostMember() {
        		$.ajax({
        		    url: "/wonpick/member/recentPost",
        		    type: 'post',
        		    success: function(result) {
        		    	$(".stories").text("");
        		        for(let r of result){
        		        	
        		        	$(".stories").append(
        		        			'<a class="story" href="/wonpick/myprofile/profileInfo?userId='+r.userId+'">'
        		                    	+ '<img src="'+r.pfImg+'" onerror="src='+"'/wonpick/resources/img/logo.jpg'"+'">'
        		                    	+ '<span>'+r.userId+'</span></a>'
        		        	);
        		        } 
        		    },
        		    error: function(err) {
        		        
        		            
        		    }
        		});
        	}
        	
        	
        	function goToProfile(userId) {
				// 상대방의 userId를  파라미터로 전달
                  window.location.href = '/wonpick/myprofile/profileInfo?userId=' + userId;
              }
        </script>
</body>
</html>