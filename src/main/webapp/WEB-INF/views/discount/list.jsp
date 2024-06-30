<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Discounts</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Manage Discounts</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Discount Percentage</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="discount" items="${discounts}">
            <tr>
                <td>${discount.discountID}</td>
                <td>${discount.discountPercentage}%</td>
                <td>${discount.startDate}</td>
                <td>${discount.endDate}</td>
                <td><c:choose>
                    <c:when test="${discount.status}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td>${discount.descriptionDiscount}</td>
                <td>
                    <a href="/admin/discount/edit?id=${discount.discountID}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="/admin/discount/delete?id=${discount.discountID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this discount?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
