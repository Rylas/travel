<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Book Tour Việt Nam</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('/img/danang_popular.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
            text-align: center;
        }

        form {
            max-width: 500px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            color: #333;
        }

        div {
            margin-bottom: 15px;
            text-align: left;
        }

        span {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #2980b9;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #2980b9;
            color: white;
            font-size: 18px;
            cursor: pointer;
            margin: 10px 0px !important;
        }

        button:hover {
            background-color: #1c70b6;
        }

        .loginBtn {
            background-color: #e67e22;
        }

        .loginBtn:hover {
            background-color: #d35400;
        }

        p.errMsg {
            color: #e74c3c;
            font-weight: bold;
        }

        h2 {
            color: #fff;
            font-size: 32px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .nameContainer {
            display: flex;
            justify-content: space-between;
        }

        .nameContainer div {
            flex-basis: calc(50% - 5px);
        }

        .nameContainer div:first-child {
            margin-right: 10px;
        }

    </style>
</head>
<body>
<%@ include file="../material/navbar.jsp" %>
<h2>Đăng ký</h2>
<form action="/register" method="post">
    <div class="nameContainer">
        <div>
            <label for="lastName">Họ:</label>
            <input type="text" name="lastName" id="lastName" required>
        </div>
        <div>
            <label for="firstName">Tên:</label>
            <input type="text" name="firstName" id="firstName" required>
        </div>
    </div>

    <div>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>
    </div>
    <div>
        <label for="phone">Số điện thoại:</label>
        <input type="tel" name="phone" id="phone" required>
    </div>
    <div>
        <label for="password">Mật khẩu:</label>
        <input type="password" name="password" id="password" required>
    </div>
    <div>
        <label for="confirmPassword">Xác nhận mật khẩu:</label>
        <input type="password" name="confirmPassword" id="confirmPassword" required>
    </div>
    <p class="errMsg">${msg}</p>
    <button type="submit">Đăng ký</button>
    <button onclick="window.location.href='/login'" class="loginBtn">Đăng nhập</button>
</form>
</body>
</html>
