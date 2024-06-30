<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Location</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mb-4">Edit Location</h1>
    <form action="/admin/location/edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="locationID" value="${location.locationID}">
        <div class="form-group">
            <label for="nameLocation">Name</label>
            <input type="text" class="form-control" id="nameLocation" name="nameLocation" value="${location.nameLocation}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${location.description}</textarea>
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="text" name="banner" value="${location.banner}" hidden="true">
            <input type="file" class="form-control-file" id="banner-file" name="banner-file">
            <img src="/uploads/location/${location.banner}" alt="${location.nameLocation}" class="img-thumbnail mt-2" width="150">
        </div>
<%--        List 3 image--%>
        <div class="form-group">
            <label for="image-file1">Image 1</label>
            <input type="text" name="firstImage" value="${location.firstImage}" hidden="true">
            <input type="file" class="form-control-file" id="image-file1" name="image-file1">
            <img src="/uploads/location/${location.firstImage}" alt="${location.nameLocation}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="image-file2">Image 2</label>
            <input type="text" name="secondImage" value="${location.secondImage}" hidden="true">
            <input type="file" class="form-control-file" id="image-file2" name="image-file2">
            <img src="/uploads/location/${location.secondImage}" alt="${location.nameLocation}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="image-file3">Image 3</label>
            <input type="text" name="thirdImage" value="${location.thirdImage}" hidden="true">
            <input type="file" class="form-control-file" id="image-file3" name="image-file3">
            <img src="/uploads/location/${location.thirdImage}" alt="${location.nameLocation}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="true" ${location.status ? 'selected' : ''}>Active</option>
                <option value="false" ${!location.status ? 'selected' : ''}>Inactive</option>
            </select>
        </div>
        <div class="form-group">
            <label for="isHot">Is Hot</label>
            <select class="form-control" id="isHot" name="hot" required>
                <option value="true" ${location.hot ? 'selected' : ''}>Yes</option>
                <option value="false" ${!location.hot ? 'selected' : ''}>No</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Update Location</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
