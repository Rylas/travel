<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết về tour - ${tour.nameTour}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .tour-banner {
            width: 100%;
            height: 400px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .tour-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            margin-bottom: 20px;
            cursor: pointer;
        }
        .tour-details {
            margin-bottom: 30px;
        }
        .tour-details h2 {
            margin-bottom: 20px;
            font-size: 2.5rem;
            font-weight: bold;
        }
        .tour-details p {
            font-size: 1.1rem;
        }
        .details-list {
            font-size: 1rem;
        }
        .details-list li {
            margin-bottom: 10px;
        }
        .btn-book {
            background-color: #007bff;
            color: white;
            border-radius: 30px;
            font-size: 16px;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .btn-book:hover {
            background-color: #0056b3;
            color: white;
        }
        .card-body h5 {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .card-body p {
            font-size: 1rem;
        }
        .modal-dialog img {
            width: 100%;
        }
        .star-rating input[type="radio"] {
            display: none;
        }
        .star-rating label {
            color: #ddd;
            font-size: 1.5rem;
        }
        .star-rating input[type="radio"]:checked ~ label {
            color: #f5b301;
        }
        .star-rating input[type="radio"]:checked ~ label:hover,
        .star-rating input[type="radio"]:checked ~ label:hover ~ label {
            color: #f5b301;
        }
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #f5b301;
        }
        #imageModal{
            z-index: 999999;
        }
        .list-location {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@ include file="../material/navbar.jsp"%>

<div class="container mt-5">
    <div class="tour-details">
        <img src="/uploads/tour/${tour.banner}" alt="Tour Banner" class="tour-banner img-fluid rounded">
        <h2>${tour.nameTour}</h2>
        <p class="text-muted">Được tổ chức bởi: ${tour.enterprise.nameEnterprise}</p>
        <p>${tour.description}</p>
        <div class="row">
            <div class="col-md-4">
                <img src="/uploads/tour/${tour.firstImage}" alt="Tour Image 1" class="tour-image img-fluid rounded" data-toggle="modal" data-target="#imageModal" data-src="/uploads/tour/${tour.firstImage}">
            </div>
            <div class="col-md-4">
                <img src="/uploads/tour/${tour.secondImage}" alt="Tour Image 2" class="tour-image img-fluid rounded" data-toggle="modal" data-target="#imageModal" data-src="/uploads/tour/${tour.secondImage}">
            </div>
            <div class="col-md-4">
                <img src="/uploads/tour/${tour.thirdImage}" alt="Tour Image 3" class="tour-image img-fluid rounded" data-toggle="modal" data-target="#imageModal" data-src="/uploads/tour/${tour.thirdImage}">
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-6">
                <h4>Mô tả về Tour</h4>
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th>Giá người lớn</th>
                            <td><fmt:formatNumber value="${tour.priceAdult}" type="number" groupingUsed="true" />đ</td>
                        </tr>
                        <tr>
                            <th>Giá trẻ em từ 6 - 10 tuổi</th>
                            <td><fmt:formatNumber value="${tour.priceChild6_10}" type="number" groupingUsed="true" />đ</td>
                        </tr>
                        <tr>
                            <th>Giá trẻ em từ 2 - 5 tuổi</th>
                            <td><fmt:formatNumber value="${tour.priceChild2_5}" type="number" groupingUsed="true" />đ</td>
                        </tr>
                        <tr>
                            <th>Giá trẻ em < 2 tuổi</th>
                            <td><fmt:formatNumber value="${tour.priceChild2}" type="number" groupingUsed="true" />đ</td>
                        </tr>
                        <tr>
                            <th>Ngày khởi hành</th>
                            <td>${tour.departureDate}</td>
                        </tr>
                        <tr>
                            <th>Ngày khởi hành dự kiến</th>
                            <td>${tour.expectedDate}</td>
                        </tr>
                        <tr>
                            <th>Phương tiện di chuyển</th>
                            <td>${tour.transport}</td>
                        </tr>
                        <tr>
                            <th>Số lượng khách hàng đã đặt Tour</th>
                            <td>${tour.numberBooked}</td>
                        </tr>
                        <tr>
                            <th>Ngày tạo Tour</th>
                            <td>${tour.createdAt}</td>
                        </tr>
                        <tr>
                            <th>Lượt xem</th>
                            <td>${tour.numberViewed}</td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <div class="col-md-6">
                <h4>Các địa điểm trong Tour</h4>
                <ul class="list-group">
                    <c:forEach var="location" items="${tour.locations}">
                        <li class="list-group-item">
                            <a class="list-location" href="/details/location/${location.locationID}">${location.nameLocation}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="tour-schedule mt-4">
            <h4>Lịch trình</h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Ngày</th>
<%--                    <th>Title</th>--%>
                    <th>Mô tả</th>
                    <th>Thời gian bắt đầu dự kiến</th>
                    <th>Thời gian kết thúc dự kiến</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="schedule" items="${schedules}" varStatus="status">
                    <tr>
                        <td>Ngày ${status.index + 1}</td>
<%--                        <td>${schedule.title}</td>--%>
                        <td>${schedule.description}</td>
                        <td>${schedule.timeStart}</td>
                        <td>${schedule.timeEnd}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="tour-reviews mt-4">
            <h4>Đánh giá</h4>
            <c:forEach var="review" items="${tour.reviews}">
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Review by ${review.user.lastName} ${review.user.firstName}</h5>
                        <p class="card-text">${review.content}</p>
                        <p class="card-text"><small class="text-muted">${review.createdAt}</small></p>
                        <c:forEach var="i" begin="1" end="5">
                            <c:choose>
                                <c:when test="${i <= review.star}">
                                    <i class="fa-solid fa-star" style="color: #f5b301;"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fa-solid fa-star" style="color: #ddd;"></i>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${checkTour == true}">
                <div class="mt-4">
                    <h4>Add a Comment</h4>
                    <form action="/review/add" method="post">
                        <input type="hidden" name="tourID" value="${tour.tourID}">
                        <div class="form-group">
                            <label for="comment">Đánh giá</label>
                            <textarea class="form-control" id="comment" name="content" rows="3" required></textarea>
                        </div>
                        <div class="star-rating">
                            <input type="radio" id="star5" name="star" value="5" />
                            <label for="star5" title="5 stars"><i class="fa-solid fa-star"></i></label>
                            <input type="radio" id="star4" name="star" value="4" />
                            <label for="star4" title="4 stars"><i class="fa-solid fa-star"></i></label>
                            <input type="radio" id="star3" name="star" value="3" />
                            <label for="star3" title="3 stars"><i class="fa-solid fa-star"></i></label>
                            <input type="radio" id="star2" name="star" value="2" />
                            <label for="star2" title="2 stars"><i class="fa-solid fa-star"></i></label>
                            <input type="radio" id="star1" name="star" value="1" />
                            <label for="star1" title="1 star"><i class="fa-solid fa-star"></i></label>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3">Gửi đánh giá</button>
                    </form>
                </div>
            </c:if>
            <c:if test="${checkTour != true}">
                <div class="mt-4">
                    <h4>Thêm đánh giá của riêng bạn</h4>
                    <p>Bạn phải đặt Tour thì mới có thể thêm đánh giá. Hãy đặt tour ngay nào!</p>
                </div>
            </c:if>
        </div>
        <div class="text-center mt-4">
            <a href="/bookTour/${tour.tourID}" class="btn btn-book">Đặt Tour</a>
        </div>
    </div>
</div>

<!-- Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="imageModalLabel">Hình ảnh xem trước</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <img src="" id="imagePreview" class="img-fluid rounded">
            </div>
        </div>
    </div>
</div>
<%@ include file="../material/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $('.tour-image').on('click', function(){
            var src = $(this).data('src');
            $('#imagePreview').attr('src', src);
        });
    });
</script>
</body>
</html>
