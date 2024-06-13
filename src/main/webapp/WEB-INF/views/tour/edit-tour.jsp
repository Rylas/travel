<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Tour</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mb-4">Edit Tour</h1>
    <form action="/admin/editTour" method="post" enctype="multipart/form-data">
        <input type="hidden" name="tourId" value="${tour.tourId}">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${tour.name}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${tour.description}</textarea>
        </div>
        <div class="form-group">
            <label for="image-file">Image</label>
            <input type="text" name="image" value="${tour.image}" hidden="true">
            <input type="file" class="form-control-file" id="image-file" name="image-file">
            <img src="/uploads/tour/${tour.image}" alt="${tour.name}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="text" name="banner" value="${tour.banner}" hidden="true">
            <input type="file" class="form-control-file" id="banner-file" name="banner-file">
            <img src="/uploads/tour/${tour.banner}" alt="${tour.name}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="text" class="form-control" id="price" name="price" value="${tour.price}" required>
        </div>
        <div class="form-group">
            <label for="start">Start Date</label>
            <input type="date" class="form-control" id="start" name="start" value="${startDate}" required>
        </div>
        <div class="form-group">
            <label for="end">End Date</label>
            <input type="date" class="form-control" id="end" name="end" value="${endDate}" required>
        </div>
        <div class="form-group">
            <label for="transport">Transport</label>
            <input type="text" class="form-control" id="transport" name="transport" value="${tour.transport}" required>
        </div>
        <div class="form-group">
            <label for="schedule">Schedule</label>
            <textarea class="form-control" id="schedule" name="schedule" rows="3" required>${tour.schedule}</textarea>
        </div>
        <div class="form-group">
            <label for="enterprise">Enterprise</label>
            <select class="form-control" id="enterprise" name="enterprise" required>
                <c:forEach var="enterprise" items="${enterprises}">
                    <option value="${enterprise.enterpriseId}" ${enterprise.enterpriseId == tour.enterprise.enterpriseId ? 'selected' : ''}>${enterprise.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="locations">Locations</label>
            <select multiple class="form-control" id="locations" name="locations" required>
                <c:forEach var="location" items="${locations}">
                    <option value="${location.locationId}" ${tour.locations.contains(location) ? 'selected' : ''}>${location.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="true" ${tour.status ? 'selected' : ''}>Active</option>
                <option value="false" ${!tour.status ? 'selected' : ''}>Inactive</option>
            </select>
        </div>
        <div class="form-group">
            <label for="isHot">Is Hot</label>
            <select class="form-control" id="isHot" name="hot" required>
                <option value="true" ${tour.hot ? 'selected' : ''}>Yes</option>
                <option value="false" ${!tour.hot ? 'selected' : ''}>No</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Update Tour</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
