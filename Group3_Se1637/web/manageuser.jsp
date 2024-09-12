<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrator</title>

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
            function doHide2(uid) {
                if (confirm("are you sure  to ban user with uid =" + uid)) {
                    window.location = "banuser?uid=" + uid;
                }
            }
        </script>
        
        <script type="text/javascript">
            function dontHide2(uid) {
                if (confirm("are you sure  to unban user with uid =" + uid)) {
                    window.location = "unbanuser?uid=" + uid;
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
                <li class="active"><a href="manageuser"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Quản lý thành viên</a></li>
                <li><a href="managecustomer"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Quản lý khách hàng</a></li>
                <li><a href="category"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"/></svg>Quản lý danh mục</a></li>
                <li><a href="product"><svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>Quản lý sản phẩm</a></li>
                <li><a href="managegroupnews"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"/></svg>Quản lý nhóm tin</a></li>
                <li><a href="managenews"><svg class="glyph stroked two messages"><use xlink:href="#stroked-two-messages"/></svg> Quản lý tin tức</a></li>
                <li ><a href="manageorder"><svg class="glyph translucent bag"><use xlink:href="#stroked-two-messages"/></svg> Quản lý đặt cọc</a></li>
            </ul>

        </div><!--/.sidebar-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="dashboard"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">Danh sách thành viên</li>
                </ol>
            </div><!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Danh sách thành viên</h1>

                </div>
            </div><!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <div class="d-flex flex-column">
                        <div class="d-flex mt-20 mb-20 justify-content-between">

                            <div class=" form-group has-search m-0">
                                <span
                                    class="glyphicon glyphicon-search form-control-feedback"
                                    ></span>
                                <input
                                    id="search-user"
                                    type="text"
                                    class="form-control"
                                    placeholder="Search"
                                    />
                            </div>
                        </div>
                    </div>

                    <!-- Wrapper for slides -->

                    <div class="item">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <c:if test="${sessionScope.account2.getRole()==1}">
                                    <button id ="add-new-btn" type="button" class="btn btn-success add-btn">
                                        <a href="addaccount" class = "d-flex">
                                            <i class="glyphicon glyphicon-plus"></i>
                                            <p>Thêm User</p>
                                        </a>
                                    </button>
                                </c:if>

                                <table data-toolbar="#toolbar" data-toggle="table">
                                    <thead>
                                        <tr>
                                            <th data-field="id" data-sortable="true">ID</th>
                                            <th data-field="username" data-sortable="true">Tên đăng nhập</th>
                                            <th data-field="name" data-sortable="true">
                                                Họ & Tên
                                            </th>
                                            <th data-field="phone" data-sortable="true">Số điện thoại</th>
                                            <th data-field="price" data-sortable="true">Email</th>
                                            <th data-field="address" data-sortable="true">Địa chỉ</th>
                                            <th>Quyền</th>
                                            <th data-field="status" data-sortable="true">Trạng thái</th>
                                                <c:if test="${sessionScope.account2.getRole()==1}">
                                                <th>Hành động</th>
                                                </c:if>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" items="${requestScope.listuser}"> 
                                            <c:if test="${i.getRole()!=1}">
                                                <tr data-index="0">
                                                    <td style="">${i.getUid()}</td>
                                                    <td style="">${i.getUserName()}</td>
                                                    <td style="">${i.getName()}</td>
                                                    <td style="">${i.getPhone()}</td>
                                                    <td style="">${i.getEmail()}</td>
                                                    <td>${i.getAddress()}</td>
                                                    <td style=""><span class="label label-danger">User</span></td>
                                                    <c:if test = "${i.getStatics() == 0}">
                                                        <td><span class="label label-danger">Không hoạt đông</span></td>
                                                    </c:if>

                                                    <c:if test = "${i.getStatics() == 1}">
                                                        <td><span class="label label-success">Hoạt động</span></td>
                                                    </c:if>
                                                    <c:if test="${sessionScope.account2.getRole()==1}">
                                                        <td class="form-group" style="">
                                                            <a href="editinforuser?uid=${i.getUid()}" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i></a>             
                                                                <c:if test = "${i.getStatics() == 1}">
                                                                <a href="#" onclick="doHide2('${i.uid}')" class="btn btn-danger"><i class="glyphicon glyphicon-eye-close"></i></a>
                                                                </c:if>
                                                                <c:if test = "${i.getStatics() == 0}">
                                                                <a href="#" onclick="dontHide2('${i.uid}')" class="btn btn-danger"><i class="glyphicon glyphicon-eye-open"></i></a>
                                                                </c:if>
                                                            <a href="repassforuser?uid=${i.getUid()}" class="btn btn-primary"><i class="glyphicon glyphicon-repeat"></i></a>
                                                        </td>
                                                    </c:if>

                                                </tr>
                                            </c:if>
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
                                        <li class="page-item">
                                            <a class="page-link" href="#">1</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">2</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">3</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">&raquo;</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>



                    <!-- Left and right controls -->

                </div>
            </div>
        </div>	<!--/.main-->

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-table.js"></script>	
        <script src = "./manageuser.js"></script>
    </body>
</html>