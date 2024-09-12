<%-- 
    Document   : home
    Created on : Feb 5, 2023, 10:15:46 PM
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
        <title>Trang Chủ</title>
        <link rel="stylesheet" href="./index.css" />
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
                        <a  href="tel:0123456789" class="headline-item text-white ps-3 pe-3 text-center text-decoration-none">
                            Hotline : 0123 456 789
                        </a>

                        <p  class="headline-item text-white ps-3 pe-3 text-center">
                            <a href="article/huong-dan-dat-coc-17" class="text-decoration-none text-white"> Hướng dẫn đặt cọc </a>
                        </p>
                        <p class="headline-item text-white ps-3 pe-3 text-center">
                            <a href="article/huong-dan-lien-he-16" class="text-decoration-none text-white"> Liên hệ </a>
                        </p>
                    </ul>
                </div>
            </div>
        </section>
        <section id="banner" class="mt-5 mt-lg-0 pt-3 pb-3 bg-light">
            <div class="container">
                <div class="row align-items-center">
                    <div class="logo d-none d-lg-block col-3">
                        <a href="home">
                            <img
                                class="w-100"
                                src="http://vatlieuxaydung.vietcorp.top/files/adv/adv_logo-main-color2_54.png"
                                alt="logo"
                                />
                        </a>
                    </div>
                    <form action="search" method="post" class="search-box col-12 col-md-6 position-relative mb-5 mb-md-0">
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
                                    <li ><a class="dropdown-item" href="information">Thông tin tài khoản</a></li>
                                    <li ><a class="dropdown-item" href="changepass">Đổi mật khẩu</a></li>
                                    <li ><a class="dropdown-item" href="#">Lịch sử đặt cọc</a></li>
                                    <li ><a class="dropdown-item" href="logout">Đăng Xuất</a></li>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <button class="login  px-2 me-4 rounded-2 me-2">
                                <a href="login" class="text-white text-decoration-none"
                                   >Đăng nhập</a
                                >
                            </button>
                            <button class="login px-2 rounded-2">
                                <a href="signup" class="text-white text-decoration-none"
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
                                                href="viewcategory/${entry.key.getPattern()}"
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
                                                                <a class="dropdown-item" href="productdetail/${i.getParttern()}">${i.getName()}</a>
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
                                <a class="nav-link text-white" aria-current="page" href="home"
                                   >TRANG CHỦ</a
                                >
                            </li>

                  
                            <c:forEach items="${requestScope.products}" var="entry">
                                <c:set var = "string" value = "${fn:toUpperCase(entry.key.getName())}" />
                                <c:if test="${entry.key.getSpecial()==1}">
                                    <li class="nav-item me-4 ms-4">
                                        <a class="nav-link text-white" href="viewcategory/${entry.key.getPattern()}">${string}</a>
                                    </li>
                                </c:if>


                            </c:forEach>


                            <c:forEach items="${requestScope.lg}" var="i">
                                <c:set var = "string" value = "${fn:toUpperCase(i.getGroupname())}" />
                                <c:if test="${i.getSpecial()==1}">
                                    <li class="nav-item me-4 ms-4">

                                        <a class="nav-link text-white" href="groupnews/${i.getPattern()}">${string}</a>
                                    </li>  
                                </c:if>

                            </c:forEach>
                            <li class="nav-item dropdown me-4 ms-4">
                                <a
                                    class="nav-link  text-white"
                                    href="news"
                                    id="navbarDropdown"
                                    role="button"
                                    aria-expanded="false"
                                    >
                                    TIN TỨC
                                </a>

                            </li>
                            <li class="nav-item pe-2 ps-2">
                                <a class="nav-link text-white" href="article/huong-dan-lien-he-16">LIÊN HỆ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
        <section id="slide">
            <div class="container">
                <div
                    id="carouselExampleIndicators"
                    class="carousel slide"
                    data-bs-ride="carousel"
                    >
                    <div class="carousel-indicators">
                        <button
                            type="button"
                            data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="0"
                            class="active"
                            aria-current="true"
                            aria-label="Slide 1"
                            ></button>
                        <button
                            type="button"
                            data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="1"
                            aria-label="Slide 2"
                            ></button>
                        <button
                            type="button"
                            data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="2"
                            aria-label="Slide 3"
                            ></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active"  data-bs-interval="4000">

                            <a href="news">
                                <img
                                    src="https://www.vn.weber/files/vn/styles/960x540/public/pictures/2021-11/gach-lat-nen-mau-trang-1.jpg?itok=daqbkTLF"
                                    class="d-block w-100"
                                    alt="..."
                                    />
                            </a>

                        </div>
                        <div class="carousel-item"  data-bs-interval="4000">
                            <a href="news">
                                <img
                                    src="https://www.vn.weber/files/vn/styles/1920x1080_resize/public/pictures/2020-01/gach-op-tuong-phong-khach-209.jpg?itok=6yOJi7tl"
                                    class="d-block w-100"
                                    alt="..."
                                    />
                            </a>

                        </div>
                        <div class="carousel-item"  data-bs-interval="4000">
                            <a href="news">
                                <img
                                    src="https://gachdongtam.vn/hl_uploads/tin-tuc/2022_08/gach-op-tuong-phong-khach-nha-cap-4-dep-1.jpg"
                                    class="d-block w-100"
                                    alt="..."
                                    />
                            </a>

                        </div>
                    </div>
                    <button
                        class="carousel-control-prev"
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev"
                        >
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button
                        class="carousel-control-next"
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next"
                        >
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </section>
        <section id="home1" class="bg-light">
            <div class="container">
                <a href="#" class="show-more">
                    Xem thêm cửa hàng
                    <i class="fa fa-angle-double-down"></i>
                </a>
            </div>
        </section>
        <section id="product-hot" class="bg-light pt-3">
            <div class="container border">
                <div class="row">
                    <div class="product-hot--header bg-white p-3">
                        <div
                            class="title d-flex justify-content-between align-items-center border-bottom pb-2"
                            >
                            <h5 class="position-relative">
                                SẢN PHẨM NỔI BẬT
                                <div class="underline position-absolute"></div>
                            </h5>
                            <a
                                href="specialproduct"
                                class="section-link text-decoration-none text-blue"
                                >Xem tất cả</a
                            >
                        </div>
                    </div>
                    <div class="product-hot--content bg-white p-3">
                        <ul
                            class="d-flex flex-wrap justify-content-center align-items-center list-unstyled"

                            >

                            <c:forEach items="${requestScope.products}" var="entry">
                                <c:set var="entryIndex2" value="0" />
                                <c:forEach items="${entry.value}" var="i" varStatus="status2">
                                    <c:if test="${entryIndex2 < 1 && i.getStt()!=3 && i.getSpecial()==1}">
                                        <c:set var="entryIndex2" value="${status2.index + 1}" />
                                        <li class="product-item col-12 col-md-3">

                                            <div class="p-3 d-flex flex-column align-items-center">
                                                <div
                                                    class="product-img mb-3 d-flex align-items-center justify-content-center"
                                                    >
                                                    <img
                                                        class="w-100"
                                                        src="img/${i.getPid()}/${i.getAvata()}"
                                                        alt=""
                                                        />
                                                </div>
                                                <p class="product-name">${i.getName()}</p>
                                                <c:if test="${i.getAction()==1}">
                                                    <button class="btn btn-order text-white fw-bolder m-2">

                                                        <a
                                                            href="productdetail/${i.getParttern()}"
                                                            class="text-decoration-none text-white"
                                                            >Đặt cọc
                                                            <i class="fa fa-sack-dollar ms-2"></i>
                                                        </a>

                                                    </button>
                                                </c:if>
                                                <c:if test="${i.getAction()==2}">
                                                    <button class="btn btn-danger text-white fw-bolder m-2">
                                                        <a
                                                            href="productdetail/${i.getParttern()}"
                                                            class="text-decoration-none text-white"
                                                            >Liên Hệ
                                                            <i class="fa fa-phone ms-2"></i>
                                                        </a>
                                                    </button>
                                                </c:if>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </section>




        <c:forEach items="${requestScope.products}" var="entry">
            <section class="product-section bg-light pt-5">
                <div class="container">
                    <div class="product-section--header">
                        <div class="row">                        
                            <div class="col-md-4">
                                <div class="section-title position-relative pe-2 ps-2">
                                    <p class="mb-1">SẢN PHẨM </p>
                                    <h5>${entry.key.getName()}</h5>
                                    <div class="sub-border-title position-absolute"></div>
                                </div>
                            </div>  
                            <div class="col-md-8">
                                <c:if test="${entry.value!=null}">
                                    <div class="section-category">
                                        <ul class="d-flex flex-wrap list-unstyled">
                                            <a href="viewcategory/${entry.key.getPattern()}" class="text-decoration-none text-dark">
                                                <li class="section-item chosen pe-3 ps-3 pt-1 pb-1 me-2 mt-2">
                                                    Tất cả
                                                </li>
                                            </a>
                                            <c:set var="entryIndex" value="0" />
                                            <c:forEach items="${entry.value}" var="product" varStatus="status">
                                                <c:if test="${entryIndex < 3 && product.getStt()!=3}">
                                                    <c:set var="entryIndex" value="${status.index + 1}" />
                                                    <a href="productdetail/${product.getParttern()}" class="text-decoration-none text-dark">
                                                        <li class="section-item pe-3 ps-3 pt-1 pb-1 me-2 mt-2">
                                                            ${product.getName()}
                                                        </li>
                                                    </a>
                                                </c:if>

                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:if>

                            </div> 
                        </div>
                    </div>
                    <div class="product-section--content pt-4">
                        <div class="row">

                            <div class="col-md-4">
                                <c:if test="${!entry.key.getImg().equals('')}">
                                    <div class="section-example w-100">

                                        <img
                                            class="w-100"
                                            src="${entry.key.getImg()}"
                                            alt=""
                                            />
                                    </div>
                                </c:if>
                            </div>


                            <div class="col-md-8">

                                <ul
                                    class="d-flex flex-wrap justify-content-left align-items-center list-unstyled"
                                    >
                                    <c:forEach items="${entry.value}" var="i">
                                        <c:if test="${i.getStt()!=3}">
                                            <li class="product-item col-6 col-md-4 p-3">
                                                <div
                                                    class="d-flex flex-column align-items-center bg-white border position-relative"
                                                    >
                                                    <div
                                                        class="product-img d-flex align-items-start justify-content-center"
                                                        >
                                                        <img
                                                            class="w-100"
                                                            src="img/${i.getPid()}/${i.getAvata()}"

                                                            alt=""
                                                            />
                                                        <p></p>
                                                    </div>
                                                    <p class="product-name">${i.getName()}</p>
                                                    <c:if test="${i.getAction()==1}">
                                                        <button class="btn btn-order text-white fw-bolder m-2">

                                                            <a
                                                                href="productdetail/${i.getParttern()}"
                                                                class="text-decoration-none text-white"
                                                                >Đặt cọc
                                                                <i class="fa fa-sack-dollar ms-2"></i>
                                                            </a>

                                                        </button>
                                                    </c:if>
                                                    <c:if test="${i.getAction()==2}">
                                                        <button class="btn btn-danger text-white fw-bolder m-2">
                                                            <a
                                                                href="productdetail/${i.getParttern()}"
                                                                class="text-decoration-none text-white"
                                                                >Liên Hệ
                                                                <i class="fa fa-phone ms-2"></i>
                                                            </a>
                                                        </button>
                                                    </c:if>



                                                    <div class="sub-border position-absolute"></div>
                                                </div>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </section>  
        </c:forEach>
        <section id="event" class="bg-light pt-5 pb-5">
            <div class="container">
                <div class="product-section--header">
                    <div class="section-title position-relative pe-2 ps-2">
                        <p class="mb-1">TRUYỀN THÔNG</p>
                        <h5>NỔI BẬT</h5>
                        <div class="sub-border-title position-absolute"></div>
                    </div>
                </div>
                <div class="product-section--content">
                    <div class="row">

                        <div class="col-12 custom-row">
                            <div class="event-list d-flex flex-wrap">
                                <c:set var="entryIndex" value="0" />
                                <c:forEach items="${requestScope.ln}" var="i" varStatus="status">
                                    <c:if test="${entryIndex < 4 && i.getStt()==1}">
                                        <c:set var="entryIndex" value="${status.index + 1}" />
                                        <div class="event-post col-12 col-lg-6 mt-5 pe-3">
                                            <a href="article/${i.getPattern()}" class="text-dark text-decoration-none">
                                                <div class="row gx-0">
                                                    <div class="col-md-4">
                                                        <div class = "event-img">
                                                            <img
                                                                class="w-100"
                                                                src="image/news_avata/${i.getAvata()}"
                                                                alt=""
                                                                />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8 px-3">
                                                        <div class="d-flex flex-column">
                                                            <p class="event-title mt-2 mt-md-0 mb-1">
                                                                ${i.getTitle()}
                                                            </p>
                                                            <div class="event-time mb-2">
                                                                <i class="far fa-clock"></i>
                                                                21.12.2018
                                                            </div>
                                                            <p class="event-desc">
                                                                ${i.getSortdesc()}
                                                            </p>
                                                        </div>
                                                    </div>  


                                                </div>
                                            </a>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div
                    class="product-section--footer w-100 d-flex justify-content-center mt-5"
                    >
                    <a
                        href="groupnews/${requestScope.g.getPattern()}"
                        class="show-all--link text-decoration-none p-2 pe-4 ps-4 d-flex justify-content-center align-items-center w-auto"
                        >
                        Xem tất cả
                        <i class="fa fa-long-arrow-alt-right"></i>
                    </a>
                </div>
            </div>
        </section>

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
                                <a class="text-decoration-none text-dark" href="article/huong-dan-dat-coc-17">
                                    <li class="d-flex align-items-start mb-2">
                                        <i class="fa fa-chevron-right"></i>
                                        <p>Hướng dẫn đặt cọc</p>
                                    </li>
                                </a>
                                <a class="text-decoration-none text-dark" href="article/huong-dan-lien-he-16">
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
                                    <a class="text-decoration-none text-dark" href="viewcategory/${i.key.getPattern()}">
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
                        <a href="home" class="text-decoration-none text-dark">TRANG CHỦ</a>
                    </li>
                    <c:forEach items="${requestScope.lg}" var="i">
                        <c:set var = "string" value = "${fn:toUpperCase(i.getGroupname())}" />
                        <c:if test="${i.getSpecial()==1}">
                            <li class="list-group-item">

                                <a class="text-decoration-none text-dark"  href="groupnews/${i.getPattern()}">${string}</a>
                            </li>  
                        </c:if>

                    </c:forEach>
                    <li class="list-group-item">
                        <a href="news" class="text-decoration-none text-dark">TIN TỨC </a>
                    </li>

                    <li class="list-group-item">
                        <a href="article/huong-dan-lien-he-16" class="text-decoration-none text-dark">LIÊN HỆ</a>
                    </li>
                    <li class="list-group-item">
                        <a href="article/huong-dan-dat-coc-17" class="text-decoration-none text-dark">HƯỚNG DẪN ĐẶT CỌC</a>
                    </li>
                    <c:if test="${sessionScope.account.getStatics() == 1}">

                        <li class="list-group-item">
                            <a href="information" class="text-decoration-none text-dark">THÔNG TIN TÀI KHOẢN</a>
                        </li>
                        <li class="list-group-item">
                            <a href="changepass" class="text-decoration-none text-dark">ĐỔI MẬT KHẨU</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="text-decoration-none text-dark">LỊCH SỬ ĐẶT CỌC</a>
                        </li>
                        <li class="list-group-item">
                            <a href="logout" class="text-decoration-none text-dark">ĐĂNG XUẤT</a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.account == null}">
                        <li class="list-group-item">
                            <a href="login" class="text-decoration-none text-dark">ĐĂNG NHẬP</a>
                        </li>
                        <li class="list-group-item">
                            <a href="signup" class="text-decoration-none text-dark">ĐĂNG KÝ</a>
                        </li> 
                    </c:if>

                </ul>
            </div>
        </section>
        <script src="./index.js"></script>
    </body>
</html>