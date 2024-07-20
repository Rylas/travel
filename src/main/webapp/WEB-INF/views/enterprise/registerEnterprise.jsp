<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Enterprise</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
    <style>
        .msg {
            color: green;
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
<div class="container mt-5">
    <h2 class="text-center">Register New Enterprise</h2>
    <span class="msg errorMsg">${errorMsg}</span>
    <span class="msg successMsg">${successMsg}</span>
    <form action="/enterprise" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="nameEnterprise">Name</label>
            <input type="text" class="form-control" id="nameEnterprise" name="nameEnterprise" required>
        </div>
        <div class="form-group">
            <label for="editor">Description</label>
            <textarea class="form-control" id="editor" name="description" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="logo-file">Logo</label>
            <input type="file" class="form-control-file" id="logo-file" name="logo-file" required>
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="file" class="form-control-file" id="banner-file" name="banner-file" required>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="website">Website</label>
            <input type="url" class="form-control" id="website" name="website" required>
        </div>
        <button type="submit" class="btn btn-primary">Register Enterprise</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    CKEDITOR.replace('editor', {
        filebrowserUploadUrl: '/uploadImage',
        filebrowserUploadMethod: 'form'
    });
</script>
</body>
</html>
