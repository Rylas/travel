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
    <div id="loadpage"></div>
    <div id="header">
        <div id="content_header">
            <div id="nav-icon">
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
            <!-- Nav bar -->
            <div id="nav-bar">
                <ul>
                    <li><a href="index.html">Home </a></li>
                    <li><a href="about.html">About </a></li>
                    <li><a href="destiantion.html">Destination </a></li>

                    <li>
                        <a>Blog
                            <i class="arrow-down ti-angle-down"></i>
                        </a>
                        <ul class="sub_nav">
                            <li><a href="/blog">Blog</a></li>
                            <li><a href="/single_blog">Single-Blog</a></li>
                        </ul>
                    </li>
                    <li><a href="/contact" style="background-color: #f1f1f1de; color: #00c961;">Contact </a>
                    </li>
<%--                    <li class="search-icon">--%>
<%--                        <div class="input">--%>
<%--                            <input type="text" placeholder="Type some text" id="search-id" autocomplete="off">--%>
<%--                        </div>--%>
<%--                        <a href="#" id="search-toggle" style="color: #fff;">--%>
<%--                            <i class="search ti-search"> </i>--%>
<%--                        </a>--%>

<%--                    </li>--%>
                </ul>
            </div>
            <div class="logo">
                <img src="/img/TRAVELWY.png" alt="" width="300" height="300">
            </div>
            <div class="nav">
                <ul>
                    <li><a href="/">Home </a></li>
                    <li><a href="/about">About </a></li>
                    <li><a href="/destiantion">Destination </a></li>

                    <li>
                        <a href="">Blog
                            <i class="arrow-down ti-angle-down"></i>
                        </a>
                        <ul class="sub_nav">
                            <li><a href="/blog">Blog</a></li>
                            <li><a href="/single_blog">Single-Blog</a></li>
                        </ul>
                    </li>
                    <li><a href="/contact">Contact</a></li> </a></li>
                </ul>
            </div>
            <%--    Kiểm tra xem người dùng có đăng nhập hay chưa để hiển thị nút đăng nhập hay là hiển thị thông tin người dùng        --%>
            <div class="contact">
                <%
                    User user = (User) session.getAttribute("user");
                    if (user != null) {
                %>
                <div class="user-info">
                    <div style="display: flex; align-items: center;">
                        <span style="margin-right: 10px;">${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                        <img src="/uploads/${sessionScope.user.avatar}" alt="Avatar" style="width: 40px; height: 40px; border-radius: 50%;" class="avatar" onclick="toggleUserMenu()">
                    </div>

                    <div id="userMenu" class="user-menu">
                        <a href="/information">Thông tin chi tiết</a>
                        <c:if test="${sessionScope.user.role == 'admin'}">
                            <a href="/admin">Trang quản trị</a>
                        </c:if>
                        <a href="/logout">Đăng xuất</a>
                    </div>
                </div>
                <%
                    } else {
                %>
                    <a class="loginBtn" href="/login">Đăng nhập</a>
                    <a class="loginBtn" href="/register">Đăng ký</a>
                <%
                    }
                %>


            </div>
            <div class="search-icon">
                <div class="input">
                    <input type="text" placeholder="Type some text" id="search-id" autocomplete="off">
                </div>
                <a href="#" id="search-toggle" style="color: #fff;">
                    <i class="search ti-search"> </i>
                </a>
                <%
                    if (user != null) {
                %>
                <a href="/cash" style="color: #fff;">
                    <i class="search ti-shopping-cart"> </i>
                </a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <div id="slider">

        <%-- List all hot tour        --%>
        <c:forEach var="tour" items="${hotTours}">
            <div class="mySlides fade">
                <img src="/uploads/tour/${tour.image}" style="width:100%;height: calc(100/3 * 2%);">
                <div class="text">${tour.name}</div>
            </div>
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
                <c:forEach var="location" items="${locations}">
                    <div class="popular-item">
                        <img src="/uploads/location/${location.image}" alt="">
                        <br>
                        <h3>${location.name}</h3>
                        <div class="detail">
                            <div class="detail-title">
                                <span>${location.name}</span>
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
                                <a href="/details/location/${location.getLocationId()}">
                                    <button class="book">
                                        More Detail
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="search-btn">
                    <button class="btn">
                        More Place
                    </button>

                </div>
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
                <c:forEach var="tour" items="${tours}">
                    <div class="popular-item">
                        <img src="/uploads/tour/${tour.image}" alt="">
                        <br>
                        <h3>${tour.name}</h3>
                        <div class="detail">
                            <div class="detail-title">
                                <span>${tour.name}</span>
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
                                <a href="/details/tour/${tour.getTourId()}">
                                    <button class="book">
                                        Book Now
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="search-btn">
                    <button class="btn">
                        More Place
                    </button>

                </div>
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

    <div id="footer">
        <div class="contact-img">
            <img src="/img/TRAVELWY.png" alt="" style="height: 300px; width: 300px;">
        </div>
        <div class="contact-item">
            <span> Khu đô thị FPT Tran Dai Nghia street, Hoa Quy ward,<br> Ngu Hanh Son district, Da Nang</span>
            <ul>
                <li><a href="#">+84123456789</a></li> <br>
                <li><a href="#">example@gmail.com</a></li><br> <br>
                <li><a href="#"> <i class="fa-brands fa-facebook-f"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-pinterest"></i></a></li>
            </ul>
        </div>
        <div class="contact-popular">
            <h3>Popular Destination</h3>
            <ul class="contact-popular-item">
<%--                Just get 8 item from location --%>
                <c:forEach begin="0" end="8" var="location" items="${locations}">
                    <li><a href="/details/location/${location.locationId}">${location.name}</a></li>
                </c:forEach>

            </ul>
        </div>
        <div class="contact-insta">
            <div class="contact-insta-item">
                <c:forEach begin="0" end="6" var="location" items="${locations}" varStatus="status">
                    <img src="/uploads/location/${location.banner}" alt="${location.name}">
                </c:forEach>

            </div>
        </div>
    </div>
</div>
<div id="loginform">
    <div class="exit">

    </div>

    <div id="login">
        <div class="headline">
            <h2>Hello!</h2>
            <p>Sign into your account</p>
        </div>
        <div class="form">
            <div class="email">
                <label for="">Email</label>
                <input type="text" placeholder="Email">
            </div>
            <div class="password">
                <label for="">Password</label>
                <input type="text" placeholder="Password">
            </div>
            <div class="forgotPassword" style="display: inline-block">
                <div class="rememberMe" style="display: inline-block">
                    <input type="radio">
                    <label for="">Remember me</label>
                </div>

                <a href="#">Forgot Password</a>
            </div>
            <button id="signin" onclick=baodeptrai()>
                Sign in
            </button>
        </div>
        <div class="social">
            <p>or</p>
            <div class="icon">
                <i class="fa-brands fa-facebook-square"></i>
                <!-- f082 -->
                <i class="fa-brands fa-google-plus-square"></i>
                <!-- f0d4 -->
                <i class="fa-brands fa-twitter-square"></i>
            </div>
        </div>
        <div class="create">
            <p>Don't have an account? <a href="#">Create</a></p>
        </div>
    </div>
    <div id="signup">

    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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
<script src="/js/loginvsload.js"></script>
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

<style>
    .user-info {
        position: relative;
        display: inline-block;
    }

    .avatar {
        cursor: pointer;
        width: 40px;
        height: 40px;
        border-radius: 50%;
    }

    .user-menu {
        display: none;
        position: absolute;
        background-color: white;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .user-menu a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .user-menu a:hover {
        background-color: #ddd;
    }
</style>
</body>

</html>
