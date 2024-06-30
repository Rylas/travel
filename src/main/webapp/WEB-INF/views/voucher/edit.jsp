<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Voucher</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-submit {
            background-color: #007bff;
            color: white;
            border-radius: 30px;
            font-size: 16px;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .btn-submit:hover {
            background-color: #0056b3;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Edit Voucher</h2>
    <form action="/admin/voucher/update" method="post">
        <input type="hidden" name="voucherID" value="${voucher.voucherID}">
        <div class="form-group">
            <label for="voucherCode">Voucher Code</label>
            <input type="text" class="form-control" id="voucherCode" name="voucherCode" value="${voucher.voucherCode}" required>
        </div>
        <div class="form-group">
            <label for="typeSale">Type Sale</label>
            <input type="text" class="form-control" id="typeSale" name="typeSale" value="${voucher.typeSale}" required>
        </div>
        <div class="form-group">
            <label for="value">Value</label>
            <input type="number" class="form-control" id="value" name="value" value="${voucher.value}" required>
        </div>
        <div class="form-group">
            <label for="maxDesValue">Max Discount Value</label>
            <input type="number" class="form-control" id="maxDesValue" name="maxDesValue" value="${voucher.maxDesValue}" required>
        </div>
        <div class="form-group">
            <label for="describeVoucher">Description</label>
            <textarea class="form-control" id="describeVoucher" name="describeVoucher" required>${voucher.describeVoucher}</textarea>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="true" <c:if test="${voucher.status}">selected</c:if>>Active</option>
                <option value="false" <c:if test="${!voucher.status}">selected</c:if>>Inactive</option>
            </select>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date</label>
            <input type="date" class="form-control" id="startDate" name="startDate" value="${voucher.startDate}" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date</label>
            <input type="date" class="form-control" id="endDate" name="endDate" value="${voucher.endDate}" required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Update Voucher</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
