<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Group Tour</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            margin: 20px;
        }
        .container {
            max-width: 1200px;
        }
        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">Quản lý Group Tour</h1>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>Tour Name</th>
            <th>Enterprise Name</th>
            <th>Status</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Max People</th>
            <th>Current People</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="groupTour" items="${groupTours}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${groupTour.tour.name}</td>
                <td>${groupTour.enterprise.name}</td>
                <td><c:choose>
                    <c:when test="${groupTour.status}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td><fmt:formatDate value="${groupTour.startDate}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatDate value="${groupTour.endDate}" pattern="yyyy-MM-dd"/></td>
                <td>${groupTour.maxPeople}</td>
                <td>${groupTour.currentPeople}</td>
                <td><fmt:formatNumber value="${groupTour.price}" type="currency"/></td>
                <td>
                    <a href="groupTour/active/${groupTour.groupTourID}" class="btn btn-primary btn-sm">Bắt đầu Tour</a>
                    <a href="groupTour/detail/${groupTour.groupTourID}" class="btn btn-info btn-sm">Chi tiết</a>
                    <a href="groupTour/edit/${groupTour.groupTourID}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="groupTour/delete?id=${groupTour.groupTourID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this group tour?');">Xóa</a>
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
