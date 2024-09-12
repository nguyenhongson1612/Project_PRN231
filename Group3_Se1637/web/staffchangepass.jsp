<%-- 
    Document   : new
    Created on : Feb 9, 2023, 8:58:03 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" integrity="sha512-YFENbnqHbCRmJt5d+9lHimyEMt8LKSNTMLSaHjvsclnZGICeY/0KYEeiHwD1Ux4Tcao0h60tdcMv+0GljvWyHg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link href="css/bootstrap-table.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">

        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>

        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="d-flex justify-content-between w-100" style="margin: 0">
                <div class="navbar-header w-100">
                    <button type="button" class="navbar-toggle collapsed d-none" data-toggle="collapse" data-target="#sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="dashboard">VẬT LIỆU XÂY DỰNG</a>
                    <ul id ="nav-menu" class="user-menu">
                        <li class="dropdown pull-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Admin <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <c:if test="${sessionScope.account2.getRole()!=1}">
                                    <li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Hồ sơ</a></li>
                                    <li><a href="staffchangepass"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>Đổi mật khẩu</a></li>
                                        </c:if>

                                <li><a href="logout"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Đăng xuất</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </div><!-- /.container-fluid -->
        </nav>
   

        <section class="product-section bg-light pt-5 pb-5">
            <div class = "row m-0 gx-0">
                <a href = "dashboard" class = "btn" style = "width: fit-content; margin-left: 20px">
                    <i class="fa-solid fa-arrow-left"></i>
                    Trở về
                </a>
            </div>
            <div class="container">
                <h2 class = "mb-3 text-center">Đổi mật khẩu</h2>
                <p class="mb-4 text-center">	(*)Bạn nên sử dụng mật khẩu mạnh mà mình chưa sử dụng ở đâu khác</p>
                <div class="row ">
                    <div class="d-flex justify-content-center">
                        <form method="post" id="changepass-form" class="bg-white p-4 rounded-3" style = "width: 450px">
                            <label>Current Password</label>
                            <div id="old-group"class="form-group pass_show position-relative"> 
                                <button type ="button" class = "position-absolute top-0 end-0 border-0 show-btn" style="transform: translate(-50%, 20% ); background: unset">
                                    <i class="bi bi-eye-slash-fill"></i>
                                </button>
                                <input type="password" name="oldpass" required class="form-control" placeholder="Current Password">   
                                <p class="error text-danger position-absolute fw-bold"></p>
                                <p class=" error text-danger fw-bold position-absolute text-small">${requestScope.err}</p>
                            </div> 
                            <br/>
                            <label>New Password</label>
                            <div id="password-group" class="form-group pass_show position-relative""> 
                                <button type ="button" class = "position-absolute top-0 end-0 border-0 show-btn" style="transform: translate(-50%, 20% ); background: unset">
                                    <i class="bi bi-eye-slash-fill"></i>
                                </button>
                                <input type="password"  name="newpass"required class="form-control" placeholder="New Password"> 
                                <p class="error text-danger position-absolute fw-bold"></p>
                                <p class=" error text-danger fw-bold position-absolute text-small">${requestScope.err2}</p>
                            </div> 
                            <br/>
                            <label>Confirm Password</label>
                            <div id="confirm-group" class="form-group pass_show position-relative""> 
                                <button type ="button" class = "position-absolute top-0 end-0 border-0 show-btn" style="transform: translate(-50%, 20% ); background: unset">
                                    <i class="bi bi-eye-slash-fill"></i>
                                </button>
                                <input type="password"  required class="form-control" placeholder="Confirm Password"> 
                                <p class="error text-danger position-absolute fw-bold"></p>
                            </div> 
                            <br/>
                            <button
                                type="submit"
                                class="btn btn-primary text-white btn-lg fs-5 fw-bold mt-3 mb-3"
                                >
                                Thay đổi
                            </button>
                        </form>

                    </div>  
                </div>
            </div>
        </section>

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="changepass.js"></script>
    </body>
</html>

