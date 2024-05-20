<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mb-4">Booking Details</h1>
    <div class="card">
        <div class="card-header">
            Booking Information
        </div>
        <div class="card-body">
            <h5 class="card-title">${booking.name}</h5>
            <p class="card-text">
                <strong>Booking Date:</strong> <fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy HH:mm"/><br>
                <strong>Number of People:</strong> ${booking.numberOfPeople}<br>
                <strong>Total Amount:</strong> ${booking.totalAmount}<br>
                <strong>Message:</strong> ${booking.message}<br>
                <strong>Phone:</strong> ${booking.phone}<br>
                <strong>Email:</strong> ${booking.email}<br>
                <strong>Status:</strong> <c:choose>
                <c:when test="${booking.status}">Approved</c:when>
                <c:otherwise>Pending</c:otherwise>
            </c:choose><br>
                <strong>Payment Method:</strong> ${booking.paymentMethod}<br>
                <strong>Payment Date:</strong> <fmt:formatDate value="${booking.paymentDate}" pattern="dd-MM-yyyy HH:mm"/><br>
                <strong>Cancel Date:</strong> <fmt:formatDate value="${booking.cancelDate}" pattern="dd-MM-yyyy HH:mm"/><br>
                <strong>Refund Date:</strong> <fmt:formatDate value="${booking.refundDate}" pattern="dd-MM-yyyy HH:mm"/><br>
                <strong>Voucher:</strong> ${booking.voucher}<br>
            </p>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header">
            User Information
        </div>
        <div class="card-body">
            <h5 class="card-title">${booking.user.firstName} ${booking.user.lastName}</h5>
            <p class="card-text">
                <strong>User ID:</strong> ${booking.user.userId}<br>
                <strong>Email:</strong> ${booking.user.email}<br>
                <strong>Phone:</strong> ${booking.user.phone}<br>
                <strong>Address:</strong> ${booking.user.address}<br>
            </p>
        </div>
    </div>

    <div class="mt-4">
        <c:if test="${!booking.status}">
            <a href="/admin/booking/approve?id=${booking.id}" class="btn btn-success">Approve</a>
        </c:if>
        <a href="/admin/booking/delete?id=${booking.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this booking?');">Delete Booking</a>
        <a href="admin/booking" class="btn btn-secondary">Back to Bookings</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
