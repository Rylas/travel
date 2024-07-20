<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enterprise - Danh sách tour đã đặt</title>
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
<%@ include file="../material/navbar.jsp"%>

<div class="container">
    <h2 class="text-center">Booked Tours</h2>
    <p class="msg">${msg}</p>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Tour Name</th>
            <%--            <th>Full Name</th>--%>
            <%--            <th>Email</th>--%>
            <%--            <th>Phone</th>--%>
            <%--            <th>Message</th>--%>
            <th>Status</th>
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

                    <%--                <td>${booking.name}</td>--%>
                    <%--                <td>${booking.email}</td>--%>
                    <%--                <td>${booking.phone}</td>--%>
                    <%--                <td>${booking.note}</td>--%>
                <td>
                    <c:choose>
                        <c:when test="${booking.groupTour.status == 'Waiting'}">
                            <span class="badge badge-warning">Đang chờ người tham gia tour (${booking.groupTour.currentPeople}/${booking.groupTour.maxPeople} người)</span>
                        </c:when>
                        <c:when test="${booking.groupTour.status == 'Active'}">
                            <span class="badge badge-success">Đang diễn ra</span>
                        </c:when>
                        <c:when test="${booking.groupTour.status == 'Cancelled'}">
                            <span class="badge badge-danger">Đã hủy</span>
                        </c:when>

                        <c:when test="${booking.groupTour.status ==  'Finished'}">
                            <span class="badge badge-secondary">Đã kết thúc</span>
                        </c:when>
                        <c:when test="${booking.groupTour.status ==  'In Process'}">
                            <span class="badge badge-secondary">Sẵn sàng để diễn ra</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-secondary">Đang đợi xác nhận để ghép tour</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><fmt:formatDate value="${booking.createdAt}" pattern="dd-MM-yyyy"/></td>
                <td class="price">${booking.totalPrice}</td>
                <td>
                    <c:choose>
                        <c:when test="${booking.groupTour.status != 'Cancelled'}">
                            <a href="/mytour/details/${booking.groupTour.groupTourID}" class="btn btn-info btn-sm">Chi tiết</a>
                        </c:when>
                        <c:when test="${booking.groupTour.status == null}">
                            <a href="/enterprise/booking" class="btn btn-info btn-sm">Duyệt</a>
                        </c:when>
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
