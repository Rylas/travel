<%@ page import="org.example.travel.entity.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 20px auto;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            padding: 20px;
        }
        .user-info {
            text-align: center;
        }
        .user-info img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
            cursor: pointer;
        }
        .user-info h2 {
            margin-top: 0;
            margin-bottom: 5px;
            color: #333;
        }
        .user-info p {
            margin: 5px 0;
            color: #555;
        }
        .edit-profile-form, .change-avatar-form {
            margin-top: 20px;
        }
        input[type="text"], input[type="email"], input[type="file"], button {
            margin-top: 10px;
            display: block;
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="file"] {
            width: auto;
        }
        button {
            background-color: #3498db;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
        /* Popup window styles */
        .popup {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }
        .popup-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
        }
        .popup-content img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            margin-bottom: 10px;
        }
        .popup-content input[type="file"] {
            display: none;
        }
        .drop-zone {
            border: 2px dashed #ddd;
            padding: 20px;
            border-radius: 10px;
            cursor: pointer;
            margin-bottom: 10px;
        }

        .user-info img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .user-info img:hover {
            transform: scale(1.1);
            box-shadow: 0 0 15px rgba(52, 152, 219, 0.6);
        }

        .user-info img:active {
            transform: scale(1);
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.4);
        }

    /*     Style for button Change password*/
        a {
            display: block;
            margin-top: 10px;
            text-align: center;
            color: #3498db;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="user-info">
        <img id="avatar" src="/uploads/<c:out value="${user.avatar}" />" alt="Hình đại diện"/>
        <h2><c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></h2>
        <p><strong>Email:</strong> <c:out value="${user.email}" /></p>
        <p><strong>Phone:</strong> <c:out value="${user.phone}" /></p>
    </div>

    <!-- Form to Edit Profile -->
    <form class="edit-profile-form" action="/changeInfo" method="post">
        <h3 style="text-align: center">Sửa thông tin</h3>
        <label for="firstName">Họ và tên đệm</label>
        <input type="text" name="firstName" id="firstName" value="<c:out value="${user.firstName}" />" placeholder="First Name"/>
        <label for="lastName">Tên</label>
        <input type="text" name="lastName" id="lastName" value="<c:out value="${user.lastName}" />" placeholder="Last Name"/>
        <label for="email">Email</label>
        <input type="email" name="email" id="email" value="<c:out value="${user.email}" />" placeholder="Email"/>
        <label for="phone">Số điện thoại</label>
        <input type="text" name="phone" id="phone" value="<c:out value="${user.phone}" />" placeholder="Phone"/>
        <button type="submit">Lưu thay đổi</button>
        <a href="/change-password">Đổi mật khẩu</a>
    </form>

    <!-- Popup for Changing Avatar -->
    <div id="avatarPopup" class="popup">
        <div class="popup-content">
            <span id="closePopup" style="float: right; cursor: pointer;">&times;</span>
            <img src="/uploads/<c:out value="${user.avatar}" />" alt="User Avatar"/>
            <form id="changeAvatarForm" action="/changeAvatar" method="post" enctype="multipart/form-data">
                <div class="drop-zone" id="dropZone">Kéo thả hoặc click vào đây để chọn ảnh đại diện mới của bạn</div>
                <input type="file" name="avatar" id="avatarInput" accept="image/*"/>
                <button type="submit">Thay đổi anh đại diện</button>
            </form>
        </div>
    </div>
</div>

<script>
    document.getElementById('avatar').addEventListener('click', function() {
        document.getElementById('avatarPopup').style.display = 'flex';
    });

    document.getElementById('closePopup').addEventListener('click', function() {
        document.getElementById('avatarPopup').style.display = 'none';
    });

    document.getElementById('dropZone').addEventListener('click', function() {
        document.getElementById('avatarInput').click();
    });

    document.getElementById('avatarInput').addEventListener('change', function() {
        document.getElementById('dropZone').innerText = this.files[0].name;
    });

    document.getElementById('dropZone').addEventListener('dragover', function(e) {
        e.preventDefault();
        e.stopPropagation();
        this.style.borderColor = '#3498db';
    });

    document.getElementById('dropZone').addEventListener('dragleave', function(e) {
        e.preventDefault();
        e.stopPropagation();
        this.style.borderColor = '#ddd';
    });

    document.getElementById('dropZone').addEventListener('drop', function(e) {
        e.preventDefault();
        e.stopPropagation();
        this.style.borderColor = '#ddd';
        let files = e.dataTransfer.files;
        document.getElementById('avatarInput').files = files;
        document.getElementById('dropZone').innerText = files[0].name;
    });
</script>
</body>
</html>
