<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Enterprises</title>
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
    <h1 class="mb-4">Manage Enterprises</h1>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Description</th>
            <th>Image</th>
            <th>Banner</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Website</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="enterprise" items="${enterprises}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${enterprise.name}</td>
                <td>${enterprise.description}</td>
                <td><img src="/uploads/enterprise/${enterprise.image}" alt="${enterprise.name}"></td>
                <td><img src="/uploads/enterprise/${enterprise.banner}" alt="${enterprise.name}"></td>
                <td>${enterprise.address}</td>
                <td>${enterprise.phone}</td>
                <td>${enterprise.email}</td>
                <td>${enterprise.website}</td>
                <td><c:choose>
                    <c:when test="${enterprise.status}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td>
                    <a href="/admin/enterprise/edit/${enterprise.enterpriseId}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="/admin/enterprise/delete?id=${enterprise.enterpriseId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this enterprise?');">Delete</a>
                    <c:if test="${!enterprise.status}">
                        <a href="/admin/enterprise/active/${enterprise.enterpriseId}" class="btn btn-success btn-sm">Approve</a>
                    </c:if>
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
