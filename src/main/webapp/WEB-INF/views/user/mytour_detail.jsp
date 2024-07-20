<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Group Tour - ${groupTour.tour.nameTour}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
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
        a {
            text-decoration: none;
            color: #187EC7 !important;
        }
    </style>
</head>
<body>
<%@ include file="../material/navbar.jsp"%>
<div class="container">
    <h1 class="mb-4">Chi tiết Group Tour - ${groupTour.tour.nameTour}</h1>
    <div class="tour-details mb-4">
        <h3>Thông tin chi tiết</h3>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <th>Tên Tour</th>
                <td>
                    <a href="/details/tour/${groupTour.groupTourID}">
                        ${groupTour.tour.nameTour}
                    </a>
                </td>
            </tr>
            <tr>
                <th>Doanh nghiệp</th>
                <td>${groupTour.enterprise.nameEnterprise}</td>
            </tr>
            <tr>
                <th>Ngày bắt đầu</th>
                <td>${groupTour.startDate}</td>
            </tr>
            <tr>
                <th>Ngày kết thúc</th>
                <td>${groupTour.endDate}</td>
            </tr>
            <tr>
                <th>Giá người lớn</th>
                <td><fmt:formatNumber value="${groupTour.tour.priceAdult}" type="number" groupingUsed="true" />đ</td>
            </tr>
            <tr>
                <th>Giá trẻ em từ 6 - 10 tuổi</th>
                <td><fmt:formatNumber value="${groupTour.tour.priceChild6_10}" type="number" groupingUsed="true" />đ</td>
            </tr>
            <tr>
                <th>Giá trẻ em dưới 2 - 5 tuổi</th>
                <td><fmt:formatNumber value="${groupTour.tour.priceChild2_5}" type="number" groupingUsed="true" />đ</td>
            </tr>
            <tr>
                <th>Giá em bé dưới 2 tuổi</th>
                <td><fmt:formatNumber value="${groupTour.tour.priceChild2}" type="number" groupingUsed="true" />đ</td>
            </tr>
            <tr>
                <th>Số lượng tối đa</th>
                <td>${groupTour.maxPeople}</td>
            </tr>
            <tr>
                <th>Số lượng hiện tại</th>
                <td>${groupTour.currentPeople}</td>
            </tr>
            <tr>
                <th>Trạng thái</th>
                <td>
                    <c:choose>
                        <c:when test="${groupTour.status == 'Waiting'}">
                            <span class="badge badge-warning">Đang chờ người tham gia tour (${groupTour.currentPeople}/${groupTour.maxPeople} người)</span>
                        </c:when>
                        <c:when test="${groupTour.status == 'Active'}">
                            <span class="badge badge-success">Đang diễn ra</span>
                        </c:when>
                        <c:when test="${groupTour.status == 'Cancelled'}">
                            <span class="badge badge-danger">Đã hủy</span>
                        </c:when>

                        <c:when test="${groupTour.status ==  'Finished'}">
                            <span class="badge badge-secondary">Đã kết thúc</span>
                        </c:when>
                        <c:when test="${groupTour.status ==  'In Process'}">
                            <span class="badge badge-secondary">Sẵn sàng để diễn ra</span>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>Ngày tạo</th>
                <td>${groupTour.createdAt}</td>
            </tr>
            <tr>
                <th>Ngày cập nhật</th>
                <td>${groupTour.updatedAt}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="user-bookings">
        <h3>Danh sách người dùng đã book Tour</h3>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th>Họ và tên</th>
                <th>Số người</th>
                <th>Ngày đặt</th>
                <th>Trạng thái</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="booking" items="${groupTour.bookings}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${booking.user.lastName} ${booking.user.firstName}</td>
                    <td>${booking.totalPeople}</td>
                    <td>${booking.createdAt}</td>
                    <td>${booking.status}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
