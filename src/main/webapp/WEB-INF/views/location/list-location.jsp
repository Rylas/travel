<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Locations</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            margin: 20px;
        }
        .container {
            max-width: 1200px;
        }
        .table img {
            width: 100px;
            height: auto;
        }
        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">Manage Locations</h1>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Description</th>
            <th>Banner</th>
            <th>First Image</th>
            <th>Second Image</th>
            <th>Third Image</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="location" items="${locations}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${location.nameLocation}</td>
                <td>${location.description}</td>
                <td><img src="/uploads/location/${location.banner}" alt="${location.nameLocation}"></td>
                <td><img src="/uploads/location/${location.firstImage}" alt="${location.nameLocation}"></td>
                <td><img src="/uploads/location/${location.secondImage}" alt="${location.nameLocation}"></td>
                <td><img src="/uploads/location/${location.thirdImage}" alt="${location.nameLocation}"></td>
                <td><c:choose>
                    <c:when test="${location.status}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td>
                    <a href="location/edit/${location.locationID}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="location/delete?id=${location.locationID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this location?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
