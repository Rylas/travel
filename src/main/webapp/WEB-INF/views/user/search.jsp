<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<%@ include file="../material/navbar.jsp" %>

<div class="container mt-5">
    <h2>Search Results for "<c:out value="${keyword}" />"</h2>

    <h3>Tours</h3>
    <c:if test="${not empty tours}">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Departure Date</th>
                <th>Expected Date</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="tour" items="${tours}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${tour.nameTour}</td>
                    <td><fmt:formatDate value="${tour.departureDate}" pattern="dd/MM/yyyy"/></td>
                    <td><fmt:formatDate value="${tour.expectedDate}" pattern="dd/MM/yyyy"/></td>
                    <td><fmt:formatNumber value="${tour.priceAdult}" type="number"/> đ</td>
                    <td>
                        <a href="/details/tour/${tour.tourID}" class="btn btn-info btn-sm">View</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty tours}">
        <p>No tours found matching your keyword.</p>
    </c:if>

    <h3>Locations</h3>
    <c:if test="${not empty locations}">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
<%--                <th>Description</th>--%>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="location" items="${locations}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${location.nameLocation}</td>
<%--                    <td>${location.description}</td>--%>
                    <td>
                        <a href="/details/location/${location.locationID}" class="btn btn-info btn-sm">View</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty locations}">
        <p>No locations found matching your keyword.</p>
    </c:if>
</div>

<%@ include file="../material/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
