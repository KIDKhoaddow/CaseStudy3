<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="resource/css/font-face.css" rel="stylesheet" media="all">
    <link href="resource/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="resource/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="resource/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="resource/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="resource/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="resource/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="resource/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="resource/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="resource/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="resource/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="resource/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="resource/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition" data-animsition-in-duration="100" data-animsition-out-duration="100">
<div class="page-wrapper">
    <!-- HEADER MOBILE-->
    <header class="header-mobile d-block d-lg-none">
        <div class="header-mobile__bar">
            <div class="container-fluid">
                <div class="header-mobile-inner">
                    <a class="logo" href="resource/index.html">
                        <img src="resource/images/icon/logo.png" alt="CoolAdmin"/>
                    </a>
                    <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                    </button>
                </div>
            </div>
        </div>
        <nav class="navbar-mobile">
            <div class="container-fluid">
                <ul class="navbar-mobile__list list-unstyled">
                    <li class="active has-sub">
                        <a class="js-arrow" href="AdminViewServlet?action=dashboard">
                            <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="AdminViewServlet?action=users">
                            <i class="fas fa-user"></i>User</a>
                    </li>
                    <li>
                        <a href="AdminViewServlet?action=category">
                            <i class="fas fa-list"></i>Category</a>
                    </li>
                    <li>
                        <a href="AdminViewServlet?action=posts">
                            <i class="far fa-file"></i>Blog</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- END HEADER MOBILE-->

    <!-- MENU SIDEBAR-->
    <aside class="menu-sidebar d-none d-lg-block">
        <div class="logo">
            <a href="#">
                <img src="resource/images/icon/logo.png" alt="Cool Admin"/>
            </a>
        </div>
        <div class="menu-sidebar__content js-scrollbar1">
            <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">
                    <li class="active has-sub">
                        <a class="js-arrow" href="AdminViewServlet?action=dashboard">
                            <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="AdminViewServlet?action=users">
                            <i class="fas fa-user"></i>User</a>
                    </li>
                    <li>
                        <a href="AdminViewServlet?action=category">
                            <i class="fas fa-list"></i>Category</a>
                    </li>
                    <li>
                        <a href="AdminViewServlet?action=posts">
                            <i class="far fa-file"></i>Blog</a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <!-- END MENU SIDEBAR-->

    <!-- PAGE CONTAINER-->
    <div class="page-container">
        <!-- HEADER DESKTOP-->
        <header class="header-desktop">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap">
                        <form class="form-header" action="" method="POST">
                        </form>
                        <div class="header-button">
                            <div class="noti-wrap">
                                <div class="noti__item js-item-menu">
                                    <i class="zmdi zmdi-notifications"></i>
                                    <span class="quantity">3</span>
                                    <div class="notifi-dropdown js-dropdown">
                                        <div class="notifi__item">
                                            <div class="bg-c3 img-cir img-40">
                                                <i class="zmdi zmdi-file-text"></i>
                                            </div>
                                            <div class="content">
                                                <p>You got a new post need to confirem</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__footer">
                                            <a href="#">All notifications</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="account-wrap">
                                <div class="account-item clearfix js-item-menu">
                                    <div class="image">
                                        <img src="resource/images/icon/avatar-01.jpg" alt="John Doe"/>
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn" href="#">Admin</a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="resource/images/icon/avatar-01.jpg" alt="Admin"/>
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="AdminViewServlet?action=dashboard">Admin</a>
                                                </h5>

                                            </div>
                                        </div>
                                        <div class="account-dropdown__footer">
                                            <a href="login?action=logout">
                                                <i class="zmdi zmdi-power"></i>Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- HEADER DESKTOP-->

        <!-- MAIN CONTENT-->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="overview-wrap">
                            </div>
                        </div>
                    </div>
                    <div class="row m-t-25">
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c1">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-account-o"></i>
                                        </div>
                                        <div class="text">
                                            <h2>${memberOnline}</h2>
                                            <span>members online</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart1"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c2">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-blogger"></i>
                                        </div>
                                        <div class="text">
                                            <h2>${numberPost}</h2>
                                            <span>posts</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart2"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c3">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-calendar-note"></i>
                                        </div>
                                        <div class="text">
                                            <h2>${postsThisYear}</h2>
                                            <span>This Year</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart3"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c4">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-account-circle"></i>
                                        </div>
                                        <div class="text">
                                            <h2>${numberUser}</h2>
                                            <span>number user</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart4"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-9">
                            <h2 class="title-1 m-b-25">Posts with lots of likes</h2>
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Author</th>
                                        <th>Create at</th>
                                        <th>Likes</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${postLikeList}" var="element">

                                            <tr>
                                                <th class="text-center">${element.get(0)}</th>
                                                <th class="text-left">${element.get(1)}</th>
                                                <th class="text-left">${element.get(2)}</th>
                                                <th class="text-left">${element.get(3)}</th>
                                                <th class="text-center">${element.get(4)}</th>
                                                <th class="text-center">${element.get(5)}</th>
                                            </tr>


                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <h2 class="title-1 m-b-25">Top Ten Author </h2>
                            <div class="au-card au-card--bg-blue au-card-top-countries m-b-40">
                                <div class="au-card-infner">
                                    <div class="table-responsive">
                                        <table class="table table-top-countries">
                                            <tbody>
                                            <c:forEach items="${topTenAuthor}" var="element" >
                                                <tr>
                                                    <td>${element.get(0)}</td>
                                                    <td>${element.get(1)}</td>
                                                    <td>${element.get(2)}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->
        <!-- END PAGE CONTAINER-->
    </div>

</div>

<!-- Jquery JS-->
<script src="resource/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="resource/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="resource/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="resource/vendor/slick/slick.min.js">
</script>
<script src="resource/vendor/wow/wow.min.js"></script>
<script src="resource/vendor/animsition/animsition.min.js"></script>
<script src="resource/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
</script>
<script src="resource/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="resource/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="resource/vendor/circle-progress/circle-progress.min.js"></script>
<script src="resource/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="resource/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="resource/vendor/select2/select2.min.js">
</script>

<!-- Main JS-->
<script src="resource/js/main.js"></script>

</body>

</html>
<!-- end document-->
