<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Login</title>

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

<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="#">
                                <img src="resource/images/icon/logo.png" alt="CoolAdmin">
                            </a>
                            <c:if test="${message==1}">
                                <div>
                                    <h1 style="color: deeppink"> Change password success</h1>
                                </div>
                            </c:if>
                            <c:if test="${message==0}">
                                <div>
                                    <h1 style="color: red"> Change password fail</h1>
                                </div>
                            </c:if>
<%--                            <div>--%>
<%--                                <%--%>
<%--                                    String message = (String) request.getAttribute("message");--%>
<%--                                    if(message !=null){--%>
<%--                                       out.print(message);--%>
<%--                                    }--%>
<%--                                %>--%>
<%--                            </div>--%>
                        </div>
                        <div class="login-form">
                            <form action="login?action=login" method="post">
                                <div class="form-group">
                                    <label>Email Address</label>
                                    <input class="au-input au-input--full" type="text" name="userEmail" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="userPassword" placeholder="Password">
                                </div>
                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="remember">Remember Me
                                    </label>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
                            </form>
                            <div class="register-link">
                                <p>
                                    Don't you have account?
                                    <a href="register.jsp">Sign Up Here</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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