<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booked Tours</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .msg {
            color: green;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Booked Tours</h2>
    <p class="msg">${msg}</p>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Tour Name</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Message</th>
            <th>Booking Date</th>
            <th>Total Amount</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            int index = 1;
        %>
        <c:forEach var="booking" items="${bookings}">
            <tr>
                <td><%= index %></td>
                <td>${booking.tour.nameTour}</td>
                <td>${booking.name}</td>
                <td>${booking.email}</td>
                <td>${booking.phone}</td>
                <td>${booking.note}</td>
                <td><fmt:formatDate value="${booking.createdAt}" pattern="dd-MM-yyyy HH:mm"/></td>
                <td class="price">${booking.totalPrice}</td>
                <td>
                    <c:choose>
                        <c:when test="${booking.status == 'Pending'}">
                            <a href="/booking/edit?id=${booking.bookingID}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="/booking/cancel?id=${booking.bookingID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to cancel this booking?');">Cancel</a>
                        </c:when>
                        <c:otherwise>
                            <span class="text-muted">${booking.status}</span>
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
            <%
                index++;
            %>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        setTimeout(function() {
            $(".msg").fadeOut();
        }, 3000);
        $(".price").each(function() {
            var price = $(this).text();
            var formattedPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
            $(this).text(formattedPrice);
        });
    });

</script>
</body>
</html>
