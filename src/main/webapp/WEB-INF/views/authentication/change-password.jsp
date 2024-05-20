<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
        }

        div {
            margin-bottom: 20px;
            text-align: left;
        }

        span {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="password"]:focus {
            outline: none;
            border-color: #3498db;
        }

        span.error-msg {
            color: #e74c3c;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #3498db;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<form action="/change-password" method="post">
    <h2>Thay đổi mật khẩu</h2>
    <div>
        <span>Mật khẩu hiện tại:</span>
        <input type="password" name="currentPassword" required>
    </div>
    <div>
        <span>Mật khẩu mới:</span>
        <input type="password" name="newPassword" required>
    </div>
    <div>
        <span>Xác nhận mật khẩu:</span>
        <input type="password" name="confirmPassword" required>
    </div>
    <span class="error-msg">${errMsg}</span>
    <button type="submit">Gửi</button>
</form>
</body>
</html>
