<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
    />
    <link
            rel="icon"
            href="/assets/img/kaiadmin/favicon.ico"
            type="image/x-icon"
    />

    <!-- Fonts and icons -->
    <script src="/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: { families: ["Public Sans:300,400,500,600,700"] },
            custom: {
                families: [
                    "Font Awesome 5 Solid",
                    "Font Awesome 5 Regular",
                    "Font Awesome 5 Brands",
                    "simple-line-icons",
                ],
                urls: ["/assets/css/fonts.min.css"],
            },
            active: function () {
                sessionStorage.fonts = true;
            },
        });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="/assets/css/demo.css" />
</head>
<body>
<div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar" data-background-color="dark">
        <div class="sidebar-logo">
            <!-- Logo Header -->
            <div class="logo-header" data-background-color="dark">
                <a href="index.html" class="logo">
                    <img
                            src="/assets/img/kaiadmin/logo_light.svg"
                            alt="navbar brand"
                            class="navbar-brand"
                            height="20"
                    />
                </a>
                <div class="nav-toggle">
                    <button class="btn btn-toggle toggle-sidebar">
                        <i class="gg-menu-right"></i>
                    </button>
                    <button class="btn btn-toggle sidenav-toggler">
                        <i class="gg-menu-left"></i>
                    </button>
                </div>
                <button class="topbar-toggler more">
                    <i class="gg-more-vertical-alt"></i>
                </button>
            </div>
            <!-- End Logo Header -->
        </div>
        <div class="sidebar-wrapper scrollbar scrollbar-inner">
            <div class="sidebar-content">
                <ul class="nav nav-secondary">
                    <li class="nav-item active">
                        <a
                                data-bs-toggle="collapse"
                                href="#dashboard"
                                class="collapsed"
                                aria-expanded="false"
                        >
                            <i class="fas fa-home"></i>
                            <p>Dashboard</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="dashboard">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="../demo1/index.html">
                                        <span class="sub-item">Dashboard 1</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-section">
                <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>
                        <h4 class="text-section">Components</h4>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#base">
                            <i class="fas fa-layer-group"></i>
                            <p>Booking</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="base">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/booking">
                                        <span class="sub-item">View all</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#sidebarLayouts">
                            <i class="fas fa-th-list"></i>
                            <p>Enterprise</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="sidebarLayouts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/enterprise">
                                        <span class="sub-item">View all Enterprise</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/enterprise/add">
                                        <span class="sub-item">Add new Enterprise</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#forms">
                            <i class="fas fa-pen-square"></i>
                            <p>Location</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="forms">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/location">
                                        <span class="sub-item">View all Location</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/location/add">
                                        <span class="sub-item">Add a new Location</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#tables">
                            <i class="fas fa-table"></i>
                            <p>Tour</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="tables">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/tour">
                                        <span class="sub-item">View all Tours</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/tour/add">
                                        <span class="sub-item">Add a new Tour</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#maps">
                            <i class="fas fa-map-marker-alt"></i>
                            <p>Users</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="maps">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/user">
                                        <span class="sub-item">View all Users</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/user/add">
                                        <span class="sub-item">Add a new User</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#charts">
                            <i class="far fa-chart-bar"></i>
                            <p>Charts</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/discount">
                                        <span class="sub-item">Xem danh sách Ưu đãi</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/discount/add">
                                        <span class="sub-item">Thêm một Ưu đãi mơi</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#charts">
                            <i class="far fa-chart-bar"></i>
                            <p>Mã giảm giá</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/voucher">
                                        <span class="sub-item">Xem danh sách Mã giảm giá</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/voucher/add">
                                        <span class="sub-item">Thêm Mã giảm giá mới</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#charts">
                            <i class="far fa-chart-bar"></i>
                            <p>Phương thức thanh toán</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/payment">
                                        <span class="sub-item">Các phương thức thanh toán</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/payment/add">
                                        <span class="sub-item">Thêm Phương thức thanh toán mới</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#charts">
                            <i class="far fa-chart-bar"></i>
                            <p>Vai trò</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/role">
                                        <span class="sub-item">Danh sách các vai trò</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/role/add">
                                        <span class="sub-item">Thêm Vai trò mới</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-bs-toggle="collapse" href="#talk">
                            <i class="far fa-chart-bar"></i>
                            <p>Trò chuyện</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="talk">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="/admin/role/add">
                                        <span class="sub-item">Danh sách tin nhắn</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End Sidebar -->

    <div class="main-panel">
        <div class="main-header">
            <div class="main-header-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="index.html" class="logo">
                        <img
                                src="/assets/img/kaiadmin/logo_light.svg"
                                alt="navbar brand"
                                class="navbar-brand"
                                height="20"
                        />
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                    <button class="topbar-toggler more">
                        <i class="gg-more-vertical-alt"></i>
                    </button>
                </div>
                <!-- End Logo Header -->
            </div>
            <!-- Navbar Header -->
            <nav
                    class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
            >
                <div class="container-fluid">
                    <nav
                            class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                    >
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="submit" class="btn btn-search pe-1">
                                    <i class="fa fa-search search-icon"></i>
                                </button>
                            </div>
                            <input
                                    type="text"
                                    placeholder="Search ..."
                                    class="form-control"
                            />
                        </div>
                    </nav>

                    <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                        <li
                                class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                        >
                            <a
                                    class="nav-link dropdown-toggle"
                                    data-bs-toggle="dropdown"
                                    href="#"
                                    role="button"
                                    aria-expanded="false"
                                    aria-haspopup="true"
                            >
                                <i class="fa fa-search"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-search animated fadeIn">
                                <form class="navbar-left navbar-form nav-search">
                                    <div class="input-group">
                                        <input
                                                type="text"
                                                placeholder="Search ..."
                                                class="form-control"
                                        />
                                    </div>
                                </form>
                            </ul>
                        </li>




                        <li class="nav-item topbar-user dropdown hidden-caret">
                            <a
                                    class="dropdown-toggle profile-pic"
                                    data-bs-toggle="dropdown"
                                    href="#"
                                    aria-expanded="false"
                            >
                                <div class="avatar-sm">
                                    <img
                                            src="assets/img/profile.jpg"
                                            alt="..."
                                            class="avatar-img rounded-circle"
                                    />
                                </div>
                                <span class="profile-username">
                      <span class="op-7">Hi,</span>
                      <span class="fw-bold">Hizrian</span>
                    </span>
                            </a>
                            <ul class="dropdown-menu dropdown-user animated fadeIn">
                                <div class="dropdown-user-scroll scrollbar-outer">
                                    <li>
                                        <div class="user-box">
                                            <div class="avatar-lg">
                                                <img
                                                        src="/assets/img/profile.jpg"
                                                        alt="image profile"
                                                        class="avatar-img rounded"
                                                />
                                            </div>
                                            <div class="u-text">
                                                <h4>Hizrian</h4>
                                                <p class="text-muted">hello@example.com</p>
                                                <a
                                                        href="profile.html"
                                                        class="btn btn-xs btn-secondary btn-sm"
                                                >View Profile</a
                                                >
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">My Profile</a>
                                        <a class="dropdown-item" href="#">My Balance</a>
                                        <a class="dropdown-item" href="#">Inbox</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Account Setting</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Logout</a>
                                    </li>
                                </div>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- End Navbar -->
        </div>

        <div class="container">
            <div class="container-fluid">
                <div class="row">


                    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h1 class="h2">Chat with Users</h1>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="list-group" id="userList">
                                    <c:forEach items="${chatRoomList}" var="chatRoom">
                                        <a href="#" class="list-group-item list-group-item-action user-link" data-roomid="${chatRoom.chatRoomID}"  data-userid="${chatRoom.user.userID}">
                                            <img src="/uploads/${chatRoom.user.avatar}" class="rounded-circle mr-2" alt="${chatRoom.user.firstName} ${chatRoom.user.lastName}" width="30" height="30">
                                                ${chatRoom.user.firstName} ${chatRoom.user.lastName}
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 id="chatWith">Chat with User</h5>
                                    </div>
                                    <div class="card-body chat-box" id="chatBox">
                                        <!-- Chat messages will be loaded here -->
                                    </div>
                                    <div class="card-footer">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Type a message" id="chatInput">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button" id="sendBtn"><i class="fas fa-paper-plane"></i> Send</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </div>


    </div>

</div>
<!--   Core JS Files   -->
<script src="/assets/js/core/jquery-3.7.1.min.js"></script>
<script src="/assets/js/core/popper.min.js"></script>
<script src="/assets/js/core/bootstrap.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

<!-- Chart JS -->
<script src="/assets/js/plugin/chart.js/chart.min.js"></script>

<!-- jQuery Sparkline -->
<script src="/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

<!-- Chart Circle -->
<script src="/assets/js/plugin/chart-circle/circles.min.js"></script>

<!-- Datatables -->
<script src="/assets/js/plugin/datatables/datatables.min.js"></script>

<!-- Bootstrap Notify -->
<script src="/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

<!-- jQuery Vector Maps -->
<script src="/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
<script src="/assets/js/plugin/jsvectormap/world.js"></script>

<!-- Sweet Alert -->
<script src="/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Kaiadmin JS -->
<script src="/assets/js/kaiadmin.min.js"></script>

<!-- Kaiadmin DEMO methods, don't include it in your project! -->
<script src="/assets/js/setting-demo.js"></script>
<script src="/assets/js/demo.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#177dff",
        fillColor: "rgba(23, 125, 255, 0.14)",
    });

    $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#f3545d",
        fillColor: "rgba(243, 84, 93, .14)",
    });

    $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#ffa534",
        fillColor: "rgba(255, 165, 52, .14)",
    });
</script>
<script>
    $(document).ready(function(){
        let userID;
        let token;
        <%
            if (session.getAttribute("user") != null) {
        %>
        userID = ${sessionScope.user.userID};
        <%--token = "${sessionScope.token}";--%>

        <%
            } else {
        %>
        userID = null;
        <%
            }
        %>
        let chatRoomID = null;
        let websocket = null;
        function connect(token){
            websocket = new WebSocket("ws://localhost:8080/chat/" + token + "/" + userID);

            websocket.onopen = function(message) {processOpen(message);};
            websocket.onmessage = function(message) {processMessage(message);};
            websocket.onclose = function(message) {processClose(message);};
            websocket.onerror = function(message) {processError(message);};

            function processOpen(message) {
                console.log("Server connect... \n");
            }
            function processMessage(message) {
                const data = JSON.parse(message.data);
                const timestamp = new Date(data.timestamp).toLocaleTimeString();
                if (data.sender.userID !== ${sessionScope.user.userID}) {
                    $('#chatBox').append(
                        '<div class="chat-message left"> <strong>' + data.user.name + ':</strong>' +
                        data.content +
                        '<span class="timestamp">' + timestamp + '</span></div>'
                    );
                }
                $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
            }
            function processClose(message) {
                console.log("Server disconnect... \n");
            }
            function processError(message) {
                console.log("Error... \n");
            }
        }

        function disconnect(){
            if(websocket !== null){
                websocket.close();
            }
        }

        $('.user-link').on('click', function(e){
            e.preventDefault();
            let receiverID = $(this).data('userid');
            token = $(this).data('token');
            $('#chatWith').text('Chat with ' + $(this).text());
            disconnect();
            connect(token);

            loadChat(receiverID);
        });

        $('#chatInput').on('keypress', function(e){
            if(e.which === 13){
                $('#sendBtn').click();
            }
        });

        $('#sendBtn').on('click', function(){
            var message = $('#chatInput').val();
            if(message.trim() !== ''){
                sendMessage(message, chatRoomID);
                $('#chatInput').val('');
            }
        });

        function loadChat(userId){
            fetch('/api/chat/rooms/' + userId)
                .then(response => response.json())
                .then(chatMessages => {
                    $('#chatBox').html('');
                    console.log(chatMessages);

                    chatMessages.forEach(message => {
                        const timestamp = new Date(message.timestamp).toLocaleTimeString();
                        if (message.user.userID === ${sessionScope.user.userID}) {
                            $('#chatBox').append(
                                '<div class="chat-message right"> <strong>Admin:</strong>'
                                + message.content +
                                '<span class="timestamp">' +  timestamp + '</span></div>'
                            )
                        } else {
                            $('#chatBox').append(
                                '<div class="chat-message left"><strong>' + message.user.name + ':</strong>' +
                                message.content +
                                '<span class="timestamp">' + timestamp+'</span></div>'
                            )
                        }
                    });
                    $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
                });
        }

        function sendMessage(message){
            websocket.send(message);
            const timestamp = new Date().toLocaleTimeString();
            $('#chatBox').append(
                '<div class="chat-message right"><strong>Admin:</strong>'
                + message +
                '<span class="timestamp">' + timestamp + '</span></div>'
            );
            $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
        }
    });
</script>
</body>
</html>
