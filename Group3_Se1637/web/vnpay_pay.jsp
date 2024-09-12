<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="../assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="../assets/jumbotron-narrow.css" rel="stylesheet">   

        <script src="../assets/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="../vnpay.css" />
    </head>

    <body>

        <div class="container">
            <h3>Ðơn hàng: ${requestScope.o.code}</h3>
            <div class = "row">
                <div class = "col-12 col-md-7">
                    <table class = "table table-bordered">
                        <thead>
                            <tr>
                                <th>
                                    Chi tiết sản phẩm
                                </th>
                                <th>
                                    Đơn vị tính
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listdt}" var="i">
                                <tr>
                                    <td>
                                        <div class = "detail">
                                            <div class = "img-container">
                                                <img src = "../img/${i.product.getPid()}/${i.product.getAvata()}" alt =""/>
                                            </div>
                                            <div class = "product-detail">
                                                <div>
                                                    <p style = "font-size: 16px; font-weight: bold">${i.product.getName()}</p>
                                                    <p>Mã sản phẩm: ${i.product.getPid()}</p>
                                                </div>
                                                <p class = "text-muted">Số lượng: ${i.getQuantity()}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        ${i.unit}
                                    </td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>
                </div>
                <div class = "col-12 col-md-5">

                    <div>
                        <form action="../vnpayajax" id="frmCreateOrder" method="post"> 
                            <p style="font-size: 20px; margin-bottom: 20px"> Thanh toán cho đơn hàng: <input style ="font-size: 16px;
                                                                padding: 0; background:
                                                                transparent; border: none;
                                                                outline: none; box-shadow: none;
                                                                " 
                                                                value="${requestScope.o.code}" 
                                                                type="text" readonly 
                                                                name="code"/></p>
                            <div class="form-group">
                                <label style="font-size: 20px" for="amount">Tổng tiền</label>
                                <div style = "display: flex; align-items: center">
                                    <input style ="width: 100%; font-size: 18px;
                                           padding: 0; background:
                                           transparent; border: none;
                                           outline: none; box-shadow: none;" 
                                           data-val="true" 
                                           data-val-number="The field Amount must be a number."
                                           data-val-required="The Amount field is required." 
                                           id="amount" 
                                           value="<fmt:formatNumber type = "number" maxFractionDigits = "3" 
                                                             value = "${requestScope.o.getMoney()}" /> đ"
                                           name="amount"
                                           readonly/> 
                                </div>
                            </div>
                            <h4>Chọn phương thức thanh toán</h4>
                            <div class="form-group">
                                <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                                <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                                <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                                <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                                <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                                <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                                <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                                <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                                <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                                <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                            </div>
                            <div class="form-group">
                                <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                                <input type="radio" id="language" Checked="True" name="language" value="vn">
                                <label for="language">Tiếng việt</label><br>
                                <input type="radio" id="language" name="language" value="en">
                                <label for="language">Tiếng anh</label><br>

                            </div>

                            <div style = "display:flex; justify-content: center; margin-top: 60px">
                                <button type="submit" class="btn btn-success" href>Thanh toán</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                var a = 100;
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,

                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });


        </script>       
    </body>
</html>