<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông báo</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #333;
            text-align: center;
        }

        .message-container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #3498db;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: white;
        }

        p {
            margin: 0;
            font-size: 18px;
            line-height: 1.5;
        }
    </style>
</head>
<body>
<div class="message-container">
    <p>Thông báo từ server:</p>
    <p>${message}</p>
</div>

<script>
    setTimeout(function() {
        window.location.href = "${redirectUrl}";
    }, 5000);
</script>
</body>
</html>
