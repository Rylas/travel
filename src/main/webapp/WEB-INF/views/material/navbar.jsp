<%@ page import="org.example.travel.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/navbar.css">
<link rel="stylesheet" href="/css/themify-icons/themify-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Rubik">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nothing You Could Do">
<script src="https://kit.fontawesome.com/713e2d4828.js" crossorigin="anonymous"></script>

<div id="header">
    <div id="content_header">
        <div id="nav-icon">
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </div>
        <div id="nav-bar">
            <ul>
                <li><a href="/">Home </a></li>
                <li><a href="/about">About </a></li>
                <li><a href="/destiantion">Destination </a></li>

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
            </ul>
        </div>
        <div class="logo">
            <a href="/">
                <img src="/img/TRAVELWY.png" alt="" width="300" height="300">
            </a>
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
                        <c:if test="${sessionScope.user.role.roleName == 'admin'}">
                            <a href="/admin">Trang quản trị</a>
                        </c:if>
                        <a href="/mytour">Tour của tôi</a>
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