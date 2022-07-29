<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Yummy Blog - Food Blog Template</title>

    <!-- Favicon -->
    <link rel="icon" href="yummy-master/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="yummy-master/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="yummy-master/css/responsive/responsive.css" rel="stylesheet">
    <link href="resource/css/theme.css" rel="stylesheet" media="all">

</head>

<body>
<!-- Preloader Start -->
<div id="preloader">
    <div class="yummy-load"></div>
</div>

<!-- Background Pattern Swither -->
<div id="pattern-switcher">
    Bg Pattern
</div>
<div id="patter-close">
    <i class="fa fa-times" aria-hidden="true"></i>
</div>

<!-- ****** Top Header Area Start ****** -->
<div class="top_header_area">
    <div class="container">
        <div class="row" style="display: flex;flex-wrap: wrap">
            <div class="col-5 col-sm-6">
                <!--  Top Social bar start -->
                <div class="top_social_bar">
                </div>
            </div>
            <!--  Account-wrap -->

        </div>
    </div>
</div>
<!-- ****** Top Header Area End ****** -->

<!-- ****** Header Area Start ****** -->
<header class="header_area">
    <div class="container">
        <div class="row">
            <!-- Logo Area Start -->
            <div class="col-12">
                <div class="logo_area text-center">
                    <a href="userView.jsp" class="yummy-logo">Yummy Blog</a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-lg">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav"
                            aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="fa fa-bars" aria-hidden="true"></i> Menu
                    </button>
                    <!-- Menu Area Start -->
                    <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                        <ul class="navbar-nav" id="yummy-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="userView.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                    <a class="dropdown-item" href="userView.jsp">Home</a>
                                    <a class="dropdown-item" href="personal.jsp">Archive</a>
                                    <a class="dropdown-item" href="yummy-master/single.html">Single Blog</a>
                                    <a class="dropdown-item" href="yummy-master/static.html">Static Page</a>
                                    <a class="dropdown-item" href="yummy-master/contact.html">Contact</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Features</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Categories</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="personal.jsp">Archive</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="yummy-master/contact.html">Contact</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ****** Header Area End ****** -->

<!-- ****** Breadcumb Area Start ****** -->
<div class="breadcumb-area" style="background-image: url(yummy-master/img/bg-img/breadcumb.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="bradcumb-title text-center">
                    <h2>Archive Page</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="breadcumb-nav">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Archive Page</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- ****** Breadcumb Area End ****** -->

<!-- ****** Archive Area Start ****** -->
<section class="archive-area section_padding_80">
    <div class="container">
        <div class="row" style="flex-wrap: nowrap;">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
                   aria-controls="v-pills-home" aria-selected="true">Posts</a>
                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
                   aria-controls="v-pills-profile" aria-selected="false">Profile</a>
                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
                   aria-controls="v-pills-messages" aria-selected="false">New Post</a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
                   aria-controls="v-pills-settings" aria-selected="false">Setting Profile</a>
            </div>
            <div class="tab-content" id="v-pills-tabContent" style="width:1000em">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                     aria-labelledby="v-pills-home-tab">
                    <div class="row" style="display: flex; flex-wrap: wrap">
                        <c:forEach items="${posts}" var="element">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                                    <!-- Post Thumb -->
                                    <div class="post-thumb">
                                        <img src="yummy-master/img/blog-img/2.jpg" alt="">
                                    </div>
                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <div class="post-meta d-flex">
                                            <div class="post-author-date-area d-flex">
                                                <!-- Post Author -->
                                                <div class="post-author">
                                                    <a href="#">${element.getPostAuthor()}</a>
                                                </div>
                                                <!-- Post Date -->
                                                <div class="post-date">
                                                    <a href="#">${element.getPostCreateAt()}</a>
                                                </div>
                                            </div>
                                            <!-- Post Comment & Share Area -->
                                            <div class="post-comment-share-area d-flex">
                                                <!-- Post Favourite -->
                                                <div class="post-favourite">
                                                    <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>${element.getPostLikes()}</a>
                                                </div>
                                                <!-- Post Comments -->
                                                <div class="post-comments">
                                                    <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>${element.getPostComment()}</a>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#">
                                            <h4 class="post-headline">Where To Get The Best Sunday Roast In The
                                                Cotswolds</h4>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Single Post -->
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="single-post wow fadeInUp" data-wow-delay="0.4s">
                                <!-- Post Thumb -->
                                <div class="post-thumb">
                                    <img src="yummy-master/img/blog-img/5.jpg" alt="">
                                </div>
                                <!-- Post Content -->
                                <div class="post-content">
                                    <div class="post-meta d-flex">
                                        <div class="post-author-date-area d-flex">
                                            <!-- Post Author -->
                                            <div class="post-author">
                                                <a href="#">By Marian</a>
                                            </div>
                                            <!-- Post Date -->
                                            <div class="post-date">
                                                <a href="#">May 19, 2017</a>
                                            </div>
                                        </div>
                                        <!-- Post Comment & Share Area -->
                                        <div class="post-comment-share-area d-flex">
                                            <!-- Post Favourite -->
                                            <div class="post-favourite">
                                                <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
                                            </div>
                                            <!-- Post Comments -->
                                            <div class="post-comments">
                                                <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
                                            </div>
                                            <!-- Post Share -->
                                            <div class="post-share">
                                                <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#">
                                        <h4 class="post-headline">The 10 Best Brunch Spots In Newcastle,
                                            England</h4>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="pagination-area d-sm-flex mt-15">
                                <nav aria-label="#">
                                    <ul class="pagination">
                                        <li class="page-item active">
                                            <a class="page-link" href="#">1 <span
                                                    class="sr-only">(current)</span></a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next <i class="fa fa-angle-double-right"
                                                                                  aria-hidden="true"></i></a>
                                        </li>
                                    </ul>
                                </nav>
                                <div class="page-status">
                                    <p>Page 1 of 60 results</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                    <div class="col-md-4" style="max-width: 80%">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-user"></i>
                                <strong class="card-title pl-2">Profile Card</strong>
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-block">
                                    <img class="rounded-circle mx-auto d-block" src="resource/images/icon/avatar-01.jpg" alt="Card image cap">
                                    <h5 class="text-sm-center mt-2 mb-1">Steven Lee</h5>
                                    <div class="location text-sm-center">
                                        <i class="fa fa-map-marker"></i> California, United States</div>
                                </div>
                                <hr>
                                <div class="card-text text-sm-center">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">Static</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">Username</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab"
                    >
                    <div class="col-12" style="max-width: 100%;">
                        <div class="card">
                            <div class="card-header">
                                <strong>Basic Form</strong> Elements
                            </div>
                            <div class="card-body card-block">
                                <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="title-input" class=" form-control-label">Titile</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="title-input" name="text-input" placeholder="Text" class="form-control">
                                            <small class="form-text text-muted">This is a help text</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="content-input" class=" form-control-label">Content</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <textarea name="textarea-input" id="content-input" rows="9" placeholder="Content..." class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="file-input" class=" form-control-label">Image</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="file" id="picture-input" name="file-input" class="form-control-file">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                    <div class="col-lg-6" style="max-width: 80%;">
                        <div class="card" >
                            <div class="card-header">
                                <strong>Edit Profile Form</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">UserName</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">Username</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="email-input" class=" form-control-label">Email Input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="email" id="email-input" name="email-input" placeholder="Enter Email" class="form-control">
                                            <small class="help-block form-text">Please enter your email</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="password-input" class=" form-control-label">Password</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="password" id="password-input" name="password-input" placeholder="Password" class="form-control">
                                            <small class="help-block form-text">Please enter a complex password</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="address-input" class=" form-control-label">Address Input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="address-input" name="address-input" placeholder="Enter Address" class="form-control">
                                            <small class="help-block form-text">Please enter your address</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="phone-input" class=" form-control-label">Phone Input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="" id="phone-input" name="phone-input" placeholder="Enter Phone" class="form-control">
                                            <small class="help-block form-text">Please enter your phone</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="DOB-input" class=" form-control-label">DOB Input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="date" id="DOB-input" name="DOB-input" placeholder="Enter date of birth" class="form-control">
                                            <small class="help-block form-text">Please enter your DOB</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="file-input" class=" form-control-label">Avatar input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="file" id="file-input" name="file-input" class="form-control-file">
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</section>
<!-- ****** Archive Area End ****** -->

<!-- ****** Footer Menu Area Start ****** -->
<footer class="footer_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="footer-content">
                    <!-- Logo Area Start -->
                    <div class="footer-logo-area text-center">
                        <a href="userView.jsp" class="yummy-logo">Yummy Blog</a>
                    </div>
                    <!-- Menu Area Start -->
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#yummyfood-footer-nav" aria-controls="yummyfood-footer-nav"
                                aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"
                                                                                        aria-hidden="true"></i> Menu
                        </button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-footer-nav">
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Features</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Categories</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Archive</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Contact</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Copywrite Text -->
                <div class="copy_right_text text-center">
                    <p>Copyright @2018 All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                                           aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank">Colorlib</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- ****** Footer Menu Area End ****** -->

<!-- Jquery-2.2.4 js -->
<script src="yummy-master/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="yummy-master/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="resource/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- All Plugins JS -->
<script src="yummy-master/js/others/plugins.js"></script>
<!-- Active JS -->
<script src="yummy-master/js/active.js"></script>
</body>
