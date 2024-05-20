<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Tour</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-submit {
            background-color: #007bff;
            color: white;
            border-radius: 30px;
            font-size: 16px;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .btn-submit:hover {
            background-color: #0056b3;
            color: white;
        }
        .msg {
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Add New Tour</h2>
    <p class="msg">${msg}</p>
    <form action="/admin/tour/add" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="image-file">Image</label>
            <input type="file" class="form-control-file" id="image-file" name="image-file" required>
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="file" class="form-control-file" id="banner-file" name="banner-file" required>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="text" class="form-control" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <div class="form-group">
            <label for="transport">Transport</label>
            <input type="text" class="form-control" id="transport" name="transport" required>
        </div>
        <div class="form-group">
            <label for="schedule">Schedule</label>
            <textarea class="form-control" id="schedule" name="schedule" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="enterprise">Enterprise</label>
            <select class="form-control" id="enterprise" name="enterprise" required>
                <c:forEach var="enterprise" items="${enterprises}">
                    <option value="${enterprise.enterpriseId}">${enterprise.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="locations">Locations</label>
            <select multiple class="form-control" id="locations" name="locations" required>
                <c:forEach var="location" items="${locations}">
                    <option value="${location.locationId}">${location.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Add Tour</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
