<%-- 
    Document   : orderdetails
    Created on : Mar 11, 2023, 3:22:54 PM
    Author     : Anh Quan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Vietpro Mobile Shop - Administrator</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/datepicker3.css" rel="stylesheet" />
        <link href="css/bootstrap-table.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />

        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>

        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <style>
            #toolbar2 {
                width: 100%;
                display: flex;
                justify-content: space-between;
            }

            .product-detail {
                display: flex;
            }

            .img-container {
                width: 100px;
                aspect-ratio: 16/9;
                margin-right: 20px;
            }

            img {
                width: 100%;
                object-fit: cover;
            }

            .detail {
                display: flex;
                flex-direction: column;
            }

            .detail-name {
                font-weight: bold;
            }

            .detail-code {
                margin-bottom: 0;
            }

            input[type="number"] {
                width: 30px;
                border: none;
                outline: none;
                background: transparent;
            }

            .d-none {
                display: none !important;
            }

            #add-product {
                width: 100vw;
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 9999;
            }

            .add-product-container {
                position: relative;
                width: 100%;
                height: 100%;
            }

            .blur {
                width: 100vw;
                height: 100vh;
                background: #000000b6;
            }

            .add-product-content {
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .add-product-panel {
                width: 80% !important;
            }

            #close-btn {
                position: absolute;
                top: 20px;
                right: 20px;
            }

            .summary {
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
                align-items: start;
            }

            .summary-content {
                display: flex;
                flex-direction: column;
            }

            .summary-content p {
                font-size: 18px;
                font-weight: bold;
            }

            .summary-content p {
                text-align: end;
            }

            .fixed-table-body {
                max-height: 300px !important;
            }

            .has-search {
                position: relative;
                height: fit-content;
                padding: 0 !important;
                width: 300px;
            }

            select {
                margin-top: 10px;
                padding: 2px 10px;
            }
        </style>

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="dashboard">VẬT LIỆU XÂY DỰNG</a>
                    <ul class="user-menu">
                        <li class="dropdown pull-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Admin <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <c:if test="${sessionScope.account2.getRole()!=1}">
                                    <li><a href="profileuser"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Hồ sơ</a></li>
                                    <li><a href="staffchangepass"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>Đổi mật khẩu</a></li>
                                        </c:if>

                                <li><a href="logout"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Đăng xuất</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </div><!-- /.container-fluid -->
        </nav>

        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <ul class="nav menu">
                <li ><a href="dashboard"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Dashboard</a></li>
                <li><a href="manageuser"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Quản lý thành viên</a></li>
                <li ><a href="managecustomer"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Quản lý khách hàng</a></li>
                <li><a href="category"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"/></svg>Quản lý danh mục</a></li>
                <li><a href="product"><svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>Quản lý sản phẩm</a></li>
                <li><a href="managegroupnews"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"/></svg>Quản lý nhóm tin</a></li>
                <li><a href="managenews"><svg class="glyph stroked new"><use xlink:href="#stroked-two-messages"/></svg> Quản lý tin tức</a></li>
                <li class="active"><a href="manageorder"><svg class="glyph translucent bag"><use xlink:href="#stroked-two-messages"/></svg> Quản lý đặt cọc</a></li>
            </ul>

        </div><!--/.sidebar-->


        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li>
                        <a href="#"
                           ><svg class="glyph stroked home">
                            <use xlink:href="#stroked-home"></use></svg
                            ></a>
                    </li>
                    <li class="active">Danh sách sản phẩm</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Chi tiết đơn hàng</h1>
                </div>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table id ="detail-table" data-toggle="table">
                                <thead>
                                    <tr>
                                        <th>Chi tiết sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Đơn vị tính</th>
                                        <th>Tổng cộng</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.list}" var="i"> 
                                        <tr>
                                            <td>
                                                <div class="product-detail">
                                                    <div class="img-container">
                                                        <img
                                                            src="img/${i.product.getPid()}/${i.product.getAvata()}"
                                                            alt=""
                                                            />
                                                    </div>
                                                    <div class="detail">
                                                        <p class="detail-name">${i.product.getName()}</p>
                                                        <p class="detail-code">${i.product.getPid()}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="amount2">
                                                <fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                                                  value = "${(i.product.getPrice())}" /> đ
                                            </td>
                                            <td class = "quantity"><input style="width: 90px;" type="number" min="1" value="${i.getQuantity()}"
                                                       onkeyup="updateTotal(event)" onchange="updateTotal(event)"/></td>
                                            <td>${i.getUnit()}</td>
                                            <td class = "money-each">
                                                <fmt:formatNumber type="number" maxFractionDigits="3" 
                                                                  value="${(i.product.getPrice() * i.getQuantity())}" /> đ
                                            </td>
                                            <td>
                                                <a onclick="doDelete('${i.product.getPid()}', '${requestScope.o.getOid()}')" href="#" class="btn btn-danger"
                                                   ><i class="glyphicon glyphicon-remove"></i
                                                    ></a>
                                            </td>
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>

                            <div class="summary">
                                <button id="toggle-popup" class="btn btn-primary">
                                    Thêm sản phẩm
                                </button>
                                <div class="summary-content">
                                    <p class="text-muted">Tổng tiền</p>
                                    <p class="money" style="font-weight: bold">
                                        <fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                                          value = "${requestScope.o.getMoney()}" /> đ
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer" style = "display: flex; justify-content: end">
                            <button onclick="sendData()" id ="pay-btn" class = "btn btn-success">Xuất hóa đơn</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.main-->

        <div id="add-product" class="d-none">
            <div class="add-product-container">
                <div class="blur"></div>
                <div class="add-product-content">
                    <div id="toolbar2" class="btn-group">
                        <div class="form-group has-feedback has-search">
                            <span
                                class="glyphicon glyphicon-search form-control-feedback"
                                ></span>
                            <input
                                id="search"
                                type="text"
                                class="form-control input-search"
                                placeholder="Search"
                                />
                        </div>
                    </div>

                    <div class="panel panel-default add-product-panel">
                        <div class="panel-body">
                            <table id ="popup-table" data-toolbar="#toolbar2" data-toggle="table">
                                <thead>
                                    <tr>

                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Ảnh sản phẩm</th>
                                        <th>Loại sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá</th>
                                        <th>Trạng thái</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listp}" var="i">


                                        <c:if test="${i.getStt()==1}">



                                            <tr>
                                                <td>${i.getPid()}</td>                                        

                                                <td>${i.getName()}</td>
                                                <td>
                                                    <img
                                                        src="img/${i.getPid()}/${i.getAvata()}"
                                                        alt=""
                                                        style="max-width: 80px"
                                                        />
                                                </td>
                                                <td>${i.category.getName()}</td>
                                                <td>${i.getQuantity()}</td>
                                                <td>
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                                                      value = "${(i.getPrice())}" /> đ
                                                </td>
                                                <td>
                                                    <label class="label label-success">Còn hàng</label>
                                                </td>
                                                <td>
                                                    <input id="myCheckbox" type="checkbox" name="selectedIds" value="${i.getPid()}">
                                                </td>
                                            </tr>
                                        </c:if>



                                    </c:forEach>



                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-primary" onclick="sendProduct()">Thêm</button>
                        </div>
                    </div>
                </div>
                <button id="close-btn" class="btn btn-danger">x</button>
            </div>
        </div>

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-table.js"></script>

        <script>
                                togglePopup = document.getElementById("toggle-popup");
                                addProductContainer = document.getElementById("add-product");
                                closeButton = document.getElementById("close-btn");

                                togglePopup.addEventListener("click", () => {
                                    addProductContainer.classList.remove("d-none");
                                });

                                closeButton.addEventListener("click", () => {
                                    addProductContainer.classList.add("d-none");
                                });

                                function doDelete(pid, oid) {
                                    if (confirm("Bấm OK để xóa sản phẩm khỏi đơn hàng ")) {
                                        window.location = "deleteproductorder?pid=" + pid + "&oid=" + oid;
                                    }
                                }


        </script>

        <script src ="order.js"></script>
    </body>
</html>
