<%-- 
    Document   : manageorder
    Created on : Mar 11, 2023, 10:19:06 PM
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
        <title>Quản Lý Đặt Cọc</title>

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
            .has-search {
                position: relative;
                height: fit-content;
                padding: 0 !important;
                width: 300px;
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
                    <h1 class="page-header">Danh sách sản phẩm</h1>
                </div>
            </div>
            <!--/.row-->
            <div id="toolbar" class="btn-group">
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
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table id ="order-table" data-toolbar="#toolbar" data-toggle="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Người đặt cọc</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày đặt cọc</th>
                                        <th>Số sản phẩm</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listor}" var="i">
                                        <tr>
                                            <td>${i.getOid()}</td>
                                            <td>${i.getCode()}</td>
                                            <c:if test="${i.customer.getCid()== null}">
                                                <td>${i.guestorder.getName()}</td>
                                            </c:if>
                                            <c:if test="${i.guestorder.getKid()== null}">
                                                <td>${i.customer.getName()}</td>
                                            </c:if>
                                            <c:if test="${i.customer.getCid()== null}">
                                                <td>${i.guestorder.getAddress()}</td>
                                            </c:if>
                                            <c:if test="${i.guestorder.getKid()== null}">
                                                <td>${i.customer.getAddress()}</td>
                                            </c:if>

                                            <td>${i.getDate()}</td>
                                            <td>${i.getNumber()}</td>
                                            <td>
                                                <fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                                                  value = "${(i.getMoney())}" /> đ
                                            </td>
                                            <c:if test="${i.getStt()==1}">
                                                <td>
                                                    <label class="label label-success">
                                                        Đã thanh toán
                                                    </label>
                                                </td>
                                            </c:if>
                                            <c:if test="${i.getStt()==2}">
                                                <td>
                                                    <label class="label label-danger">
                                                        Chưa thanh toán
                                                    </label>
                                                </td>
                                            </c:if>
                                            <td>
                                                
                                                    <a class="btn btn-primary" href="orderdetails?oid=${i.getOid()}"><i class="glyphicon glyphicon-pencil"></i></a>
                                              
                                                <button class="btn btn-danger">
                                                    <i class="glyphicon glyphicon-eye-open"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#">&laquo;</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">&raquo;</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.main-->

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-table.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src ="./manageorder.js"></script>
    </body>
</html>
