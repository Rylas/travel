<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Vouchers</title>
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
<%@ include file="../material/navbar.jsp"%>
<div class="container">
    <h2 class="text-center">Manage Vouchers</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Voucher Code</th>
            <th>Type Sale</th>
            <th>Value</th>
            <th>Max Discount Value</th>
            <th>Status</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="voucher" items="${vouchers}">
            <tr>
                <td>${voucher.voucherID}</td>
                <td>${voucher.voucherCode}</td>
                <td>${voucher.typeSale}</td>
                <td>${voucher.value}</td>
                <td>${voucher.maxDesValue}</td>
                <td><c:choose>
                    <c:when test="${voucher.status}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td>${voucher.startDate}</td>
                <td>${voucher.endDate}</td>
                <td>${voucher.describeVoucher}</td>
                <td>
                    <a href="/admin/voucher/edit?id=${voucher.voucherID}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="/admin/voucher/delete?id=${voucher.voucherID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this voucher?');">Delete</a>
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
