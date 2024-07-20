<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Rubik">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nothing You Could Do">
    <title>Contact</title>
    <script src="https://kit.fontawesome.com/b2ae9f645e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/contact.css">
    <link rel="stylesheet" href="/css/base.css">

    <link rel="stylesheet" href="/css/themify-icons/themify-icons.css">
</head>

<body>
<div id="main">
    <div id="loadPage"></div>
    <%@include file="../material/navbar.jsp"%>

    <div class="container">
        <div class="banner">
            <div class="text">
                <h3>Contact</h3>
            </div>
        </div>

        <div class="content1">
            <div class="map">
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.518882131364!2d108.25216885150539!3d15.97700987701297!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314211f3bb84f4db%3A0xd06b5de33a4a6157!2zxJDhuqBJIEjhu4xDIEPDlE5HIE5HSOG7hiBUSMOUTkcgVElOIFbDgCBUUlVZ4buATiBUSMOUTkcgVknhu4ZUIEjDgE4gLSDEkOG6oEkgSOG7jEMgxJDDgCBO4bq0Tkc!5e0!3m2!1sen!2s!4v1652519486761!5m2!1sen!2s"
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>

        <div class="content2">

            <div class="container">
                <div class="column">
                    <div class="data1">
                        <h1>Get in Touch</h1>
                    </div>
                    <div class="data2">
                        <div class="contact-info">
                            <div class="icon">
                                <i class="ti-home"></i>
                            </div>
                            <div class="text">
                                <h4>Khu Do Thi FPT, Da Nang</h4>
                                <p>Khu Do Thi FPT, Ngu Hanh Son, Hoa Hai Ward</p>
                            </div>
                        </div>
                        <div class="contact-info">
                            <div class="icon">
                                <i class="ti-tablet"></i>
                            </div>
                            <div class="text">
                                <h4>+8423456789</h4>
                                <p>Mon to Fri 9am to 6pm</p>
                            </div>
                        </div>

                        <div class="contact-info">
                            <div class="icon">
                                <i class="ti-email"></i>
                            </div>
                            <div class="text">
                                <h4>dunghqde180512@fpt.edu.vn</h4>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>
                    <div class="data3" style="width: 100%; margin-top: 20px;">
                        <div class="column">
                            <input type="text" placeholder="Enter your Name" name="name" required>
                            <input type="text" placeholder="Enter a valid email address" name="email" required>
                            <textarea name="message" id="" cols="50" rows="4" required
                                      placeholder="Enter your message"></textarea>
                        </div>
                    </div>

                    <div class="data4">
                        <div class="button">
                            <a href="#">Submit</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tag">
                <img src="/img/tag-removebg-preview.png" alt="">
            </div>
        </div>
    </div>
</div>
<%@include file="../material/footer.jsp"%>

</body>

</html>
