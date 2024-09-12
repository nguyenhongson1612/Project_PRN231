<%-- 
    Document   : category
    Created on : Feb 7, 2023, 1:37:54 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Category</title>

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
            function doHide2(cid) {
                if (confirm("are you sure  to hide category with cid =" + cid)) {
                    window.location = "deletecategory?cid=" + cid;
                }
            }
        </script>
        
        <script type="text/javascript">
            function dontHide2(cid) {
                if (confirm("are you sure  to display category with cid =" + cid)) {
                    window.location = "displaycategory?cid=" + cid;
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
                            <a href="profileuser" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Admin <span class="caret"></span></a>
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

        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <ul class="nav menu">
                <li ><a href="dashboard"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Dashboard</a></li>
                <li><a href="manageuser"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Quản lý thành viên</a></li>
                <li ><a href="managecustomer"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Quản lý khách hàng</a></li>
                <li class="active"><a href="category"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"/></svg>Quản lý danh mục</a></li>
                <li><a href="product"><svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>Quản lý sản phẩm</a></li>
                <li><a href="managegroupnews"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"/></svg>Quản lý nhóm tin</a></li>
                <li><a href="managenews"><svg class="glyph stroked new"><use xlink:href="#stroked-two-messages"/></svg> Quản lý tin tức</a></li>
                <li ><a href="manageorder"><svg class="glyph translucent bag"><use xlink:href="#stroked-two-messages"/></svg> Quản lý đặt cọc</a></li>
            </ul>   

        </div><!--/.sidebar-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">Quản lý danh mục</li>
                </ol>
            </div><!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Quản lý danh mục</h1>
                </div>
            </div><!--/.row-->
            <div id="toolbar" class="btn-group">
                <a href="addcategory" class="btn btn-success">
                    <i class="glyphicon glyphicon-plus"></i> Thêm danh mục
                </a>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table 
                                data-toolbar="#toolbar"
                                data-toggle="table">

                                <thead>
                                    <tr>
                                        <th data-field="id" data-sortable="true">Mã danh mục</th>
                                        <th>Tên danh mục</th>
                                        <th>Trạng thái</th>
                                        <th>Danh mục nổi bật</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listc}" var="i">
                                        <tr>
                                            <td style="">${i.cate_code}</td>
                                            <td style="">${i.name}</td>
                                            <c:if test="${i.stt == 1}">
                                                <td style=""><span class="label label-success">Đang kinh doanh</span></td>
                                            </c:if>
                                            <c:if test="${i.stt == 0}">
                                                <td style=""><span class="label label-danger">Ngừng kinh doanh</span></td>
                                            </c:if>
                                                <c:if test="${i.special == 1}">
                                                <td style=""><span class="label label-success">Có</span></td>
                                            </c:if>
                                                <c:if test="${i.special == 0}">
                                                <td style=""><span class="label label-danger">Không</span></td>
                                            </c:if>
                                            <td class="form-group">
                                                <a href="editcategory?cid=${i.cid}" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i></a>
                                                <c:if test="${i.stt == 1}"><a href="#" onclick="doHide2('${i.cid}')" class="btn btn-danger"><i class="glyphicon glyphicon-eye-close"></i></a></c:if>
                                                <c:if test="${i.stt == 0}"><a href="#" onclick="dontHide2('${i.cid}')" class="btn btn-danger"><i class="glyphicon glyphicon-eye-open"></i></a></c:if>
                                                <c:if test="${i.special == 0}"><a href="specialcategory?cid=${i.cid}" class="btn btn-primary"><i class="glyphicon glyphicon-star"></i></a></c:if>
                                                <c:if test="${i.special == 1}"><a href="unspecialcategory?cid=${i.cid}" class="btn btn-primary"><i class="glyphicon glyphicon-star-empty"></i></a></c:if>
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
    </body>

</html>
