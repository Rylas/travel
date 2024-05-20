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
        <input type="hidden" name="locationId" value="${location.locationId}">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${location.name}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${location.description}</textarea>
        </div>
        <div class="form-group">
            <label for="image-file">Image</label>
            <input type="file" class="form-control-file" id="image-file" name="image-file">
            <img src="${location.image}" alt="${location.name}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="file" class="form-control-file" id="banner-file" name="banner-file">
            <img src="${location.banner}" alt="${location.name}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="${location.address}" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${location.phone}" required>
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
            <select class="form-control" id="isHot" name="isHot" required>
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
