<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel With You</title>

    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Rubik">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nothing You Could Do">
    <link rel="stylesheet" href="/css/des_css.css">
    <link rel="stylesheet" href="/css/base.css">

    <script src="https://kit.fontawesome.com/713e2d4828.js" crossorigin="anonymous"></script>
</head>

<body>
<div id="main">
    <div id="loadPage"></div>
    <%@include file="../material/navbar.jsp"%>
    <div id="slider">
            <span>
                <h3>
                    Tour nổi bật
                </h3>
                <span>
                    Địa điểm thú vị ở mọi nơi, phù hợp với mọi người
                </span>
            </span>
    </div>
    <div id="content">
        <div id="where-togo">
            <h3>Hãy cho tôi biết nơi bạn muốn đi?</h3>
            <input type="text" placeholder="Nơi bạn muốn đến?" style="padding-left: 10px" name="locationName">
            <input type="date" placeholder="Date" name="date">
            <select name="" id="">
                <option value="" aria-placeholder="Travel type">Travel Type</option>
                <option value="">Some option</option>
                <option value="">Another option</option>
            </select>
            <div class="search-btn">
                <button class="btn">
                    Tìm kiếm
                </button>

            </div>
        </div>
        <div id="content-area">
            <c:forEach var="tour" items="${tours}">
                <div class="content-item" style="height: 470px; min-width: 350px">
                    <img src="/uploads/tour/${tour.banner}" alt="">
                    <a href="#">Hot</a>
                    <div class="plan">
                        <div class="plan-title">
                            <span>${tour.nameTour}</span>
                        </div>
                        <div class="plan-tour">
                            <p>
                                Thời gian:
                                <span style="color: #1ec6b6; ">${tour.duration} ngày ${tour.duration - 1} đêm</span>
                            </p>
                            <p>
                                Giá:
                                <span style="color: #1ec6b6;"><fmt:formatNumber value="${tour.priceAdult}" type="number" groupingUsed="true" />đ</span>
                            </p>
                            <p>
                                Phương tiện:
                                <span style="color: #1ec6b6; margin-right: 0.5em;">${tour.transport}
                                    <i class="fa-solid fa-plane"></i></span>
                            </p>
                            <div class="book-now">
                                <button class="book">
                                    Đặt ngay
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="item-text">
                        <h3>${tour.nameTour}</h3>
                        <span class="country">${tour.numberBooked} khách hàng</span> <br>
                        <span class="star">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </span>
                        <span class="review">
                            (${tour.reviews.size()} review)
                        </span>
                        <span class="day">
                            <i class="fa-solid fa-clock"></i>
                            ${tour.duration} ngày
                        </span>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${tours.size() > 6}">
                <div class="search-btn">
                    <button class="btn" id="more-btn">
                        More Location
                    </button>
                </div>
            </c:if>

            <div class="search-btn">
                <button class="btn">
                    More Place
                </button>

            </div>
        </div>
        <div id="share-story">
            <div class="share-text">
                <h3>Chia sẻ chuyến đi của bạn</h3>
            </div>
            <div class="share-img">
                <div class="story-item">
                    <a href="https://www.instagram.com/p/CZBRQJulYar/">
                        <img src="/img/story_trip1.jpg" alt="">
                    </a>


                </div>
                <div class="story-item">
                    <a href="https://www.instagram.com/p/CWXuS2ZB5Zx/">
                        <img src="/img/story-trip2.jfif" alt="">
                    </a>
                </div>
                <div class="story-item">
                    <a href="https://www.instagram.com/p/CWNOnsXBPAY/">
                        <img src="/img/story-trip3.jfif" alt="" style="height: 100%;">
                    </a>
                </div>
                <div class="story-item">
                    <a href="https://www.instagram.com/p/CWidmaiPuYh/?utm_source=ig_web_copy_link">
                        <img src="/img/story_trip3.jpg" alt="">
                    </a>
                </div>
                <div class="story-item">
                    <a href="https://www.instagram.com/p/CWPxOSeBveh/">
                        <img src="/img/story_trip4.jfif" alt="">
                    </a>
                </div>
            </div>
        </div>


    </div>


</div>
</div>
<%@include file="../material/footer.jsp"%>

<script>
    const buts = document.querySelectorAll(".book-now button ");
    buts.forEach(but => {
            but.addEventListener("click", bookTour);
            function bookTour(event) {
                console.log(event.target);
                const template1 = ` <div class="cover-book-form">
            <div id="book-form">
                <div id="content-form">

                </div>
                <div id="input-form">

                    <form action="">
                        <div class="title-form">
                            <h3>Book Now</h3>
                        </div>
                        <div>
                        <span>Name*</span>
                        <input type="text" placeholder="Nguyen Van A" id="name-input">
                        <span id="loi-ten" class="loi"></span>
                        </div>
                        <div>
                        <span>Number phone*</span>
                        <input type="number" placeholder="Number phone" id="phone-input">
                         <span id="loi-sdt" class="loi"></span>
                         </div>
                         <div>
                        <span>Address*</span>
                        <input type="text" placeholder="Street/Village-Ward/Commune-City/District" id="address-input">
                        <span id="loi-dia-chi" class="loi"></span>
                        </div>
                        <div>
                        <span>Adult*</span>
                        <input type="number" placeholder="200$/ 1 people" id="adult-input" class="people-input">
                        <span id="loi-so-luong"> </span>
                        </div>
                        <span>Child</span>
                        <input type="number" placeholder="150$/ 1 people" id="child-input" class="people-input">
                        <span style="display:inline-block;">ToTal</span>
                        <input type="text" id="total-number" placeholder="Total" style="width:20%;display: inline-block;margin-left: 10%;">
                        <button class="confirm" type="button" onclick="return Total()" >
                            Confirm
                        </button>
                    </form>
                </div>
            </div>
        </div>`
                document.body.insertAdjacentHTML("beforeend", template1);

            }
        }
    )
    document.body.addEventListener("click", function (e) {
        if (e.target.matches(".cover-book-form")) {
            e.target.parentNode.removeChild(e.target);

        }
    });
</script>
<script>
    function Total() {
        let check = true;
        //check name
        let name = document.getElementById("name-input").value;
        if (name.length === 0) {
            document.getElementById('loi-ten').innerHTML = 'The input of name do not emty';
            document.getElementById('loi-ten').style.color = 'red';
            check = false;
        }
        //check phone number
        let phone = document.getElementById("phone-input").value;
        if (phone.length === 0) {
            document.getElementById('loi-sdt').innerHTML = 'The input of phone number do not emty';
            document.getElementById('loi-sdt').style.color = 'red';
            check = false;
        }
        var people = document.getElementsByClassName("people-input")[0].value;
        var child = document.getElementsByClassName("people-input")[1].value;
        parseInt(people);
        document.getElementById("total-number").value = people * 200 + child * 150 + 500 + "$";
    }

</script>
</body>

</html>