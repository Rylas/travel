<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Travel With You</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Rubik">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nothing You Could Do">
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/aboutcss.css">
    <link rel="stylesheet" href="/css/themify-icons/themify-icons.css">
    <script src="https://kit.fontawesome.com/b2ae9f645e.js" crossorigin="anonymous"></script>
</head>

<body>
<div id="main">
    <div id="loadPage">
    </div>


    <%@include file="../material/navbar.jsp" %>
    <div class="banner">
        <div class="banner-container">
            <div class="title">
                <h1>About us</h1>
                <p>Bringing you the best experience!</p>
            </div>
            <div class="img-table">
                <div class="col-1">
                    <img style="animation-delay: 1.5s;" src="/img/img1.jpg" alt="">
                </div>
                <div class="col-2">
                    <img style="animation-delay: 0.5s;" class="img2" src="/img/img2.jpg" alt="">
                    <img style="animation-delay: 0s;" src="/img/img3.jpg" alt="">
                </div>
                <div class="col-3">
                    <img style="animation-delay: 1s;" src="/img/img4.jpg" alt="">
                    <img style="animation-delay: 1.7s;" src="/img/about-img/bag-6.jpg" alt="">
                </div>
                <div class="col-4">
                    <img style="animation-delay: 1.3s;" src="/img/about-img/bag-3.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="content1">
        <div class="img-container">
            <div class="img1"></div>
            <div class="img2"></div>
            <div class="img3"></div>
            <div class="img4"></div>
            <div class="img5"></div>
        </div>
        <div class="paragraph">
            <h2>Mission</h2>
            <p>
                To innovate and develop tourism products and services of good quality to meet the diverse and
                abundant needs of domestic and international customers. Responsibility: Ensuring the values and
                benefits of customers as well as satisfying the needs of safety in the tourism service industry when
                customers use Wonder Place products. </p>
        </div>
    </div>


    <div class="out-story">
        <div class="out-story-container">
            <div class="head">
                <h2>About Traveled With You</h2>
            </div>
            <div class="paragraph">
                <p>
                    Traveled With You is for the individual traveller, for the one who tries to avoid the crowds,
                    for the one who loves exploring places without a tour-guide and without pick-up service at an
                    airport. We want to bring exciting places anywhere in the world closer to our audience. Not only
                    through our travel writing, but mostly through our travel photography, we show the world around
                    us in a real, honest and sometimes sarcastic way. We’re excited to take a new direction with our
                    travel writing and photography and hope you’ll enjoy our work.
                </p>
            </div>
            <!-- <div class="container-img">
                <img class="img1" src="../assets/img/about-img/anh-nhom.HEIC" alt="">
                <img class="img2" src="../assets/img/about-img/avt-nhom.jpg" alt="">
                <img class="img3" src="https://vkunemo.github.io/TravelWithYou/assets/img/khanhduy.png" alt="">
                <img class="img4" src="https://vkunemo.github.io/TravelWithYou/assets/img/tbao.png" alt="">
            </div> -->
            <div class="counter">
                <div>
                    <h3 id="tour-count">0</h3>
                    <p>Tour has done successfully</p>
                </div>
                <div>
                    <h3 id="month-count">0</h3>
                    <p>Monthly tour arrange</p>
                </div>
                <div>
                    <h3 id="customer-count">0</h3>
                    <p>Happy Clients</p>
                </div>
            </div>
        </div>
    </div>

    <div class="content3">
        <div class="img-container">
            <img class="img1" src="/img/khinhkhicau.jpeg" alt="">
            <img class="img2" src="/img/background.png" alt="">
            <div class="container">
                <div class="text-container">
                    <img class="img3" src="/img/khinhkhicau1.jpeg" alt="">
                    <h3>The best trips are waiting for you</h3>
                    <h1>Happiness is simple</h1>
                    <a href="/destiantion">Start now</a>
                </div>
            </div>
        </div>

    </div>

    <div class="content4">
        <div class="row">
            <div class="col">
                <div class="icon">
                    <img src="/img/1.svg" alt="">
                </div>
                <div class="text">
                    <h2>Comfortable Journey</h2>
                    <p>A wonderful serenity has taken to the possession of my entire soul.</p>
                </div>
            </div>

            <div class="col">
                <div class="icon">
                    <img src="/img/2.svg" alt="">
                </div>
                <div class="text">
                    <h2>Luxuries Hotel</h2>
                    <p>A wonderful serenity has taken to the possession of my entire soul.</p>
                </div>
            </div>

            <div class="col">
                <div class="icon">
                    <img src="/img/3.svg" alt="">
                </div>
                <div class="text">
                    <h2>Travel Guide</h2>
                    <p>A wonderful serenity has taken to the possession of my entire soul.</p>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../material/footer.jsp"%>



</div>

<script>


    function animateNumber(finalNumber, duration = 5000, startNumber = 0, callback) {
        const startTime = performance.now()
        function updateNumber(currentTime) {
            const elapsedTime = currentTime - startTime
            if (elapsedTime > duration) {
                callback(finalNumber)
            } else {
                const rate = elapsedTime / duration
                const currentNumber = Math.round(rate * finalNumber)
                callback(currentNumber)
                requestAnimationFrame(updateNumber)
            }
        }
        requestAnimationFrame(updateNumber)
    }

    document.addEventListener('DOMContentLoaded', function () {
        animateNumber(5673, 30000, 0, function (number) {
            const formattedNumber = number.toLocaleString()
            document.getElementById('tour-count').innerText = formattedNumber
        })

        animateNumber(25, 30000, 0, function (number) {
            const formattedNumber = number.toLocaleString()
            document.getElementById('month-count').innerText = formattedNumber
        })

        animateNumber(21441, 30000, 0, function (number) {
            const formattedNumber = number.toLocaleString()
            document.getElementById('customer-count').innerText = formattedNumber
        })
    })

    setTimeout(4 * 1000);
</script>
</body>

</html>
