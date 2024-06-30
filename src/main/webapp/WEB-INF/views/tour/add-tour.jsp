<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Tour</title>
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
        .msg {
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Add New Tour</h2>
    <p class="msg">${msg}</p>
    <form action="/admin/tour/add" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="nameTour">Tour name</label>
            <input type="text" class="form-control" id="nameTour" name="nameTour" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="file" class="form-control-file" id="banner-file" name="banner-file" required>
        </div>
        <div class="form-group">
            <label for="image-file1">First Image</label>
            <input type="file" class="form-control-file" id="image-file1" name="image-file1" required>
        </div>
        <div class="form-group">
            <label for="image-file2">Second Image</label>
            <input type="file" class="form-control-file" id="image-file2" name="image-file2" required>
        </div>
        <div class="form-group">
            <label for="image-file3">Third Image</label>
            <input type="file" class="form-control-file" id="image-file3" name="image-file3" required>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="text" class="form-control" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <div class="form-group">
            <label for="transport">Transport</label>
            <input type="text" class="form-control" id="transport" name="transport" required>
        </div>
        <div class="form-group">
            <label for="minPeople">Min People</label>
            <input type="number" class="form-control" id="minPeople" name="minPeople" required>
        </div>
        <div class="form-group">
            <label for="maxPeople">Max People</label>
            <input type="number" class="form-control" id="maxPeople" name="maxPeople" required>
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
        </div>

<%--        Is hot--%>
        <div class="form-group">
            <label for="isHot">Is Hot</label>
            <select class="form-control" id="isHot" name="isHot" required>
                <option value="1">Yes</option>
                <option value="0">No</option>
            </select>
        </div>
<%--        Discount select  --%>
        <div class="form-group">
            <label for="discountID">Discount</label>
            <select class="form-control" id="discountID" name="discountID" required>
                <c:forEach var="discount" items="${discounts}">
                    <option value="${discount.discountID}">${discount.discountPercentage}%</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="enterpriseID">Enterprise</label>
            <select class="form-control" id="enterpriseID" name="enterpriseID" required>
                <c:forEach var="enterprise" items="${enterprises}">
                    <option value="${enterprise.enterpriseID}">${enterprise.nameEnterprise}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="locations">Locations</label>
            <select multiple class="form-control" id="locations" name="locations" required>
                <c:forEach var="location" items="${locations}">
                    <option value="${location.locationID}">${location.nameLocation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Add Tour</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
