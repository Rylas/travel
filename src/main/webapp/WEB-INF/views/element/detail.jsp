<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mable Mountains</title>
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
</head>

<body>
<%@include file="../material/navbar.jsp"%>

<div class="container-fluid " id="tourDetails">
    <div class="row">
        <div class="col-lg-7" id="container-left">
            <div class="contain-video">
                <iframe src="https://www.youtube.com/embed/Punf53Et1MM" title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen=""></iframe>
            </div>
            <div class="contain-img">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1628942417/image/c4vtfovmhmeaio7nrux0.png"
                     alt="">
            </div>
            <div class="contain-img">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1628942417/image/jbrybkui7vdejqqtvkmk.jpg"
                     alt="">
            </div>
            <div class="contain-img">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1628942418/image/jge2n1wcssnxgvqud4vp.jpg"
                     alt="">
            </div>
            <div class="contain-img">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1628942418/image/nmqqdtpktwnjo2eo2mct.jpg"
                     alt="">
            </div>
            <div class="contain-img">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1628942419/image/c5wqp6qqcmvhut42gcob.jpg"
                     alt="">
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
                            <p id="rating-star-fisrt">
                                    <span>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </span>
                                <span>
                                        4.44/5 <b>Trong</b> ${tour.reviews.size()} <b>Đánh giá</b>
                                    </span>
                            </p>
                            <p id="rating-star-snd">
                                <span><i class="fa-solid fa-eye"></i> ${tour.numberViewed}</span>
                                <span><i class="fa-solid fa-thumbs-up"></i> 421</span>
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
                            <span>Ngày khởi hành: </span>
<%--                            <option value="">18/06/2022</option>--%>
<%--                            <option value="">19/06/2022</option>--%>
<%--                            <option value="">20/06/2022</option>--%>
<%--                            <option value="">21/06/2022</option>--%>
                            <select name="" id="">
<%--                                List all day from departureDate to expectedDate --%>

                            </select>
                        </p>
                        <p class="info-item">
                            <span>Thời gian: </span>

                            <span> 2 Days one night</span>
                        </p>
                        <p class="info-item">
                            <span>Nơi xuất phát: </span>

                            <span>Da Nang</span>
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
                                <span>Book now</span>
                            </p>
                        </div>
                    </div>
<%--                    <div style="margin-top: 10px">--%>
<%--                        <p style="padding: 0 10px; font-size: 32px;margin: unset;color: var(--main-color);">Paying--%>
<%--                            online here</p>--%>
<%--                        <div class="pay">--%>
<%--                            <p id="payment">Payment now</p>--%>
<%--                            <div class="book-btn">--%>
<%--                                <p>--%>
<%--                                    <i class="fa-solid fa-cart-plus"></i>--%>
<%--                                    <span>Book now</span>--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

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
    <h2 class="textinfo">
        Tour price includes
        <i id="tour-include-btn" class="fas fa-angle-up "></i>
    </h2>
    <div id="tour-include" class="active container-fluid pane">
        <p>
            <i class="fa-solid fa-check"></i>
            Sightseeing bus (16, 29, 35, 45 seats depending on the number of guests) according to
            the program
        </p>

        <p>
            <i class="fa-solid fa-check"></i>
            Round-trip airfare Da Nang - Phu Quac
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Free 15 kg checked baggage & 7 kg hand luggage
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-wifi"></i>
            Wifi
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-person-swimming"></i>
            Poor
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-sun"></i>
            Air conditioning
        </p>
        <p class="ms-3">
            <i class="fa-solid fa-bacon"></i>
            Breakfast included
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Standard hotel 2 guests / room or 3 guests / room
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Sightseeing tickets according to the program
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Main meals according to the program from 5.5$-10$ VND
        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Travel insurance with the highest compensation 5000$/case
        </p>
    </div>

    <h2 class="textinfo">
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


    <h2 class="textinfo">
        Lịch trình tham quan
        <i id="tour-schedule-btn" class="fas fa-angle-down "></i>
    </h2>
    <div id="tour-schedule" class="container-fluid">
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


    <h2 class="textinfo">
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
            If the tour is canceled within 08-11 days before the departure date: Tour cancellation
            cost: 50% of the tour price.


        </p>
        <p>
            <i class="fa-solid fa-check"></i>
            Nếu hủy tour trong vòng 08-11 ngày trước ngày khởi hành: Chi phí huỷ tour: 50% giá tour.
        </p>
    </div>
</div>
<div id="menu2" class="container-fluid">
    <div class="row">
        <div class="col-8">
            <h2>Thêm đánh giá</h2>
            <div class="cmt-rating mb-3">
                <input type="radio" name="star" id="1"><label for="1"></label>
                <input type="radio" name="star" id="2"><label for="2"></label>
                <input type="radio" name="star" id="3"><label for="3"></label>
                <input type="radio" name="star" id="4"><label for="4"></label>
                <input type="radio" name="star" id="5"><label for="5"></label>


            </div>
            <textarea name="" id="textarea1" cols="15" rows="10" placeholder="What is your comments?"></textarea>
            <div class="btn-gr ">
                <button class="cmt-btn-1 btn btn-danger">Cancel</button>
                <button class="cmt-btn-2 btn btn-info ms-3">Send</button>

            </div>

        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <h3>Unread comments(5)</h3>
            <div class="cmt-detail mb-3">
                <div class="cmt-detail-userdate">
                    <div class="cmt-user">
                        <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" alt="">
                        <div class="ms-3 cmt-user-decript">
                            <h5>Ngoc Linh</h4>
                                <p>Good tour</p>
                        </div>
                    </div>
                    <div class="cmt-date">
                        <p>20/08/2021 20:30:19</p>
                    </div>
                </div>

                <div class="cmt-user-rating">
                    <div class="user-rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
                    <div class="user-action">
                        <p>
                            <span>Remove</span>
                            <span>|</span>
                            <span>Reply</span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="cmt-detail mb-3">
                <div class="cmt-detail-userdate">
                    <div class="cmt-user">
                        <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" alt="">
                        <div class="ms-3 cmt-user-decript">
                            <h5>Gia Bao</h4>
                                <p>I have fun</p>
                        </div>
                    </div>
                    <div class="cmt-date">
                        <p>20/06/2022 10:30:19</p>
                    </div>
                </div>

                <div class="cmt-user-rating">
                    <div class="user-rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
                    <div class="user-action">
                        <p>
                            <span>Remove</span>
                            <span>|</span>
                            <span>Reply</span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="cmt-detail mb-3">
                <div class="cmt-detail-userdate">
                    <div class="cmt-user">
                        <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" alt="">
                        <div class="ms-3 cmt-user-decript">
                            <h5>Co Thieu Hoang</h4>
                                <p>Let enjoy this moments</p>
                        </div>
                    </div>
                    <div class="cmt-date">
                        <p>12/06/2021 15:30:19</p>
                    </div>
                </div>

                <div class="cmt-user-rating">
                    <div class="user-rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
                    <div class="user-action">
                        <p>
                            <span>Remove</span>
                            <span>|</span>
                            <span>Reply</span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="cmt-detail mb-3">
                <div class="cmt-detail-userdate">
                    <div class="cmt-user">
                        <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" alt="">
                        <div class="ms-3 cmt-user-decript">
                            <h5>Khanh Duy</h4>
                                <p>Good tour</p>
                        </div>
                    </div>
                    <div class="cmt-date">
                        <p>24/04/2021 12:30:19</p>
                    </div>
                </div>

                <div class="cmt-user-rating">
                    <div class="user-rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
                    <div class="user-action">
                        <p>
                            <span>Remove</span>
                            <span>|</span>
                            <span>Reply</span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="cmt-detail mb-3">
                <div class="cmt-detail-userdate">
                    <div class="cmt-user">
                        <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" alt="">
                        <div class="ms-3 cmt-user-decript">
                            <h5>MarkZegbuck</h4>
                                <p>It so perfect </p>
                        </div>
                    </div>
                    <div class="cmt-date">
                        <p>20/08/2021 20:30:19</p>
                    </div>
                </div>

                <div class="cmt-user-rating">
                    <div class="user-rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
                    <div class="user-action">
                        <p>
                            <span>Remove</span>
                            <span>|</span>
                            <span>Reply</span>
                        </p>
                    </div>
                </div>
            </div>
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
            <div id="item1" class="slider-item m-3">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1629099390/image/w0goopi0a6dbhqi9aac3.jpg" alt="">
                <div class="slide-item-content">
                    <h3>Hang Nga Villa</h3>
                    <div class="slide-item-decript">
                        <p>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span style="color: white; margin-left: 76px;">4 customers review</span>
                        </p>
                        <p><span>Time Long: </span><span>4 days</span></p>
                        <p><span>Start place: </span><span>Ho Chi Minh city</span></p>
                        <p><span>Remaining Tours: </span><span>5</span></p>
                        <p><span>Transport: </span><span><i class="fa-solid fa-plane-departure"></i>Plain</span></p>
                        <p style="display: flex;">
                            <button class="btn btn-info" style="margin-left: auto">Details</button>
                        </p>
                    </div>

                </div>
                <div class="slide-price">200$</div>
            </div>
            <div id="item2" class="slider-item m-3">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1629099823/image/sbzk9ab3edhl6jo4tybe.jpg" alt="">
                <div class="slide-item-content">
                    <h3>Truc Lam Template</h3>
                    <div class="slide-item-decript">
                        <p>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span style="color: white; margin-left: 76px;">4 customers review</span>
                        </p>
                        <p><span>Time Long: </span><span>4 days</span></p>
                        <p><span>Start place: </span><span>Ho Chi Minh city</span></p>
                        <p><span>Remaining Tours: </span><span>5</span></p>
                        <p><span>Transport: </span><span><i class="fa-solid fa-plane-departure"></i>Plain</span></p>
                        <p style="display: flex;">
                            <button class="btn btn-info" style="margin-left: auto">Details</button>
                        </p>
                    </div>
                </div>
                <div class="slide-price">400$</div>
            </div>
            <div id="item3" class="slider-item m-3">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1628990210/image/vqnhbdkuegik6nvak7mv.jpg" alt="">
                <div class="slide-item-content">
                    <h3>Ban Co peak</h3>
                    <div class="slide-item-decript">
                        <p>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span style="color: white; margin-left: 76px;">4 customers review</span>
                        </p>
                        <p><span>Time Long: </span><span>4 days</span></p>
                        <p><span>Start place: </span><span>Ho Chi Minh city</span></p>
                        <p><span>Remaining Tours: </span><span>5</span></p>
                        <p><span>Transport: </span><span><i class="fa-solid fa-plane-departure"></i>Plain</span></p>
                        <p style="display: flex;">
                            <button class="btn btn-info" style="margin-left: auto">Details</button>
                        </p>
                    </div>

                </div>
                <div class="slide-price">500$</div>
            </div>
            <div id="item4" class="slider-item m-3">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1628942113/image/bbwusm2koecqzfzck74c.jpg" alt="">
                <div class="slide-item-content">
                    <h3>Phu Quoc island</h3>
                    <div class="slide-item-decript">
                        <p>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span style="color: white; margin-left: 76px;">4 customers review</span>
                        </p>
                        <p><span>Time Long: </span><span>4 days</span></p>
                        <p><span>Start place: </span><span>Ho Chi Minh city</span></p>
                        <p><span>Remaining Tours: </span><span>5</span></p>
                        <p><span>Transport: </span><span><i class="fa-solid fa-plane-departure"></i>Plain</span></p>
                        <p style="display: flex;">
                            <button class="btn btn-info" style="margin-left: auto">Details</button>
                        </p>
                    </div>

                </div>
                <div class="slide-price">300$</div>
            </div>
            <div id="item5" class="slider-item m-3">
                <img src="https://res.cloudinary.com/wonder-place/image/upload/v1629100234/image/xqomv3qdcxgnyoajw87y.jpg" alt="">
                <div class="slide-item-content">
                    <h3>Ha Long bay</h3>
                    <div class="slide-item-decript">
                        <p>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span style="color: white; margin-left: 76px;">4 customers review</span>
                        </p>
                        <p><span>Time Long: </span><span>4 days</span></p>
                        <p><span>Start place: </span><span>Ho Chi Minh city</span></p>
                        <p><span>Remaining Tours: </span><span>5</span></p>
                        <p><span>Transport: </span><span><i class="fa-solid fa-plane-departure"></i>Plain</span></p>
                        <p style="display: flex;">
                            <button class="btn btn-info" style="margin-left: auto">Details</button>
                        </p>
                    </div>

                </div>
                <div class="slide-price">250$</div>
            </div>
            <div id="item6" class="slider-item m-3">
                <img src="https://banahills.sunworld.vn/wp-content/uploads/2018/08/lam-mua-lam-gio-tai-viet-nam-chua-du-cau-vang-tiep-tuc-chinh-phuc-the-gioi-1206-768x432.jpg" alt="">
                <div class="slide-item-content">
                    <h3>Ba Na Hills</h3>
                    <div class="slide-item-decript">
                        <p>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span style="color: white; margin-left: 76px;">4 customers review</span>
                        </p>
                        <p><span>Time Long: </span><span>4 days</span></p>
                        <p><span>Start place: </span><span>Ho Chi Minh city</span></p>
                        <p><span>Remaining Tours: </span><span>5</span></p>
                        <p><span>Transport: </span><span><i class="fa-solid fa-plane-departure"></i>Plain</span></p>
                        <p style="display: flex;">
                            <button class="btn btn-info" style="margin-left: auto">Details</button>
                        </p>
                    </div>

                </div>
                <div class="slide-price">300$</div>
            </div>

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
