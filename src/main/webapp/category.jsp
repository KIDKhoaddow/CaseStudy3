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
    <title>Tables</title>

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
                        <a class="logo" href="adminView.jsp">
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
                        <li class="has-sub">
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
                                                <a href="login?action=logout">All notifications</a>
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
                                                        <a href="#">Admin</a>
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
                                <!-- DATA TABLE -->
                                <h3 class="title-5 m-b-35">User Table</h3>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-left">
                                        <div class="rs-select2--light rs-select2--md">
                                            <select class="js-select2" name="property">
                                                <option selected="selected">All Properties</option>
                                                <option value="">Acive</option>
                                                <option value="">Disable</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                        <div class="rs-select2--light rs-select2--sm">
                                            <select class="js-select2" name="time">
                                                <option selected="selected">Today</option>
                                                <option value="">3 Days</option>
                                                <option value="">1 Week</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                        <button class="au-btn-filter">
                                            <i class="zmdi zmdi-filter-list"></i>filters
                                        </button>
                                    </div>
                                    <div class="table-data__tool-right">
                                        <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>add User
                                        </button>
                                        <div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
                                            <select class="js-select2" name="type">
                                                <option selected="selected">Export</option>
                                                <option value="">Option 1</option>
                                                <option value="">Option 2</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Title</th>
                                            <th>Content</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${categoryList}" var="element">
                                            <tr class="tr-shadow">
                                                <td class="name">${element.getCategoryId()}</td>
                                                <td class="name">${element.getCategoryTitle()}</td>
                                                <td class="name">${element.getCategoryContent()}</td>
                                                <td>
                                                    <div class="table-data-feature">
                                                        <button class="item" data-toggle="modal" data-placement="top"
                                                                title="Edit" type="button" style="background: green;">
                                                            <a href="CategoryServlet?action=openFormEdit&id=${element.getCategoryId()}&title=${element.getCategoryTitle()}">
                                                                <i class="fas fa-edit" style="color: white"></i>
                                                            </a>
                                                        </button>

                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="spacer"></tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a
                                            href="https://colorlib.com">Colorlib</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--END PAGE CONTAINER -->
    </div>
    <c:if test="${requestScope['confirm'] != null}">
        <!-- modal large -->
        <div class="modal fade" id="smallModal" tabindex="-1" role="dialog"
             aria-labelledby="largeModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg" role="form">
                <div class="card modal-content">
                    <div class="card-header modal-header">
                        <div class="table-data-feature">
                            <strong>Confirm</strong>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editTitleForm" action="CategoryServlet" method="get">
                            <input type="text"  name="action"
                                   placeholder="Enter title" class="form-control" value="edit" style="display:none">

                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="title-input" class=" form-control-label">Title
                                        Input</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="title-input" name="title_input"
                                           placeholder="Enter title" class="form-control" >
                                    <small class="help-block form-text" >Please enter your title</small>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer modal-footer">
                        <button type="submit" form="editTitleForm" class="btn btn-primary" formmethod="get">
                                <i class="fa fa-dot-circle-o" style="color: white;"></i>
                           Submit
                        </button>
                        <button type="reset" form="editTitleForm" class="btn btn-danger" >
                                <i class="fa fa-ban" data-dismiss="modal" style="color: white;" ></i>
                            Denied
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end modal large -->
    </c:if>


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
    <c:if test="${confirm}">
        <script type="text/javascript">
            $(window).on('load', function () {
                $('#smallModal').modal('show');
            });
        </script>
    </c:if>
</body>

</html>
<!-- end document-->
