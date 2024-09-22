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
            overflow-x: auto;
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
            /* ToDo - 그라데이션 입혀서 새 스토리 확인 */
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
	</style>
</head>
<body>
 <header>
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
        		        			'<div class="story" onclick="goToProfile('+r.userId+')">'
        		                    	+ '<img src="'+r.pfImg+'" onerror="src='+"'/wonpick/resources/img/logo.jpg'"+'">'
        		                    	+ '<span>'+r.userId+'</span></div>'
        		        	);
        		        } 
        		    },
        		    error: function(err) {
        		        
        		            
        		    }
        		});
        	}
        	
        </script>
</body>
</html>