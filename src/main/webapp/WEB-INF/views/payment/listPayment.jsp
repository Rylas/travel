<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Payments</title>
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
<%@ include file="../material/navbar.jsp" %>
<div class="container">
    <h2 class="text-center">Manage Payments</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Payment Method</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="payment" items="${payments}">
            <tr>
                <td>${payment.paymentID}</td>
                <td>${payment.paymentMethod}</td>
                <td>
                    <a href="/admin/payment/edit?id=${payment.paymentID}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="/admin/payment/delete?id=${payment.paymentID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this payment?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@ include file="../material/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
