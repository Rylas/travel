<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mb-4">Chi tiết đơn hàng</h1>
    <div class="card">
        <div class="card-header">
            Thông tin chi tiết đơn hàng
        </div>
        <div class="card-body">
            <h5 class="card-title">${booking.name}</h5>
            <p class="card-text">
                <strong>Ngày đặt:</strong> <fmt:formatDate value="${booking.createdAt}" pattern="dd-MM-yyyy"/><br>
                <strong>Tổng số người:</strong> ${booking.totalPeople}<br>
                <strong>Tổng giá tiền:</strong> <fmt:formatNumber value="${booking.totalPrice}" type="number" groupingUsed="true" />đ<br>
                <strong>Ghi chú:</strong> ${booking.note}<br>
                <strong>SDT:</strong> ${booking.phone}<br>
                <strong>Email:</strong> ${booking.email}<br>
                <strong>Trạng thái:</strong> ${booking.status}<br>
                <strong>Phương thức thanh toán:</strong> ${booking.payment.paymentMethod}<br>
                <strong>Ngày thanh toán:</strong> <fmt:formatDate value="${booking.createdAt}" pattern="dd-MM-yyyy"/><br>
                <strong>Ngày hủy tour:</strong> <fmt:formatDate value="${booking.canceledAt}" pattern="dd-MM-yyyy"/><br>
                <strong>Ngày hoàn trả:</strong> <fmt:formatDate value="${booking.refundDate}" pattern="dd-MM-yyyy"/><br>
                <strong>Mã giảm giá:</strong> ${booking.voucherCode.voucherCode}<br>
            </p>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header">
            Thông tin của người đặt Tour
        </div>
        <div class="card-body">
            <h5 class="card-title">${booking.user.firstName} ${booking.user.lastName}</h5>
            <p class="card-text">
                <strong>User ID:</strong> ${booking.user.userID}<br>
                <strong>Email:</strong> ${booking.user.email}<br>
                <strong>Phone:</strong> ${booking.user.phone}<br>
                <strong>Address:</strong> ${booking.user.address}<br>
            </p>
        </div>
    </div>

    <div class="mt-4">
        <c:if test="${booking.status != 'Approve'}">
            <a href="/admin/booking/approve?id=${booking.bookingID}" class="btn btn-success">Duyệt</a>
        </c:if>
        <c:if test="${booking.status != 'Cancel'}">
            <a href="/admin/booking/cancel?id=${booking.bookingID}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn đặt tour này?');">Hủy</a>
        </c:if>
        <c:if test="${booking.status != 'Pending'}">
            <a href="/admin/booking/pending?id=${booking.bookingID}" class="btn btn-warning">Đưa về chờ xử lý</a>
        </c:if>
        <a href="/admin/booking/delete?id=${booking.bookingID}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa đơn đặt tour này?');">Xóa</a>
        <a href="admin/booking" class="btn btn-secondary">Back to Bookings</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
