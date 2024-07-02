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
            <label for="nameTour">Tên của tour</label>
            <input type="text" class="form-control" id="nameTour" name="nameTour" required>
        </div>
        <div class="form-group">
            <label for="description">Mô tả về tour</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="banner-file">Ảnh bìa</label>
            <input type="file" class="form-control-file" id="banner-file" name="banner-file" required>
        </div>
        <div class="form-group">
            <label for="image-file1">Ảnh thứ nhất về tour</label>
            <input type="file" class="form-control-file" id="image-file1" name="image-file1" required>
        </div>
        <div class="form-group">
            <label for="image-file2">Ảnh thứ hai về tour</label>
            <input type="file" class="form-control-file" id="image-file2" name="image-file2" required>
        </div>
        <div class="form-group">
            <label for="image-file3">Ảnh thứ ba về tour</label>
            <input type="file" class="form-control-file" id="image-file3" name="image-file3" required>
        </div>
        <div class="form-group">
            <label for="priceAdult">Giá cho người lớn</label>
            <input type="text" class="form-control" id="priceAdult" name="priceAdult" required>
        </div>
        <div class="form-group">
            <label for="priceChild6_10">Giá cho trẻ em từ 6 - 10 tuổi</label>
            <input type="text" class="form-control" id="priceChild6_10" name="priceChild6_10" required>
        </div>
        <div class="form-group">
            <label for="priceChild2_5">Giá cho trẻ em từ 2 - 5 tuổi</label>
            <input type="text" class="form-control" id="priceChild2_5" name="priceChild2_5" required>
        </div>
        <div class="form-group">
            <label for="priceChild2">Giá cho trẻ em dưới 2 tuổi</label>
            <input type="text" class="form-control" id="priceChild2" name="priceChild2" required>
        </div>
        <div class="form-group">
            <label for="startDate">Ngày khởi hành</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">Ngày kết thúc</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <div class="form-group">
            <label for="transport">Phương tiện di chuyển</label>
            <input type="text" class="form-control" id="transport" name="transport" required>
        </div>
        <div class="form-group">
            <label for="minPeople">Số khách tối thiểu (Để có thể bắt đầu một tour)</label>
            <input type="number" class="form-control" id="minPeople" name="minPeople" required>
        </div>
        <div class="form-group">
            <label for="maxPeople">Số khách tối đa</label>
            <input type="number" class="form-control" id="maxPeople" name="maxPeople" required>
        </div>

        <div class="form-group">
            <label for="status">Trạng thái</label>
            <select class="form-control" id="status" name="status" required>
                <option value="1">Khả dụng</option>
                <option value="0">Không khả dụng</option>
            </select>
        </div>

<%--        Is hot--%>
        <div class="form-group">
            <label for="isHot">Đặt là tour nổi bật</label>
            <select class="form-control" id="isHot" name="isHot" required>
                <option value="1">Có</option>
                <option value="0">Không</option>
            </select>
        </div>
<%--        Discount select  --%>
        <div class="form-group">
            <label for="discountID">Giảm giá</label>
            <select class="form-control" id="discountID" name="discountID" required>
                <c:forEach var="discount" items="${discounts}">
                    <option value="${discount.discountID}">Giảm ${discount.discountPercentage}%</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="enterpriseID">Doanh nghiệp tổ chức tour</label>
            <select class="form-control" id="enterpriseID" name="enterpriseID" required>
                <c:forEach var="enterprise" items="${enterprises}">
                    <option value="${enterprise.enterpriseID}">${enterprise.enterpriseID}: ${enterprise.nameEnterprise}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="locations">Các địa điểm trong tour</label>
            <select multiple class="form-control" id="locations" name="locations" required>
                <c:forEach var="location" items="${locations}">
                    <option value="${location.locationID}">${location.nameLocation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Thêm mới Tour</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
