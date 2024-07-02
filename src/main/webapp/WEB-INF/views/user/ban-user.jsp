<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ban User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            padding: 20px;
        }
        .btn-custom {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h3 class="text-center">Ban User</h3>
        </div>
        <div class="card-body">
            <!-- Hiển thị thông tin người dùng bị ban -->
            <div class="form-group">
                <label>User ID:</label>
                <p>${userBan.userID}</p>
            </div>
            <div class="form-group">
                <label>First Name:</label>
                <p>${userBan.firstName}</p>
            </div>
            <div class="form-group">
                <label>Last Name:</label>
                <p>${userBan.lastName}</p>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <p>${userBan.email}</p>
            </div>
            <div class="form-group">
                <label>Phone:</label>
                <p>${userBan.phone}</p>
            </div>
            <div class="form-group">
                <label>Address:</label>
                <p>${userBan.address}</p>
            </div>
            <!-- Form gửi lý do ban -->
            <form action="ban" method="post">
                <div class="form-group">
                    <label for="reason">Reason for banning:</label>
                    <textarea class="form-control" id="reason" name="reason" rows="4" required></textarea>
                </div>
                <input type="hidden" name="id" value="${userBan.userID}">
                <button type="submit" class="btn btn-custom btn-block">Submit</button>
            </form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
