<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="model.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VNPAY RESPONSE</title>
        <!-- Bootstrap core CSS -->
        <link href="./assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="./assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="./assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <% String vnpAmount = request.getParameter("vnp_Amount"); %>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY RESPONSE</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã Đơn Hàng:</label>
                    <label id="ref"><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số Tiền Thanh Toán:</label>
                    <label id="amoun"><%=vnpAmount.substring(0, vnpAmount.length() - 2) %></label>
                </div>  
                <div class="form-group">
                    <label >Thông tin đặt cọc:</label>
                    <label id="infor"><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã Phản Hồi:</label>
                    <label id="code"><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã Giao Dịch:</label>
                    <label id="trans"><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Ngân Hàng Thanh Toán:</label>
                    <label id="bcode"><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Ngày Thanh Toán:</label>
                    <label id="date"><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Trạng Thái Thanh Toán:</label>
                    <label id="statics">
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Success");
                                } else {
                                    out.print("Failed");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div> 
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                $(function () {
                    // Lấy các giá trị từ các phần tử HTML
                    const ref = $('#ref').text().trim();
                    const amount = $('#amoun').text().trim();
                    const infor = $('#infor').text().trim();
                    const code = $('#code').text().trim();
                    const bcode = $('#bcode').text().trim();
                    const date = $('#date').text().trim();
                    const trans = $('#trans').text().trim();
                    const statics = $('#statics').text().trim();
                    // Tạo đối tượng dữ liệu để gửi đến servlet



                    console.log(ref);
                    console.log(amount);
                    if (statics === 'Success') {
                        $.ajax({
                            type: 'POST',
                            url: 'paymentsuccess',
                            data: {ref: ref,
                                amount: amount,
                                infor: infor,
                                code: code,
                                bcode: bcode,
                                date: date,
                                trans: trans,
                                statics:statics},
                            success: function (response) {
                                // Xử lý phản hồi từ servlet nếu cần
                            },
                            error: function (xhr, status, error) {
                                // Xử lý lỗi nếu cần
                            }
                        });
                    }
                    // Tạo yêu cầu AJAX và gửi dữ liệu đến servlet

                });
            </script>
        </div>  
    </body>
</html>
