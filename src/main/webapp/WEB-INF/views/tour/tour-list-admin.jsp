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
    <title>Admin - Manage Tours</title>
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
    <h1 class="mb-4">Manage Tours</h1>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Description</th>
            <th>Image</th>
            <th>Banner</th>
            <th>Price</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Transport</th>
            <th>Schedule</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tour" items="${tours}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${tour.name}</td>
                <td>${tour.description}</td>
                <td><img src="${tour.image}" alt="${tour.name}"></td>
                <td><img src="${tour.banner}" alt="${tour.name}"></td>
                <td class="price">${tour.price}</td>
                <td><fmt:formatDate value="${tour.startDate}" pattern="dd-MM-yyyy"/></td>
                <td><fmt:formatDate value="${tour.endDate}" pattern="dd-MM-yyyy"/></td>
                <td>${tour.transport}</td>
                <td>${tour.schedule}</td>
                <td><c:choose>
                    <c:when test="${tour.status}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td>
                    <a href="editTour/${tour.tourId}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="deleteTour?id=${tour.tourId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this tour?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $(".price").each(function() {
            var price = $(this).text();
            var formattedPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
            $(this).text(formattedPrice);
        });
    });
</script>
</body>
</html>
