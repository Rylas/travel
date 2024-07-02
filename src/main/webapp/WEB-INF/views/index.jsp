<%@ page import="org.example.travel.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Travel With You</title>

    <link rel="stylesheet" href="/css/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Rubik">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nothing You Could Do">

    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/base.css">
    <script src="https://kit.fontawesome.com/713e2d4828.js" crossorigin="anonymous"></script>
    <style>
        .search-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .search-form h3 {
            margin-bottom: 20px;
        }
        .search-form input, .search-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ced4da;
        }
        .search-form .search-btn {
            text-align: center;
        }
        .search-form .btn {
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            transition: all 0.3s;
        }
        .search-form .btn:hover {
            background-color: #0056b3;
        }
    </style>

</head>

<body>
<div id="main">
    <div id="loadPage"></div>
<%--    Include navbar--%>
<%@include file="material/navbar.jsp" %>
    <div id="slider">

        <%-- List all hot tour        --%>
        <c:forEach var="tour" items="${hotTours}">
            <a href="/details/tour/${tour.tourID}" class="mySlides fade">
                <img src="/uploads/tour/${tour.banner}" style="width:100%;height: calc(100/3 * 2%);">
                <div class="text">${tour.nameTour}</div>
            </a>
        </c:forEach>
        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>


    <!-- The dots/circles -->
    <div style="text-align:center">
        <c:forEach var="tour" items="${hotTours}" varStatus="status">
            <span class="dot" onclick="currentSlide(${status.index + 1})"></span>
        </c:forEach>
    </div>

    <div id="content">
            <form action="/search" method="get" id="where-togo" style="min-width: 90%">
                <h3>Where you want to go?</h3>
                <input type="text" placeholder="Where to go? " name="keyword" style="padding-left: 10px;">
                <div class="search-btn">
                    <button class="btn" type="submit">
                        Search
                    </button>
                </div>
            </form>
        <div id="popular">
            <div class="popular-text">
                <h3 class="title">Popular Destination</h3>
                <span class="sub-title">
                        Suffered alteration in some form, by injected humour or good day randomised booth anim 8-bit
                        hella wolf moon beard
                        words.
                    </span>
            </div>

            <div class="popular-content">
                <c:forEach var="location" items="${locations}" varStatus="status">
                    <c:if test="${status.index < 6}">
                        <div class="popular-item">
                            <img src="/uploads/location/${location.banner}" alt="">
                            <br>
                            <h3>${location.nameLocation}</h3>
                            <div class="detail">
                                <div class="detail-title">
                                    <span>${location.nameLocation}</span>
                                </div>
                                <div class="detail-description">
                                    <span>${location.description}</span>
                                    <ul>
                                        <li><a href="#"> <i class="fa-brands fa-facebook-f"></i></a></li>
                                        <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                                        <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
                                        <li><a href="#"><i class="fa-brands fa-pinterest"></i></a></li>
                                    </ul>
                                </div>
                                <div class="book-now">
                                    <a href="/details/location/${location.locationID}">
                                        <button class="book">
                                            More Detail
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>

                <c:if test="${locations.size() > 6}">
                    <div class="search-btn">
                        <button class="btn" id="moreBtn">More Place</button>
                    </div>
                </c:if>
            </div>





        </div>
        <div id="popular">
            <div class="popular-text">
                <h3 class="title">Hotest Tour</h3>
                <span class="sub-title">
                        Suffered alteration in some form, by injected humour or good day randomised booth anim 8-bit
                        hella wolf moon beard
                        words.
                    </span>
            </div>
            <div class="popular-content">
                <c:forEach var="tour" items="${tours}" varStatus="status">
                    <c:if test="${status.index < 6}">
                    <div class="popular-item">
                        <img src="/uploads/tour/${tour.banner}" alt="">
                        <br>
                        <h3>${tour.nameTour}</h3>
                        <div class="detail">
                            <div class="detail-title">
                                <span>${tour.nameTour}</span>
                            </div>
                            <div class="detail-description">
                                <span>${tour.description}</span>
                                <ul>
                                    <li><a href="#"> <i class="fa-brands fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
                                    <li><a href="#"><i class="fa-brands fa-pinterest"></i></a></li>
                                </ul>
                            </div>
                            <div class="book-now">
                                <a href="/details/tour/${tour.tourID}">
                                    <button class="book">
                                        Book Now
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>

                <c:if test="${tours.size() > 6}">
                    <div class="search-btn">
                        <button class="btn">
                            More Location
                        </button>
                    </div>
                </c:if>
            </div>
        </div>
        <div id="video">
            <div class="video-content">
                <a href="#">
                    Enjoy Video <i class="fa-solid fa-play" style="font-size: 80px !important;"></i>
                </a>
            </div>
        </div>

        <div id="icon">
            <div class="icon-item">
                <img src="/img/1.svg" alt="">
                <h3>Comfortable Journey</h3>
                <span>A wonderful serenity has taken to the <br> possession of my entire soul.</span>
            </div>
            <div class="icon-item">
                <img src="/img/2.svg" alt="">
                <h3>Luxuries Hotel</h3>
                <span>A wonderful serenity has taken to the <br> possession of my entire soul.</span>
            </div>
            <div class="icon-item">
                <img src="/img/3.svg" alt="">
                <h3>Travel Guide</h3>
                <span>A wonderful serenity has taken to the <br> possession of my entire soul.</span>
            </div>
        </div>
    </div>

    <%@include file="material/footer.jsp" %>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
    let offset = 0;
    const limit = 6;

    $(document).ready(function() {
        $('#moreBtn').on('click', function() {
            offset += limit;
            $.ajax({
                url: '/locations/more',
                method: 'GET',
                data: {
                    offset: offset,
                    limit: limit
                },
                success: function(data) {
                    if (data.length > 0) {
                        data.forEach(function(location) {
                            const locationHtml = `
                                <div class="popular-item">
                                    <img src="/uploads/location/${location.banner}" alt="">
                                    <br>
                                    <h3>${location.nameLocation}</h3>
                                    <div class="detail">
                                        <div class="detail-title">
                                            <span>${location.nameLocation}</span>
                                        </div>
                                        <div class="detail-description">
                                            <span>${location.description}</span>
                                            <ul>
                                                <li><a href="#"> <i class="fa-brands fa-facebook-f"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-pinterest"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="book-now">
                                            <a href="/details/location/${location.locationID}">
                                                <button class="book">
                                                    More Detail
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>`;
                            $('.popular-content').append(locationHtml);
                        });
                    } else {
                        $('#moreBtn').hide();
                    }
                },
                error: function() {
                    alert('Failed to load more locations');
                }
            });
        });
    });
</script>
<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) { slideIndex = 1 }
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 5000);
    }
</script>
<script>
    $(document).ready(function() {
        $('#search-toggle').click(function(event) {
            event.preventDefault();
            $('.search-icon .input').toggle();
            $('#search-id').focus(); // Focus vào input khi hiển thị
        });
    });

    const video = document.querySelector(".video-content a");
    video.addEventListener("click", handleZoom);
    function handleZoom(event) {
        console.log(event.target);
        const src = event.target.getAttribute("src");
        const template = `<div class="show-video">
                <iframe width = "100%" height = "600px" src = "https://www.youtube.com/embed/Ilui-mb3sT0"
            title = "YouTube video player" frameborder = "0"
            allow = "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen >
                </iframe >
            </div >`
        document.body.insertAdjacentHTML("beforeend", template);

    }
    document.body.addEventListener("click", function (e) {
        if (e.target.matches(".show-video")) {
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
<script>
    function toggleUserMenu() {
        var menu = document.getElementById("userMenu");
        if (menu.style.display === "block") {
            menu.style.display = "none";
        } else {
            menu.style.display = "block";
        }
    }

    window.onclick = function(event) {
        if (!event.target.matches('.avatar')) {
            var menus = document.getElementsByClassName("user-menu");
            for (var i = 0; i < menus.length; i++) {
                var openMenu = menus[i];
                if (openMenu.style.display === "block") {
                    openMenu.style.display = "none";
                }
            }
        }
    }
</script>
</body>

</html>
