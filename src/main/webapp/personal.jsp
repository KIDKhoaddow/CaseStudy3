<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Team 2 Blog - Food Blog </title>

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
            <c:choose>
                <c:when test="${userEmail!=null}">
                    <a class="btn btn-primary btn-sm " href="login?action=logout" role="button">log out</a>
                </c:when>
                <c:when test="${userEmail==null}">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                            <div class="login" role="button">
                                <a href="login.jsp">Sign in</a>
                            </div>
                            <div class="register" role="button">
                                <a href="register.jsp">Sign up</a>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>

        </div>
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
                    <a href="ServletHome?action=home" class="yummy-logo">Team 2 Blog</a>
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
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="ServletHome?action=home">Home <span
                                        class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ServletHome?action=personal">Personal</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ServletHome?action=category">Category</a>
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
                        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i>
                            Home</a>
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
                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-new-post" role="tab"
                   aria-controls="v-pills-messages" aria-selected="false">New Post</a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
                   aria-controls="v-pills-settings" aria-selected="false">Setting Profile</a>
                <a class="nav-link" id="v-pills-reset-password-tab" data-toggle="pill" href="#v-pills-reset" role="tab"
                   aria-controls="v-pills-settings" aria-selected="false">Reset Password</a>
            </div>
            <div class="tab-content" id="v-pills-tabContent" style="width:1000em">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                     aria-labelledby="v-pills-home-tab">
                    <div class="row" style="display: flex; flex-wrap: wrap">
                        <c:forEach items="${posts}" var="element">
                            <div class="col-12 col-md-6 col-lg-4" >
                                <div class="single-post wow fadeInUp" data-wow-delay="0.1s" >
                                    <!-- Post Thumb -->
                                    <div class="post" style="width:400px;height: 300px">
                                        <a href="PersonalServlet?action=openSinglePost&id=${element.getPostId()}" >
                                            <img class="img-thumbnail" src="${element.getPostPicture()}" alt="mất ảnh rồi" style="width:400px;height: 300px">
                                        </a>
                                    </div>
                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <div class="post-meta d-flex">
                                            <div class="post-author-date-area d-flex">
                                                <!-- Post Author -->
                                                <div class="post-author">
                                                    <a href="PersonalServlet?action=openSinglePost&id=${element.getPostId()}">${userName}</a>
                                                </div>
                                                <!-- Post Date -->
                                                <div class="post-date">
                                                    <a href="PersonalServlet?action=openSinglePost&id=${element.getPostId()}">${element.getPostCreateAt()}</a>
                                                </div>
                                            </div>
                                            <!-- Post Comment & Share Area -->
                                            <div class="post-comment-share-area d-flex">
                                                <!-- Post Favourite -->
                                                <div class="post-favourite">
                                                    <a href="#"><i class="fa fa-heart-o"
                                                                   aria-hidden="true"></i>${element.getPostLikes()}
                                                    </a>
                                                </div>
                                                <!-- Post Comments -->
                                                <div class="post-comments">
                                                    <a href="#"><i class="fa fa-comment-o"
                                                                   aria-hidden="true"></i>${element.getPostComment()}
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <h4 class="post-headline">${element.getPostTitle()}</h4>
                                        <div class="table-data-feature">
                                            <button class="item" data-toggle="modal" data-placement="top"
                                                    title="Edit" type="button" style="background: green;">
                                                <a href="PersonalServlet?action=openFormEdit&id=${element.getPostId()}">
                                                    <i class="fa fa-edit" style="color: white"></i>
                                                </a>
                                            </button>
                                            <button class="item" data-toggle="modal" data-placement="top"
                                                    title="Delete" type="button" style="background: red;">
                                                <a href="PersonalServlet?action=openFormDelete&id=${element.getPostId()}">
                                                    <i class="fa fa-close" style="color: white"></i>
                                                </a>
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                        <!-- Single Post -->
                        <div class="col-12">
                            <div class="pagination-area d-sm-flex mt-15">
                                <div class="page-status">
                                    <p>${posts.size()} results</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                     aria-labelledby="v-pills-profile-tab">
                    <div class="col-md-4" style="max-width: 80%">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-user"></i>
                                <strong class="card-title pl-2">Profile Card</strong>
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-block">
                                    <img class="rounded-circle mx-auto d-block" style="height: 300px;width: 300px"
                                         src="${userAvatar}" alt="Card image cap">
                                    <h5 class="text-sm-center mt-2 mb-1">${userName}</h5>
                                    <div class="location text-sm-center">
                                        <i class="fa fa-map-marker"></i>${userAddress}
                                    </div>
                                </div>
                                <hr>
                                <div class="card-text text-sm-center">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">Name</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${userName}</p>
                                        </div>
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">Email</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${userEmail}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">Address</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${userAddress}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">Phone</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${userPhone}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">DOB</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${userDOB}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">RegisterDate</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${userRegisterDate}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-new-post" role="tabpanel"
                     aria-labelledby="v-pills-messages-tab">
                    <div class="col-12" style="max-width: 100%;">
                        <div class="card">
                            <div class="card-header">
                                <strong>Create Post Form</strong> Elements
                            </div>
                            <div class="card-body card-block">
                                <form action="PersonalServlet?action=createPost" method="get" id="formCreatPost"
                                      class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <input name="action" value="createPost" style="display: none;">
                                            <label for="title-input" class=" form-control-label">Title</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="title-input" name="title-input"
                                                   placeholder="Text"
                                                   class="form-control">
                                            <small class="form-text text-muted">This is a help text</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="content-input" class=" form-control-label">Content</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                                <textarea name="textarea-input" id="content-input" rows="9"
                                                          placeholder="Content..." class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="file-input" class=" form-control-label">Image</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="file" id="picture-input" name="file-input"
                                                   class="form-control-file" >
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="select" class=" form-control-label">Select</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <select name="select" id="select" class="form-control">
                                                <option value="0">Please select</option>
                                                <option value="1">Option #1</option>
                                                <option value="2">Option #2</option>
                                                <option value="3">Option #3</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer">
                                <button type="submit" value="submit" class="btn btn-primary btn-sm"
                                        form="formCreatPost" formaction="PersonalServlet" formmethod="get">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
                     aria-labelledby="v-pills-settings-tab">
                    <div class="col-lg-6" style="max-width: 80%;">
                        <div class="card">
                            <div class="card-header">
                                <strong>Edit Profile Form</strong>

                            </div>
                            <div class="card-body card-block">
                                <form id="EditForm"
                                      data-action="edit" enctype="multipart/form-data">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <input class="form-control" type="text" name="action" value="edit"
                                                   style="display: none">
                                            <label for="file-input" class=" form-control-label">Avatar input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="file" id="file-input" name="user-picture-input"
                                                   class="form-control-file" accept="image/*" >
                                        </div>
                                        <img src="${userAvatar}" class="rounded-circle mx-auto d-block"
                                             style="height: 300px;width: 300px;">
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">UserName</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="userName-input" name="user-name-input"
                                                   placeholder="Enter Email" class="form-control"
                                                   value="${userName}">
                                            <small class="help-block form-text">Please enter your Name</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label">Email</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static" name="user-email">${userEmail}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="address-input" class=" form-control-label">Address
                                                Input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="address-input" name="user-address-input"
                                                   placeholder="Enter Address" class="form-control"
                                                   value="${userAddress}">
                                            <small class="help-block form-text">Please enter your address</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="phone-input" class=" form-control-label">Phone Input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="" id="phone-input" name="user-phone-input"
                                                   placeholder="Enter Phone"
                                                   class="form-control" value="${userPhone}">
                                            <small class="help-block form-text">Please enter your phone</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="DOB-input" class=" form-control-label">DOB Input</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="date" id="DOB-input" name="user-DOB-input"
                                                   placeholder="Enter date of birth" class="form-control"
                                                   value="${userDOB}">
                                            <small class="help-block form-text">Please enter your DOB</small>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm" form="EditForm"
                                        formmethod="get" formaction="PersonalServlet?action=edit"
                                        formenctype="multipart/form-data" >
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm" form="EditForm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-reset" role="tabpanel"
                     aria-labelledby="v-pills-reset-password-tab">
                    <div class="col-lg-6" style="max-width: 80%;">
                        <div class="card">
                            <div class="card-header">
                                <strong>Edit Profile Form</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="PersonalServlet" method="get" class="form-horizontal" id="resetPasswordForm">
                                    <input name="action" value="resetPassword" style="display: none">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="old-password-input" class=" form-control-label">Old
                                                Password</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="password" id="old-password-input" name="old-password-input"
                                                   placeholder="Password" class="form-control">
                                            <small class="help-block form-text">Please enter a old password
                                                password</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="new-password-input" class=" form-control-label">New
                                                Password</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="password" id="new-password-input" name="new-password-input"
                                                   placeholder="Password" class="form-control">
                                            <small class="help-block form-text">Please enter a new password
                                                password</small>
                                        </div>

                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="repeat-password-input" class=" form-control-label">Repeat
                                                Password</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="password" id="repeat-password-input" name="re-password-input"
                                                   placeholder="Password" class="form-control">
                                            <small class="help-block form-text">Please enter a repeat password
                                                password</small>
                                        </div>

                                    </div>
                                </form>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm" form="resetPasswordForm">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm" form="resetPasswordForm">
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
                                    <a class="nav-link" href="ServletHome?action=home">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ServletHome?action=personal">Personal</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ServletHome?action=category">Category</a>
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
                                                                                           aria-hidden="true"></i>
                        by <a
                                href="https://colorlib.com" target="_blank">Colorlib</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- ****** Footer Menu Area End ****** -->


<%--  ***** Modal Area *******--%>
<c:if test="${requestScope['post'] != null}">
    <!-- modal edit -->
    <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog"
         aria-labelledby="largeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="form">
            <div class="card modal-content">
                <div class="card-header modal-header">
                    <div class="table-data-feature">
                        <strong>Edit Post Form</strong>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editPostForm" method="get" enctype="multipart/form-data">
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <input name="action" value="editPost" style="display: none">
                                <input name="id" value="${post.getPostId()}" style="display: none">
                                <label for="file-picture-input-edit" class=" form-control-label">Avatar input</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <input class="form-control" type="file" id="file-picture-input-edit" name="file-picture-input-edit"
                                        accept="image/*"  >
                            </div>
                            <img src="${post.getPostPicture()}" class="rounded-circle mx-auto d-block"
                                 style="height: 300px;width: 300px;">
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Author</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <p class="form-control-static">${userName}</p>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label for="post-edit" class=" form-control-label">Title
                                    Input</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <input type="text" id="post-edit" name="post-title-input-edit"
                                       placeholder="Enter title" class="form-control" value="${post.getPostTitle()}">
                                <small class="help-block form-text">Please enter your title</small>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label for="content-edit" class=" form-control-label">Title
                                    Content</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <textarea id="content-edit" name="post-content-input-edit"
                                          placeholder="Enter title" class="form-control">
                                        ${post.getPostContent()}
                                </textarea>
                                <small class="help-block form-text">Please enter your content</small>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class=" form-control-label">Create At</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <p class="form-control-static">${post.getPostCreateAt()}</p>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-footer modal-footer">
                    <button type="submit" form="editPostForm" class="btn btn-primary" formmethod="get"
                            formaction="PersonalServlet?action=editPost&id=${post.getPostId()}">
                        <i class="fa fa-dot-circle-o" style="color: white;"></i>
                        Submit
                    </button>
                    <button type="reset" form="editPostForm" class="btn btn-danger">
                            <i class="fa fa-ban" data-dismiss="modal" style="color: white;"></i>
                        Denied
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- end modal edit -->
</c:if>
<c:if test="${requestScope['post'] != null}">
    <!-- modal delete -->
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog"
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
                    <p>Are you sure to delete this post ?!</p>
                </div>
                <div class="card-footer modal-footer">
                    <a href="" role="button" class="btn btn-primary">
                        <i class="fa fa-dot-circle-o" style="color: white;"></i>
                        Confirm
                    </a>
                    <a role="button" class="btn btn-danger" data-dismiss="modal">
                        <i class="fa fa-dot-circle-o" style="color: white;"></i>
                        Denied
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- end modal delete -->
</c:if>
<%--  ***** End Modal Area *******--%>
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
<c:if test="${confirmEdit}">
    <script type="text/javascript">
        $(window).on('load', function () {
            $('#modalEdit').modal('show');
        });
    </script>
</c:if>
<c:if test="${confirmDelete}">
    <script type="text/javascript">
        $(window).on('load', function () {
            $('#modalDelete').modal('show');
        });
    </script>
</c:if>

</body>
</html>
