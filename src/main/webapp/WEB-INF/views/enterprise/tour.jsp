<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    NumberFormat currencyFormatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Tours</title>
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
    <h1 class="mb-4">Quản lý các Tour</h1>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>Tên</th>
            <%--            <th>Image</th>--%>
            <th>Ảnh bìa</th>
            <th>Giá người lớn</th>
            <th>Ngày khởi hành</th>
            <th>Ngày dự kiến</th>
            <th>Phương tiện</th>
            <%--            <th>Schedule</th>--%>
            <th>Trạng thái</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tour" items="${tours}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${tour.nameTour}</td>
<%--                <td>${tour.description}</td>--%>
                <td><img src="/uploads/tour/${tour.banner}" alt="${tour.banner}"></td>
                    <%--                <td><img src="/uploads/tour/${tour.banner}" alt="${tour.name}"></td>--%>
                <td class="price"><fmt:formatNumber value="${tour.priceAdult}" type="number" groupingUsed="true" />đ</td>
                <td><fmt:formatDate value="${tour.departureDate}" pattern="dd-MM-yyyy"/></td>
                <td><fmt:formatDate value="${tour.expectedDate}" pattern="dd-MM-yyyy"/></td>
                <td>${tour.transport}</td>
                    <%--                <td>${tour.schedule}</td>--%>
                <td><c:choose>
                    <c:when test="${tour.status}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td>
                    <a href="/admin/editTour/${tour.tourID}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="/admin/deleteTour?id=${tour.tourID}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa tour này?');">Xóa</a>
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
