<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .upload-container {
            width: 700px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .upload-header {
            background-color: #f8f8f8;
            padding: 10px 15px;
            font-weight: bold;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .upload-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .image-preview {
            width: 100%;
            height: 400px;
            background-color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            position: relative;
            cursor: pointer;
            overflow: hidden;
            border-radius: 10px;
        }

        .image-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        .image-preview input[type="file"] {
            display: none;
        }

        .image-preview.dragover {
            background-color: #444;
        }

        .caption-input {
            width: 100%;
            height: 100px;
            border: none;
            resize: none;
            outline: none;
            font-size: 16px;
            margin: 20px 0;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }

        .upload-footer {
            padding: 10px;
            text-align: right;
        }

        .upload-footer button {
            background-color: #888888;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
        #deleteImg{
            background-color: rgb(35, 59, 59);
        }
    </style>
</head>
<body>
    <div class="upload-container">
        <div class="upload-header">
            새 게시물 만들기
        </div>
        <form id="upload-form" class="upload-content" action="/upload" method="POST">
            <div class="image-preview" id="image-preview" onclick="document.getElementById('file-input').click()">
                <span>사진과 동영상을 여기에 끌어다 놓으세요...</span>
                <input type="file" id="file-input" name="image" accept="image/*">
                <img id="preview-img" src="#" alt="Image Preview" style="display: none;">
            </div>
            <textarea class="caption-input" name="caption" placeholder="문구 입력..."></textarea>
            <div class="upload-footer">
                <button type="button" id="deleteImg" onclick="document.getElementById('file-input').click()" >이미지 변경</button>
                <button type="submit">공유하기</button>
            </div>
        </form>
    </div>

    <script>

        const fileInput = document.getElementById('file-input');
        const imagePreview = document.getElementById('image-preview');
        const previewImg = document.getElementById('preview-img');
        const form = document.getElementById('upload-form');

        // 드래그 앤 드롭을 위한 이벤트 리스너들
        imagePreview.addEventListener('dragover', (e) => {
            e.preventDefault();
            imagePreview.classList.add('dragover');
        });

        imagePreview.addEventListener('dragleave', (e) => {
            e.preventDefault();
            imagePreview.classList.remove('dragover');
        });

        imagePreview.addEventListener('drop', (e) => {
            e.preventDefault();
            imagePreview.classList.remove('dragover');
            const files = e.dataTransfer.files;
            if (files.length > 0) {
                fileInput.files = files;
                displayImage(files[0]);
            }
        });

        // 파일 선택을 위한 이벤트 리스너
        fileInput.addEventListener('change', (e) => {
            const file = e.target.files[0];
            if (file) {
                displayImage(file);
            }
        });

        // 이미지 미리보기를 표시하는 함수
        function displayImage(file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                previewImg.src = e.target.result;
                previewImg.style.display = 'block';
                imagePreview.querySelector('span').style.display = 'none';
            };
            reader.readAsDataURL(file);
        }

    </script>
</html>