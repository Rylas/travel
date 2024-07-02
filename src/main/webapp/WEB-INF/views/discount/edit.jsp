<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Discount</title>
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
    <h2 class="text-center">Edit Discount</h2>
    <form action="/admin/discount/update" method="post">
        <input type="hidden" name="discountID" value="${discount.discountID}">
        <div class="form-group">
            <label for="discountPercentage">Discount Percentage</label>
            <input type="number" class="form-control" id="discountPercentage" name="discountPercentage" value="${discount.discountPercentage}" required>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date</label>
            <input type="date" class="form-control" id="startDate" name="startDate" value="${discount.startDate}" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date</label>
            <input type="date" class="form-control" id="endDate" name="endDate" value="${discount.endDate}" required>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="true" <c:if test="${discount.status}">selected</c:if>>Active</option>
                <option value="false" <c:if test="${!discount.status}">selected</c:if>>Inactive</option>
            </select>
        </div>
        <div class="form-group">
            <label for="descriptionDiscount">Description</label>
            <textarea class="form-control" id="descriptionDiscount" name="descriptionDiscount" required>${discount.descriptionDiscount}</textarea>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Update Discount</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
