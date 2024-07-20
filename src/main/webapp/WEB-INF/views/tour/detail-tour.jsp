<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${tour.nameTour}</title>
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/fontawesome-free-6.0.0-web/css/all.min.css">
    <link rel="stylesheet" href="/css/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css"
          integrity="sha512-6lLUdeQ5uheMFbWm3CP271l14RsX1xtx+J5x2yeIDkkiBpeVTNhTqijME7GgRKKi6hCqovwCoBTlRBEC20M8Mg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"
          integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/detail.css">
    <style>
        .list-location {
            color: #007bff;
            text-decoration: none;
        }
        .image-container{
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .contain-img{
            width: 24%;
            height: 200px;
            overflow: hidden;
        }
        a {
            text-decoration: none;
            color: rgb(24, 126, 199) !important;
        }
        .review-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
        }

        .review-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 15px;
            margin-bottom: 10px;
        }

        .review-header {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .review-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .review-info {
            margin-left: 15px;
        }

        .review-info h5 {
            margin: 0;
            color: #333;
        }

        .review-date {
            color: #666;
            font-size: 0.875rem;
        }

        .review-content p {
            margin: 0;
            color: #555;
        }

        .review-rating .fa {
            color: #ffd700;
        }

        .review-rating .fa-star {
            margin-right: 2px;
        }

        .checked {
            color: orange;
        }

    </style>
</head>

<body>
<%@include file="../material/navbar.jsp"%>

<div class="container-fluid " id="tourDetails">
    <div class="row">
        <div class="col-lg-7" id="container-left">
            <div class="contain-video">
                <iframe src="${tour.linkVideo}" title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen=""></iframe>
            </div>
            <div class="image-container">
                <div class="contain-img">
                    <img src="/uploads/tour/${tour.banner}" alt="">
                </div>
                <div class="contain-img">
                    <img src="/uploads/tour/${tour.firstImage}" alt="">
                </div>
                <div class="contain-img">
                    <img src="/uploads/tour/${tour.secondImage}" alt="">
                </div>
                <div class="contain-img">
                    <img src="/uploads/tour/${tour.thirdImage}" alt="">
                </div>
            </div>
        </div>


        <div class="col-lg-5" id="container-right">
            <div class="container-fluid">
                <h2 id="name-place">${tour.nameTour}</h2>
            </div>

            <ul class="nav nav-tabs">
                <li id="book-tour" class="nav-item active">Books tour</li>
            </ul>
            <div class="tab-content">
                <div id="home" class="container-fluid tab-pane  active">
                    <div class="rating">
                        <div class="rating-star">
                            <p id="rating-star-first">
                                    <span>
                                        <c:forEach var="i" begin="1" end="5">
                                            <c:choose>
                                                <c:when test="${i <= avgRating}">
                                                    <i class="fa-solid fa-star"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fa-regular fa-star"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </span>
                                <span>
                                    ${avgRating}/5 <b>Trong</b> ${tour.reviews.size()} <b>Đánh giá</b>
                                </span>
                            </p>
                            <p id="rating-star-snd">
                                <span><i class="fa-solid fa-eye"></i> ${tour.numberViewed}</span>
                                <span><i class="fa-solid fa-thumbs-up"></i> ${tour.reviews.size()}</span>
                                <span><i class="fa-solid fa-comment"></i> ${tour.reviews.size()}</span>
                            </p>
                        </div>
                    </div>

                    <div class="info">
                        <p class="info-item">
                            <span>Ngày khởi hành dự kiến: </span>

                            <span> <fmt:formatDate value="${tour.departureDate}" pattern="dd/MM/yyyy"/></span>
                        </p>
                        <p class="info-item">
                            <span>Loại tour: </span>

                            <span>
                                <c:choose>
                                    <c:when test="${tour.group}">Tổ chức theo đoàn (Gộp đoàn)</c:when>
                                    <c:otherwise>Khách hàng tự chọn ngày</c:otherwise>
                                </c:choose>
                            </span>
                        </p>
                        <%--                        <p class="info-item">--%>
                        <%--                            <span>Ngày khởi hành: </span>--%>
                        <%--&lt;%&ndash;                            <option value="">18/06/2022</option>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                            <option value="">19/06/2022</option>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                            <option value="">20/06/2022</option>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;                            <option value="">21/06/2022</option>&ndash;%&gt;--%>
                        <%--                            <select name="" id="">--%>
                        <%--&lt;%&ndash;                                List all day from departureDate to expectedDate &ndash;%&gt;--%>
                        <%--                                <c:forEach var="i" begin="${tour.expectedDate.time}" end="${tour.departureDate.time}">--%>
                        <%--                                    <option value="${i}"><fmt:formatDate value="${i}" pattern="dd/MM/6yyyy"/></option>--%>
                        <%--                                </c:forEach>--%>
                        <%--                            </select>--%>
                        <%--                        </p>--%>
                        <p class="info-item">
                            <span>Thời gian: </span>

                            <span> ${tour.duration} ngày ${tour.duration - 1} đêm</span>
                        </p>
                        <p class="info-item">
                            <span>Nơi xuất phát: </span>

                            <a href="/details/location/${tour.locations.stream().findFirst().get().locationID}">${tour.locations.stream().findFirst().get().nameLocation}</a>
                        </p>
                        <p class="info-item">
                            <span>Số người tối thiểu: </span>

                            <span>${tour.minPeople}</span>
                        </p>
                        <p class="info-item">
                            <span>Số người tối đa: </span>

                            <span>${tour.maxPeople}</span>
                        </p>
                        <p class="info-item">
                            <span>Số người đã đặt tour: </span>

                            <span>${tour.numberBooked}</span>
                        </p>
                    </div>

                    <div class="pay">
                        <div class="cost">
                            Giá người lớn: <p class="cost-price"> <fmt:formatNumber value="${tour.priceAdult}" type="number" groupingUsed="true" />đ</p>
                            Giá trẻ em từ 6 - 10 tuổi: <p class="cost-price"> <fmt:formatNumber value="${tour.priceChild6_10}" type="number" groupingUsed="true" />đ</p>
                            Giá trẻ em từ 2 - 5 tuổi:<p class="cost-price"> <fmt:formatNumber value="${tour.priceChild2_5}" type="number" groupingUsed="true" />đ</p>
                            Giá trẻ em dưới 2 tuổi:<p class="cost-price"> <fmt:formatNumber value="${tour.priceChild2}" type="number" groupingUsed="true" />đ</p>
                            <p class="decript">Số lượng khách đã đặt tour: <b style="color: rgb(196, 77, 59)">${tour.numberBooked}</b></p>
                        </div>

                        <div class="book-btn">
                            <p>
                                <i class="fa-solid fa-cart-plus"></i>
                                <a href="/bookTour/${tour.tourID}" class="btn btn-book">Đặt Tour</a>
                            </p>
                        </div>
                    </div>
                    <div class="social-contact">
                        <span><i class="fa-brands fa-instagram-square"></i></span>
                        <span><i class="fa-brands fa-facebook-square"></i></span>
                        <span><i class="fa-brands fa-twitter"></i></span>
                        <span><i class="fa-brands fa-linkedin"></i></span>

                    </div>
                </div>




            </div>
        </div>
    </div>
</div>
<div  class="container-fluid ">
    <h2 class="textInfo">
        Mô tả
        <i id="description-btn" class="fas fa-angle-up "></i>
    </h2>
    <div id="description-btn-include" class="container-fluid">
        <p>
            ${tour.description}
        </p>
    </div>

    <h2 class="textInfo">
        Giá tour bao gồm
        <i id="tour-include-btn" class="fas fa-angle-up "></i>
    </h2>
    <div id="tour-include" class="active container-fluid pane">
        <p>
            <i class="fa-solid fa-check"></i>
            Xe đưa đón tham quan (16, 29, 35, 45 chỗ tùy theo số lượng khách) theo chương trình.
        </p>

        <p>
            <i class="fa-solid fa-check"></i>
            Vé máy bay khứ hồi.
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Miễn phí 15kg hành lý ký gửi và 7kg hành lý xách tay.
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-wifi"></i>
            Wifi
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-person-swimming"></i>
            Bể bơi
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-sun"></i>
            Điều hòa không khí
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-bacon"></i>
            Bao gồm bữa sáng
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Khách sạn tiêu chuẩn 2 khách/phòng hoặc 3 khách/phòng
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Vé tham quan theo chương trình
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Các bữa ăn chính theo chương trình từ 100.000 - 200.000 VNĐ/người/bữa
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Bảo hiểm du lịch với mức bồi thường cao nhất 20.000.000 VNĐ/vụ
        </p>
    </div>

    <h2 class="textInfo">
        Giá tour không bao gồm
        <i id="tour-not-include-btn" class="fas fa-angle-down "></i>
    </h2>
    <div id="tour-not-include" class="container-fluid">
        <p>
            <i class="fa-solid fa-xmark"></i>
            Chi phí cá nhân: các bữa ăn ngoài chương trình, giặt ủi, chi phí hủy, nâng hạng và nâng hạng chuyến bay, hành lý quá cước, phụ thu phòng đơn, v.v.
        </p>

        <p>
            <i class="fa-solid fa-xmark"></i>
            Chi phí tham quan ngoài chương trình….
        </p>
    </div>


    <h2 class="textInfo">
        Lịch trình tham quan
        <i id="tour-schedule-btn" class="fas fa-angle-down "></i>
    </h2>
    <div id="tour-schedule" class="container-fluid">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Ngày</th>
                <th>Địa điểm</th>
                <th>Mô tả</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="schedule" items="${schedules}" varStatus="status">
                <tr>
                    <c:if test="${status.index == 0 || schedules[status.index - 1].date != schedule.date}">
                        <td rowspan="${schedules.stream().filter(s -> s.date == schedule.date).count()}">
                            Ngày ${status.index + 1}
                        </td>
                    </c:if>
                    <td>
                        <a class="list-location" href="/details/location/${schedule.location.locationID}">${schedule.location.nameLocation}</a>
                    </td>
                    <td>${schedule.description}</td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <h2 class="textInfo">
        Các địa điểm tham quan
        <i id="tour-location-btn" class="fas fa-angle-down "></i>
    </h2>
    <div id="tour-location" class="container-fluid">
        <ul class="list-group">
            <c:forEach var="location" items="${tour.locations}">
                <li class="list-group-item">
                    <a class="list-location" href="/details/location/${location.locationID}">${location.nameLocation}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <h2 class="textInfo">
        Điều kiện hủy tour

        <i id="tour-condition-cancel-btn" class="fas fa-angle-down "></i>
    </h2>
    <div id="tour-condition-cancel" class="container-fluid">
        <p>
            <i class="fa-solid fa-check"></i>
            Chuyển sang các tuyến du lịch khác trước ngày khởi hành 20 ngày: Không mất phí.


        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Nếu hủy hoặc chuyển sang các tour khác ngay sau khi đăng ký đến trước ngày khởi hành 15-19 ngày: Chi phí hủy tour: 50% tiền cọc tour.


        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Nếu hủy hoặc chuyển sang các chuyến du lịch khác từ 12-14 ngày trước ngày khởi hành: Chi phí huỷ tour: 100% tiền cọc tour.


        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Nếu hủy tour trong vòng 08-11 ngày trước ngày khởi hành: Chi phí huỷ tour: 50% giá tour.
        </p>
    </div>
</div>
<div id="menu2" class="container-fluid">
    <div class="row">
        <c:if test="${checkTour == true}">
            <form action="/review/add" method="post" class="col-8">
                <input type="hidden" name="tourID" value="${tour.tourID}">
                <h2>Thêm đánh giá</h2>
                <div class="cmt-rating mb-3">
                    <input type="radio" name="star" id="1" value="5"><label for="1"></label>
                    <input type="radio" name="star" id="2" value="4"><label for="2"></label>
                    <input type="radio" name="star" id="3" value="3"><label for="3"></label>
                    <input type="radio" name="star" id="4" value="2"><label for="4"></label>
                    <input type="radio" name="star" id="5" value="1"><label for="5"></label>


                </div>
                <textarea name="content" id="textarea1" cols="15" rows="10" placeholder="Đánh giá của bạn?"></textarea>
                <div class="btn-gr ">
                    <button class="cmt-btn-1 btn btn-danger">Hủy</button>
                    <button class="cmt-btn-2 btn btn-info ms-3">Gửi đánh giá</button>
                </div>

            </form>
        </c:if>
        <c:if test="${checkTour != true}">
            <div class="mt-4">
                <h4>Thêm đánh giá của riêng bạn</h4>
                <p>Bạn phải đặt Tour thì mới có thể thêm đánh giá. Hãy đặt tour ngay nào!</p>
            </div>
        </c:if>

    </div>

    <div class="row mt-3">
        <div class="col-12">
            <h3>Danh sách đánh giá (${reviews.size()})</h3>
            <div class="review-container">
                <c:forEach var="review" items="${reviews}">
                    <div class="review-card mb-3">
                        <div class="review-header">
                            <img src="/uploads/${review.user.avatar}" alt="User avatar" class="review-avatar">
                            <div class="review-info">
                                <h5>${review.user.firstName} ${review.user.lastName}</h5>
                                <p class="review-date">
                                    <fmt:formatDate value="${review.createdAt}" pattern="dd/MM/yyyy"/>
                                </p>
                            </div>
                        </div>
                        <div class="review-content">
                            <p>${review.content}</p>
                        </div>
                        <div class="review-rating">
                            <c:forEach var="i" begin="1" end="5">
                                <c:choose>
                                    <c:when test="${i <= review.star}">
                                        <i class="fa fa-star checked"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa fa-star"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <h1 style="text-transform: uppercase; font-size: 50px;padding-left: 40px; margin-top: 50px;">

            </h1>
        </div>
        <div class="row p-3">
            <div class="tour-sliders">
                <c:forEach var="relatedTour" items="${relatedTours}">
                    <a href="/details/tour/${relatedTour.tourID}" id="item1" class="slider-item m-3" style="max-height: 400px">
                        <img src="/uploads/tour/${relatedTour.banner}" alt="">
                        <div class="slide-item-content">
                            <h4>${relatedTour.nameTour}</h4>
                            <div class="slide-item-description">
                                <p>
                                    <span><i class="fa-solid fa-star"></i></span>
                                    <span><i class="fa-solid fa-star"></i></span>
                                    <span><i class="fa-solid fa-star"></i></span>
                                    <span><i class="fa-solid fa-star"></i></span>
                                    <span><i class="fa-solid fa-star"></i></span>
                                    <span style="color: white; margin-left: 76px;">${relatedTour.numberBooked} đánh giá</span>
                                </p>
                                <p><span>Thời gian: </span><span>${relatedTour.duration} ngày ${relatedTour.duration - 1} đêm</span></p>
                                <p><span>Số khách đã book: </span><span>${relatedTour.numberBooked}</span></p>
                                <p><span>Phương tiện: </span><span><i class="fa-solid fa-plane-departure"></i>${relatedTour.transport}</span></p>
                                <p><span>Giá: </span><span><fmt:formatNumber value="${relatedTour.priceAdult}"/>đ</span></p>

                                <p style="display: flex;">
                                    <button class="btn btn-info" style="margin-left: auto">Xem chi tiết</button>
                                </p>
                            </div>

                        </div>
                        <div class="slide-price">HOT</div>
                    </a>
                </c:forEach>

            </div>
        </div>
    </div>

    <%@include file="../material/footer.jsp"%>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"
            integrity="sha512-WNZwVebQjhSxEzwbettGuQgWxbpYdoLf7mH+25A7sfQbbxKeS5SQ9QBf97zOY4nOlwtksgDA/czSTmfj4DUEiQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
            integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
            integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
            crossorigin="anonymous"></script>
    <script type="text/javascript">
        const book_tour = document.getElementById('book-tour');
        const pk_detail = document.getElementById('pakage-detail');
        const cmt_tab = document.getElementById('comments');
        const home = document.getElementById('home');
        const menu1 = document.getElementById('menu1');
        const menu2 = document.getElementById('menu2');
        const tour_include = document.getElementById('tour-include');
        const tour_include_btn = document.getElementById('tour-include-btn');
        const tournot_include = document.getElementById('tour-not-include');
        const tournot_include_btn = document.getElementById('tour-not-include-btn');
        const tour_sche = document.getElementById('tour-schedule');
        const tour_sche_btn = document.getElementById('tour-schedule-btn');
        const tour_condi = document.getElementById('tour-condition-cancel');
        const tour_condi_btn = document.getElementById('tour-condition-cancel-btn');

        tour_include_btn.addEventListener('click', () => {
            tour_include.classList.toggle('active');
            tour_include_btn.classList.toggle('fa-angle-up');
            tour_include_btn.classList.toggle('fa-angle-down');


        })
        tournot_include_btn.addEventListener('click', () => {
            tournot_include.classList.toggle('active');
            tournot_include_btn.classList.toggle('fa-angle-up');
            tournot_include_btn.classList.toggle('fa-angle-down');


        })
        tour_sche_btn.addEventListener('click', () => {
            tour_sche.classList.toggle('active');
            tour_sche_btn.classList.toggle('fa-angle-up');
            tour_sche_btn.classList.toggle('fa-angle-down');


        })
        tour_condi_btn.addEventListener('click', () => {
            tour_condi.classList.toggle('active');
            tour_condi_btn.classList.toggle('fa-angle-up');
            tour_condi_btn.classList.toggle('fa-angle-down');


        })

        book_tour.addEventListener('click', function () {
            pk_detail.classList.remove('active');
            cmt_tab.classList.remove('active');
            book_tour.classList.add('active');
            home.classList.add('active');
            menu1.classList.remove('active');
            menu2.classList.remove('active');
        })

        pk_detail.addEventListener('click', function () {
            book_tour.classList.remove('active');
            cmt_tab.classList.remove('active');
            pk_detail.classList.add('active');
            home.classList.remove('active');
            menu1.classList.add('active');
            menu2.classList.remove('active');
        })

        cmt_tab.addEventListener('click', function () {
            pk_detail.classList.remove('active');
            cmt_tab.classList.add('active');
            book_tour.classList.remove('active');
            home.classList.remove('active');
            menu1.classList.remove('active');
            menu2.classList.add('active');
        })
    </script>

    <script type="text/javascript">
        $('.tour-sliders').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            arrows: true,
            infinite: true,
            autoplay: true,
            autoplaySpeed: 2000,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 2,
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 1,
                    }
                }

            ]
        });

    </script>
</body>

</html>
