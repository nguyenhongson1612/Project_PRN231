<%-- 
    Document   : addproduct
    Created on : Feb 7, 2023, 5:13:49 AM
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
        <title>Add product</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link href="css/bootstrap-table.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="add_product.css">
        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>

        <script type="text/javascript">
            function formatCurrency(input) {
                var currency = input.value.replace(/[^0-9\.]/g, ''); // lọc ra chỉ số tiền trong chuỗi
                currency = currency.replace(/\./g, ''); // bỏ hết dấu chấm
                currency = currency.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'); // thêm dấu phẩy ngăn cách hàng nghìn
                input.value = currency; // gán giá trị định dạng tiền tệ vào trường số tiền
            }
        </script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                <li><a href="managecustomer"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Quản lý khách hàng</a></li>
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
                    <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li><a href="">Quản lý sản phẩm</a></li>
                    <li class="active">Thêm sản phẩm</li>
                </ol>
            </div><!--/.row-->
            <div class = "row">
                <a href = "product" class = "btn">
                    <i class="fa-solid fa-arrow-left"></i>
                    Trở về
                </a>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Thêm sản phẩm</h1>
                </div>

            </div><!--/.row-->
            <c:if test="${requestScope.err!= null}">
                <div class="alert alert-danger">${requestScope.err}</div>
            </c:if>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form role="form" method="post" enctype="multipart/form-data">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Mã sản phẩm</label>
                                        <input required name="pid" class="form-control" value="${requestScope.pid}">
                                    </div>

                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input required name="name" type="text" min="0" class="form-control" value="${requestScope.name}">
                                    </div>
                                    <div class="form-group">
                                        <label>Giá sản phẩm</label>
                                        <input type="text" name="price" onkeyup="formatCurrency(this);" class="form-control" value="${requestScope.price}">
                                    </div>    
                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <input required name="quantity" type="number" class="form-control" value="${requestScope.quantity}">
                                    </div>                  
                                    <div class="form-group">
                                        <label>Danh mục</label>
                                        <select name="cid" class="form-control">
                                            <c:forEach items="${requestScope.data}" var="s">
                                                <option value="${s.cid}">${s.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Đơn vị</label>
                                        <input required name="unit" type="text" class="form-control" value="${requestScope.unit}">
                                    </div>       
                                    <div class="form-group">
                                        <label>Mô tả sản phẩm</label>
                                        <input required name="describe" type="text" class="form-control" value="${requestScope.describe}">
                                    </div>  
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Ảnh sản phẩm</label>
                                        <br>
                                        <div id = "add-avt-container">
                                            <div>
                                                <label class="label label-primary" for="avt-upload">Thêm avatar</label>
                                                <input required type="file" name="avt" id ="avt-upload" class="upload-photo" onchange = "uploadAvt(this)"/>
                                            </div>
                                        </div>
                                        <br/>
                                        <div id = "avt-img">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh chi tiết</label>
                                        <br>
                                        <label class="label label-primary" for="sub-upload">Thêm ảnh chi tiết</label>
                                        <input required type="file" name="img" multiple id ="sub-upload" class="upload-photo" />
                                        <div id = "sub-img">

                                        </div>
                                    </div>

                                    <button name="sbm" type="submit" class="btn btn-success">Thêm mới</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div><!-- /.col-->
            </div><!-- /.row -->

        </div>	<!--/.main-->	
        <script src="./add_product.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-table.js"></script>	
    </body>

</html>
