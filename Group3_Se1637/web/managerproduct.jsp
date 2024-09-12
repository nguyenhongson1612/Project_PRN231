<%-- 
    Document   : managerproduct
    Created on : Feb 7, 2023, 3:58:23 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product</title>

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

        <script type="text/javascript">
            function doHide2(pid) {
                if (confirm("are you sure  to hide product with pid = " + pid)) {
                    window.location = "hideproduct?pid=" + pid;
                }
            }
        </script>

        <script type="text/javascript">
            function dontHide2(pid) {
                if (confirm("are you sure  to display product with cid = " + pid)) {
                    window.location = "displayproduct?pid=" + pid;
                }
            }
        </script>

    </head>

    <body>
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
                <li class="active"><a href="product"><svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>Quản lý sản phẩm</a></li>
                <li><a href="managegroupnews"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"/></svg>Quản lý nhóm tin</a></li>
                <li><a href="managenews"><svg class="glyph stroked new"><use xlink:href="#stroked-two-messages"/></svg> Quản lý tin tức</a></li>
                <li ><a href="manageorder"><svg class="glyph translucent bag"><use xlink:href="#stroked-two-messages"/></svg> Quản lý đặt cọc</a></li>
            </ul>

        </div><!--/.sidebar-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="home"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">Danh sách sản phẩm</li>
                </ol>
            </div><!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Danh sách sản phẩm</h1>
                </div>
            </div><!--/.row-->
            <div id="toolbar" class="btn-group" style = "display:flex;align-items: center; flex-wrap: wrap">
                <a href="addproduct" class="btn btn-success">
                    <i class="glyphicon glyphicon-plus"></i> Thêm sản phẩm
                </a>

                <div style = "margin: 10px 0">
                    <button  id="hideSelectedBtn" class="btn btn-link" onclick="senData3()">
                        <i class="glyphicon glyphicon-eye-close"></i> Ẩn/Hiện
                    </button>

                    <button  id="deleteSelectedBtn" class="btn btn-link" onclick="senSpecial()">
                        <i class="glyphicon glyphicon-ok"></i> Nổi bật
                    </button>
                </div>

                <div class = "d-flex m-0">
                    <label style = "margin: 0 10px">Chọn danh mục:</label>
                    <select id ="type" name="cate" class="form-select w-auto m-3" aria-label="Type" onchange="change()">
                        <option value="0">Tất Cả</option>

                        <c:forEach items="${requestScope.listc}" var="i">

                            <c:if test="${i.stt !=0}">
                                <c:if test="${i.cid == requestScope.cid}">
                                    <option value="${i.cid}" selected="" >${i.name}</option>
                                </c:if>
                                <c:if test="${i.cid != requestScope.cid}">
                                    <option value="${i.cid}" >${i.name}</option>
                                </c:if>

                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">

                    <div class="d-flex flex-column">
                        <div class="d-flex mt-20 mb-20 justify-content-between">

                            <div class=" form-group has-search m-0">
                                <span
                                    class="glyphicon glyphicon-search form-control-feedback"
                                    ></span>
                                <input
                                    id="search-product"
                                    type="search"
                                    class="form-control"
                                    placeholder="Search"
                                    />
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table 
                                data-toolbar="#toolbar"
                                data-toggle="table">

                                <thead>
                                    <tr>
                                        <th data-field="id" data-sortable="true">ID</th>
                                        <th data-field="name"  data-sortable="true">Tên sản phẩm</th>
                                        <th data-field="price" data-sortable="true">Giá</th>
                                        <th>Ảnh sản phẩm</th>
                                        <th>Trạng thái</th>
                                        <th>Danh mục</th>
                                        <th>Nổi bật</th>
                                        <th>Hành động</th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.data}" var="i">
                                        <tr>

                                            <td style="">${i.pid}</td>
                                            <td style="">${i.name}</td>
                                            <td style="" type="number">
                                                <fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                                                  value = "${(i.price)}" /> VND
                                            </td>
                                            <td style="text-align: center"><img width="130" height="130" src="img/${i.pid}/${i.avata}" /></td>
                                                <c:if test="${i.stt ==1 && i.quantity > 0}">
                                                <td><span class="label label-success">Còn Hàng</span></td>
                                            </c:if>
                                            <c:if test="${i.stt ==2 || i.quantity == 0}">
                                                <td><span class="label label-danger">Hết Hàng</span></td>
                                            </c:if>
                                            <c:if test="${i.stt ==3}">
                                                <td><span class="label label-danger">Ngừng kinh doanh</span></td>
                                            </c:if>
                                            <td>${i.category.name}</td>
                                            <c:if test="${i.special == 0}">
                                                <td><span class="label label-danger">Không</span></td>
                                            </c:if>

                                            <c:if test="${i.special == 1}">
                                                <td><span class="label label-success">Có</span></td>
                                            </c:if>
                                            <td class="form-group">
                                                <a href="editproduct?pid=${i.pid}" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i></a>
                                                <c:if test="${i.stt == 1}"><a href="#" onclick="doHide2('${i.pid}')" class="btn btn-danger"><i class="glyphicon glyphicon-eye-close"></i></a></c:if>
                                                <c:if test="${i.stt == 3}"><a href="#" onclick="dontHide2('${i.pid}')" class="btn btn-danger"><i class="glyphicon glyphicon-eye-open"></i></a></c:if>
                                                </td>

                                                <td>
                                                    <input id="myCheckbox" type="checkbox" name="selectedIds" value="${i.pid}">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!--                        <div class="panel-footer">
                                                    <nav aria-label="Page navigation example">
                                                        <ul class="pagination">
                                                            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                                        </ul>
                                                    </nav>
                                                </div>-->
                    </div>
                </div>
            </div><!--/.row-->	
        </div>	<!--/.main-->

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-table.js"></script>	
        <script src="./manageproduct.js"></script>
    </body>

</html>

