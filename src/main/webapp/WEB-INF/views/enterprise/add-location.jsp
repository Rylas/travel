<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Location</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .msg{
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Yêu cầu địa điểm mới</h2>
    <p class="msg">${msg}</p>
    <form action="/enterprise/location" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Tên địa điểm</label>
            <input type="text" class="form-control" id="name" name="nameLocation" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="file" class="form-control-file" id="banner-file" name="banner-file" required>
        </div>
        <div class="form-group">
            <label for="image-file1">Image 1</label>
            <input type="file" class="form-control-file" id="image-file1" name="image-file1" required>
        </div>
        <div class="form-group">
            <label for="image-file2">Image 2</label>
            <input type="file" class="form-control-file" id="image-file2" name="image-file2" required>
        </div>
        <div class="form-group">
            <label for="image-file3">Image 3</label>
            <input type="file" class="form-control-file" id="image-file3" name="image-file3" required>
        </div>
        <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
