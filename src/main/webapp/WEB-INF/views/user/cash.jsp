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
        span.msg {
            display: block;
            margin: 10px 0;
        }

        span.successMsg {
            color: #2ecc71;
        }

        span.errorMsg {
            color: #e74c3c;
        }
    </style>
</head>
<body>
<%@ include file="../material/navbar.jsp"%>

<div class="container">
    <h2 class="text-center">Booked Tours</h2>
    <span class="msg errorMsg">${errorMsg}</span>
    <span class="msg successMsg">${successMsg}</span>
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
                <td><fmt:formatDate value="${booking.createdAt}" pattern="dd-MM-yyyy"/></td>
                <td class="price">${booking.totalPrice}</td>
                <td>
                    <c:choose>
                        <c:when test="${booking.status == 'Pending'}">
                            <a href="/booking/edit?id=${booking.bookingID}" class="btn btn-warning btn-sm">Sửa thông tin</a>
                            <a href="/booking/cancel?id=${booking.bookingID}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn hủy Tour?');">Hủy Tour</a>
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
<%@ include file="../material/footer.jsp"%>

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
