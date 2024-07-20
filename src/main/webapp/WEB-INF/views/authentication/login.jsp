<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Book Tour Việt Nam</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('/img/backgroundcontact.jpg'); /* Hình nền với cảnh du lịch */
            background-size: cover;
            background-position: center;
            color: #333;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            color: #333;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
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

        h2 {
            color: #fff;
            font-size: 32px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .links {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .links a {
            color: #2980b9;
            text-decoration: none;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 5px 10px;
            border-radius: 5px;
        }

        .links a:hover {
            text-decoration: underline;
        }

        span.msg {
            display: block;
            margin: 10px 0;
        }

        span.successMsg {
            color: #2ecc71;
        }

        span.errorMsg {
            color: #e74c3c;
        }
    </style>
</head>
<body>
<%@ include file="../material/navbar.jsp" %>

<h2>Đăng nhập</h2>
<form action="/login" method="post">
    <div>
        <label for="email">Email</label>
        <input type="email" name="email" id="email" required>
    </div>
    <div>
        <label for="password">Mật khẩu:</label>
        <input type="password" name="password" id="password" required>
    </div>
    <span class="msg successMsg">${successMsg}</span>
    <span class="msg errorMsg">${errorMsg}</span>
    <button type="submit">Đăng nhập</button>

    <!-- Thêm nút đăng nhập bằng Google -->
    <button onclick="window.location.href='/google-login';" style="background-color: #db4a39; margin-top: 20px;">Đăng nhập bằng Google</button>

    <!-- Thêm nút đăng nhập bằng Facebook -->
    <button onclick="window.location.href='/facebook';" style="background-color: #3b5998; margin-top: 10px;">Đăng nhập bằng Facebook</button>

    <div class="links">
        <a href="/register">Đăng ký</a>
        <a href="/forgot-password">Quên mật khẩu</a>
    </div>
</form>

<%@include file="../material/footer.jsp"%>
</body>
</html>
