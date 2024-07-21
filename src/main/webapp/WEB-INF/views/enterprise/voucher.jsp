<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Yêu cầu thêm mã giảm giá</title>
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
<%@ include file="../material/navbar.jsp"%>
<div class="container">
    <h2 class="text-center">Add New Voucher</h2>
    <p class="msg">${msg}</p>
    <form action="/enterprise/voucher/add" method="post">
        <div class="form-group">
            <label for="voucherCode">Voucher Code</label>
            <input type="text" class="form-control" id="voucherCode" name="voucherCode" required>
        </div>
        <div class="form-group">
            <label for="typeSale">Type Sale</label>
            <select class="form-control" id="typeSale" name="typeSale" required>
                <option value="true">Percent</option>
                <option value="false">Value</option>
            </select>
        </div>
        <div class="form-group">
            <label for="value">Value</label>
            <input type="number" class="form-control" id="value" name="value" required>
        </div>
        <div class="form-group">
            <label for="maxDesValue">Max Discount Value</label>
            <input type="number" class="form-control" id="maxDesValue" name="maxDesValue" required>
        </div>
        <div class="form-group">
            <label for="describeVoucher">Description</label>
            <textarea class="form-control" id="describeVoucher" name="describeVoucher" required></textarea>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Add Voucher</button>
        </div>
    </form>
</div>
<%@ include file="../material/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
