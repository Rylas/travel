<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Bookings</title>
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
    <h1 class="mb-4">Manage Bookings</h1>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Booking Date</th>
            <th>Number of People</th>
            <th>Total Amount</th>
            <th>Message</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="booking" items="${bookings}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${booking.name}</td>
                <td><fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy HH:mm"/></td>
                <td>${booking.numberOfPeople}</td>
                <td>${booking.totalAmount}</td>
                <td>${booking.message}</td>
                <td>${booking.phone}</td>
                <td>${booking.email}</td>
                <td><c:choose>
                    <c:when test="${booking.status}">Approved</c:when>
                    <c:otherwise>Pending</c:otherwise>
                </c:choose></td>
                <td>
                    <a href="/admin/booking/detail/${booking.id}" class="btn btn-warning btn-sm">Detail</a>
                    <c:if test="${!booking.status}">
                        <a href="/admin/booking/approve?id=${booking.id}" class="btn btn-success btn-sm">Approve</a>
                    </c:if>
                    <a href="/admin/booking/delete?id=${booking.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this booking?');">Delete</a>
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
