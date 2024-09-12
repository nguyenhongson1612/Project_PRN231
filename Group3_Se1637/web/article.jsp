<%-- 
    Document   : viewcategory
    Created on : Feb 9, 2023, 9:17:59 PM
    Author     : Anh Quan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="../article.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
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
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <section
            id="mobile-header"
            class="d-block d-lg-none bg-white p-2 ps-4 pe-4 position-fixed w-100"
            >
            <div class="row justify-content-between align-items-center">
                <i id="mobile-bar" class="fa-solid fa-bars w-auto"></i>
                <img
                    src="http://vatlieuxaydung.vietcorp.top/files/adv/adv_logo-main-color2_54.png"
                    alt=""
                    />
            </div>
        </section>
        <section id="header" class="pt-2 pb-2 d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <ul
                        class="headline-list d-flex align-items-center justify-content-center"
                        >
                        <p class="headline-item text-white ps-3 pe-3 text-center">
                            Hotline : 0123 456 789
                        </p>

                        <p  class="headline-item text-white ps-3 pe-3 text-center">
                            <a href="../article/huong-dan-dat-coc-17" class="text-decoration-none text-white"> Hướng dẫn đặt cọc </a>
                        </p>
                        <p class="headline-item text-white ps-3 pe-3 text-center">
                            <a href="../article/huong-dan-lien-he-16" class="text-decoration-none text-white"> Liên hệ </a>
                        </p>

                    </ul>
                </div>
            </div>
        </section>
        <section id="banner" class="mt-5 mt-lg-0 pt-3 pb-3 bg-light">
            <div class="container">
                <div class="row align-items-center">
                    <div class="logo d-none d-lg-block col-md-3">
                        <a href="../home">
                            <img
                                class="w-100"
                                src="http://vatlieuxaydung.vietcorp.top/files/adv/adv_logo-main-color2_54.png"
                                alt="logo"
                                />
                        </a>
                    </div>
                    <form action="../search" method="post" class="search-box col-12 col-md-6 position-relative mb-5 mb-md-0">
                        <input
                            type="text"
                            name="search"
                            class="search-input w-100 border-0 rounded-2"
                            placeholder="Nhập từ khóa tìm kiếm..."
                            />
                        <button
                            type="submit"
                            class="search-btn position-absolute border-0"
                            ></button>
                    </form>
                    <div class="d-none d-lg-block col-3 d-lg-flex justify-content-end align-items-center">
                        <c:if test="${sessionScope.account.getStatics() == 1}">
                            <p class = "m-0 me-3">Hello ${sessionScope.account.getName()}</p>
                            <div id = "user-dropdown" class="btn-group border mb-3 border-2 rounded-3">
                                <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa-solid fa-user"></i>
                                </button>
                                <ul  class="dropdown-menu w-auto top-0" >
                                    <li ><a class="dropdown-item" href="../information">Thông tin tài khoản</a></li>
                                    <li ><a class="dropdown-item" href="../changepass">Đổi mật khẩu</a></li>
                                    <li ><a class="dropdown-item" href="#">Lịch sử đặt cọc</a></li>
                                    <li ><a class="dropdown-item" href="../logout">Đăng Xuất</a></li>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <button class="login  px-2 me-4 rounded-2 me-2">
                                <a href="../login" class="text-white text-decoration-none"
                                   >Đăng nhập</a
                                >
                            </button>
                            <button class="login px-2 rounded-2">
                                <a href="../signup" class="text-white text-decoration-none"
                                   >Đăng ký</a
                                >
                            </button>

                        </c:if>


                    </div>
                </div>
            </div>
        </section>
        <section id="main-menu" class="d-none d-lg-block">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <div class="row w-100" id="navbarSupportedContent">
                        <ul
                            class="navbar-nav w-100 me-auto mb-2 mb-lg-0 d-flex justify-content-center"
                            >
                            <li class="nav-item dropdown me-4 ms-4 category">
                                <a
                                    class="nav-link dropdown-toggle text-white"
                                    href="#"
                                    id="navbarDropdown"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    <i class="fa-solid fa-bars me-2"></i>
                                    DANH MỤC SẢN PHẨM
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:forEach items="${requestScope.products}" var="entry">
                                        <li>


                                            <a
                                                class="dropdown-item p-2 d-flex justify-content-between align-items-center"
                                                href="../viewcategory/${entry.key.getPattern()}"
                                                >
                                                <c:set var = "string" value = "${fn:toUpperCase(entry.key.getName())}" />
                                                <p>${string}</p>
                                                <i class="fa fa-chevron-right"></i>
                                            </a>
                                            <c:if test="${entry.value.size()>0}">
                                                <ul class="dropdown-menu dropdown-submenu pt-2 pb-2">
                                                    <c:forEach items="${entry.value}" var="i">
                                                        <c:if test="${ i.getStt()!=3}">
                                                            <li>
                                                                <a class="dropdown-item" href="../productdetail/${i.getParttern()}">${i.getName()}</a>
                                                            </li>  
                                                        </c:if>
                                                    </c:forEach>


                                                </ul>
                                            </c:if>



                                        </li>
                                    </c:forEach>

                                </ul>
                            </li>
                            <li class="nav-item me-4 ms-4">
                                <a class="nav-link text-white" aria-current="page" href="../home"
                                   >TRANG CHỦ</a
                                >
                            </li>

                            <c:forEach items="${requestScope.products}" var="entry">
                                <c:set var = "string" value = "${fn:toUpperCase(entry.key.getName())}" />
                                <c:if test="${entry.key.getSpecial()==1}">
                                    <li class="nav-item me-4 ms-4">
                                        <a class="nav-link text-white" href="../viewcategory/${entry.key.getPattern()}">${string}</a>
                                    </li>
                                </c:if>


                            </c:forEach>


                            <c:forEach items="${requestScope.lg}" var="i">
                                <c:set var = "string" value = "${fn:toUpperCase(i.getGroupname())}" />
                                <c:if test="${i.getSpecial()==1}">
                                    <li class="nav-item me-4 ms-4">

                                        <a class="nav-link text-white" href="../groupnews/${i.getPattern()}">${string}</a>
                                    </li>  
                                </c:if>

                            </c:forEach>
                            <li class="nav-item dropdown me-4 ms-4">
                                <a
                                    class="nav-link  text-white"
                                    href="../news"
                                    id="navbarDropdown"
                                    role="button"
                                    aria-expanded="false"
                                    >
                                    TIN TỨC
                                </a>

                            </li>
                            <li class="nav-item pe-2 ps-2">
                                <a class="nav-link text-white" href="../article/huong-dan-lien-he-16">LIÊN HỆ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
        <div id ="article" class = "container pt-5">
            <div class = "row">
                <div class = "col-12 col-lg-8 article-content">
                    <h1 class="newsFeature__header-title mt-20 mb-5 text-center fs-3">${requestScope.n.getTitle()}</h1>
                    <p class="mt-20 fw-bold fst-italic">${requestScope.n.getSortdesc()}</p>
                    <br/>
                    <div class="d-flex justify-content-center align-items-center avt-container">
                        <img  src="../image/news_avata/${requestScope.n.getAvata()}"/>
                    </div>
                    <div class="d-flex flex-wrap mt-5 text-content">${requestScope.content}</div>
                </div>

                <div class = "col-12 col-lg-4 ps-auto ps-lg-5">
                    <h5 class = "ps-3 mb-3">
                        <i class = "fa-solid fa-bars me-2"></i>
                        Liên quan</h5>
                    <ul class="d-flex flex-column list-unstyled article-list ps-0 ps-lg-3">
                        <c:forEach items="${requestScope.listn}" var="i">
                            <c:if test="${requestScope.n.getNid() != i.getNid() && i.getStt()==1}">
                                <li class = "mb-2">
                                    <a href="../article/${i.getPattern()}" class = "d-flex">
                                        <div class = "article-list__img">
                                            <img class ="w-100" src="../image/news_avata/${i.getAvata()}" alt ="gach op"/>
                                        </div>
                                        <p class = "ms-3">${i.getTitle()}</p>
                                    </a>
                                    <hr/>
                                </li> 
                            </c:if>

                        </c:forEach>

                    </ul>
                </div>
            </div>

        </div> 

        <footer id="footer" class="bg-light pt-5 pb-5">
            <div class="container">
                <div class="footer-top">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-4 mb-3 mb-lg-0">
                            <div class="d-flex align-items-center">
                                <div class="icon">
                                    <img
                                        src="http://vatlieuxaydung.vietcorp.top/images/icon2.png"
                                        alt=""
                                        />
                                </div>
                                <div class="d-flex flex-column">
                                    <a class="text-decoration-none" href="tel:0123456789">
                                        <h5>0123456789</h5>
                                    </a>

                                    <p>Đặt hàng nhanh 24/7</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4 mb-3 mb-lg-0">
                            <div class="d-flex align-items-center">
                                <div class="icon">
                                    <img
                                        src="http://vatlieuxaydung.vietcorp.top/images/icon3.png"
                                        alt=""
                                        />
                                </div>
                                <div class="d-flex flex-column">
                                    <a class="text-decoration-none" href="mailto:group3@gmail.com">
                                        <h5>Vietcorp.Top@gmail.com</h5>
                                    </a>

                                    <p>Hỗ trợ đặt hàng, giải quyết đơn hàng</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4 mb-3 mb-lg-0">
                            <div class="d-flex align-items-center">
                                <div class="icon">
                                    <img
                                        src="http://vatlieuxaydung.vietcorp.top/images/icon4.png"
                                        alt=""
                                        />
                                </div>
                                <div class="d-flex flex-column">
                                    <h5>Thứ 2 - CN | 6:00 - 22:00</h5>
                                    <p>Mở cửa tất cả các ngày trong tuần</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="footer-body pt-5 pb-5">
                    <div class="row">
                        <div class="col-12 col-md-4">
                            <div>
                                <img
                                    class="w-100"
                                    src="http://vatlieuxaydung.vietcorp.top/files/adv/adv_logo-main-color2_54.png"
                                    alt=""
                                    />
                            </div>
                            <h5 class="mb-3">WEBSITE BÁN VẬT LIỆU XÂY DỰNG UY TÍN, CHẤT LƯỢNG</h5>
                            <p>Địa chỉ: 414 Nguyễn Văn Cừ, Long Biên, Hà Nội</p>
                            <a class="text-decoration-none text-dark" href="tel:0123456789">ĐT: 0123 456 789</a>
                            <br/>
                            <a class="text-decoration-none text-dark" href="mailto:group3@gmail.com">Email: group3@gmail.com</a>
                            <p class="fw-bold">Contact info:</p>
                            <p>
                                <i class="fa fa-map-marker-alt"></i>
                                Shop 1: 414 Nguyễn Văn Cừ, Long Biên, Hà Nội
                            </p>
                            <ul class="social-list text-black-50 list-unstyled d-flex mt-3">
                                <li class="me-2">
                                    <a href="https://www.facebook.com/">
                                        <i class="fa-brands fa-facebook-f"></i>
                                    </a>
                                </li>
                                <li class="me-2">
                                    <a href="https://www.instagram.com/">
                                        <i class="fa-brands fa-instagram"></i>
                                    </a>
                                </li>
                                <li class="me-2">
                                    <a href="https://www.twitter.com/">
                                        <i class="fa-brands fa-twitter"></i>
                                    </a>
                                </li>
                                <li class="me-2">
                                    <a href="https://www.youtube.com/">
                                        <i class="fa-brands fa-youtube"></i>
                                    </a>
                                </li>
                                <li class="me-2">
                                    <a href="https://www.google.com/">
                                        <i class="fa-brands fa-google"></i>
                                    </a>
                                </li>
                                <li class="me-2">
                                    <a href="https://www.linkedin.com/">
                                        <i class="fa-brands fa-linkedin"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="d-none d-lg-block col-md-2">
                            <h5 class="mb-3">Trợ giúp</h5>
                            <ul class="d-flex flex-column list-unstyled">
                                <a class="text-decoration-none text-dark" href="../article/huong-dan-dat-coc-17">
                                    <li class="d-flex align-items-start mb-2">
                                        <i class="fa fa-chevron-right"></i>
                                        <p>Hướng dẫn đặt cọc</p>
                                    </li>
                                </a>
                                <a class="text-decoration-none text-dark" href="../article/huong-dan-lien-he-16">
                                    <li class="d-flex align-items-start mb-2">
                                        <i class="fa fa-chevron-right"></i>
                                        <p>Liên hệ</p>
                                    </li>
                                </a>


                            </ul>
                        </div>   
                        <div class="d-none d-lg-block col-md-4">
                            <h5 class="mb-3">Danh mục sản phẩm</h5>
                            <ul class="d-flex flex-column list-unstyled">

                                <c:forEach items="${requestScope.products}" var="i">
                                    <a class="text-decoration-none text-dark" href="../viewcategory/${i.key.getPattern()}">
                                        <li class="d-flex align-items-start mb-2">

                                            <i class="fa fa-chevron-right"></i>
                                            <p>${i.key.getName()}</p> 


                                        </li>
                                    </a>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                </div>
                <hr />
                <div class="footer-bottom mt-5">
                    <div class="d-flex justify-content-center">
                        <img
                            class="w-100"
                            src="http://vatlieuxaydung.vietcorp.top/images/payment.jpg"
                            alt=""
                            />
                    </div>
                    <div class="d-flex justify-content-center mt-4 mb-4">
                        <img
                            src="http://vatlieuxaydung.vietcorp.top/images/bo-cong-thuong.png"
                            alt=""
                            />
                    </div>
                    <p class="text-black-50 text-center">
                        Copyright @ 2023 <span class="text-dark">Group3.com</span> All
                        rights reserved
                    </p>
                </div>
            </div>
        </footer>
        <h5 class="phone-number position-fixed p-1 pe-3 ps-3 fw-bold">
            <a class="text-decoration-none text-white" href="tel:0123456789">
                Call: 0123 456 789 
            </a>

        </h5>
        <h5 class="phone-number download-link position-fixed p-1 pe-3 ps-3 fw-bold">
            Danh sách đặt cọc
            <i class="fa fa-download fs-6 mb-1 ms-1"></i>
        </h5>

        <section id="zoom-container" class="w-100 position-fixed d-none">
            <div class="zoom-blur w-100 h-100"></div>
            <div class="zoom w-100 d-flex justify-content-center align-items-center">
                <div class = "position-relative zoom-img-container">
                    <button id ="next-btn" class = "btn btn-secondary img-btn"><i class="fa-solid fa-angle-right fs-1"></i></button>                 
                    <button id="prev-btn" class = "btn btn-secondary img-btn"><i class="fa-solid fa-angle-left fs-1"></i></button> 
                    <img id ="zoom-img"
                         class="w-100"
                         src=""
                         alt=""
                         />
                </div>

            </div>
            <button id="close-btn" class = "btn btn-secondary img-btn">x</button>
        </section>
        <section
            id="mobile-nav"
            class="position-fixed w-100 h-100 overflow-hidden d-none"
            >
            <div class="mobile-nav-container d-flex flex-column bg-white">
                <div class="mobile-nav--header bg-dark text-white p-2 ps-4 pe-4">
                    <div class="row h-100 justify-content-between align-items-center">
                        <i class="fa-solid fa-bars w-auto"></i>
                        <i class="fa-solid fa-xmark w-auto"></i>
                    </div>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <a href="../home" class="text-decoration-none text-dark">TRANG CHỦ</a>
                    </li>
                    <c:forEach items="${requestScope.lg}" var="i">
                        <c:set var = "string" value = "${fn:toUpperCase(i.getGroupname())}" />
                        <c:if test="${i.getSpecial()==1}">
                            <li class="list-group-item">

                                <a class="text-decoration-none text-dark"  href="../groupnews/${i.getPattern()}">${string}</a>
                            </li>  
                        </c:if>

                    </c:forEach>
                    <li class="list-group-item">
                        <a href="../news" class="text-decoration-none text-dark">TIN TỨC </a>
                    </li>

                    <li class="list-group-item">
                        <a href="../article/huong-dan-lien-he-16" class="text-decoration-none text-dark">LIÊN HỆ</a>
                    </li>
                    <li class="list-group-item">
                        <a href="../article/huong-dan-dat-coc-17" class="text-decoration-none text-dark">HƯỚNG DẪN ĐẶT CỌC</a>
                    </li>
                    <c:if test="${sessionScope.account.getStatics() == 1}">

                        <li class="list-group-item">
                            <a href="../information" class="text-decoration-none text-dark">THÔNG TIN TÀI KHOẢN</a>
                        </li>
                        <li class="list-group-item">
                            <a href="../changepass" class="text-decoration-none text-dark">ĐỔI MẬT KHẨU</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="text-decoration-none text-dark">LỊCH SỬ ĐẶT CỌC</a>
                        </li>
                        <li class="list-group-item">
                            <a href="../logout" class="text-decoration-none text-dark">ĐĂNG XUẤT</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <li class="list-group-item">
                            <a href="../login" class="text-decoration-none text-dark">ĐĂNG NHẬP</a>
                        </li>
                        <li class="list-group-item">
                            <a href="../signup" class="text-decoration-none text-dark">ĐĂNG KÝ</a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </section>


        <script src="../index.js"></script>
        <script src="../article.js"></script>
    </body>
</html>


