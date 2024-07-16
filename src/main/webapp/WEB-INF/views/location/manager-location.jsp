<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Location</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
    <style>
        .msg{
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Add New Location</h2>
    <p class="msg">${msg}</p>
    <form action="/admin/location/add" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Name Location</label>
            <input type="text" class="form-control" id="name" name="nameLocation" required>
        </div>
        <div class="form-group">
            <label for="editor">Description</label>
            <textarea class="form-control" id="editor" name="description" rows="3" required></textarea>
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
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status">
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
        </div>
        <div class="form-group">
            <label for="isHot">Is Hot Location</label>
            <select class="form-control" id="isHot" name="isHot">
                <option value="1">Yes</option>
                <option value="0">No</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Add Location</button>
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
