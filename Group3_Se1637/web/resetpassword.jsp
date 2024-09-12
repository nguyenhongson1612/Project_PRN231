<%-- 
    Document   : resetpassword
    Created on : Mar 4, 2023, 12:21:12 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <link rel="stylesheet" href="./index.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" integrity="sha512-YFENbnqHbCRmJt5d+9lHimyEMt8LKSNTMLSaHjvsclnZGICeY/0KYEeiHwD1Ux4Tcao0h60tdcMv+0GljvWyHg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <section class="product-section bg-light pt-5 pb-5">
            <div class="container">
                <h2 class = "mb-3 text-center">Đổi mật khẩu</h2>
                <p class="mb-4 text-center">	(*)Bạn nên sử dụng mật khẩu mạnh mà mình chưa sử dụng ở đâu khác</p>
                <div class="row">
                    <div class="d-flex justify-content-center">
                        <form method="post" id="changepass-form" class="bg-white p-4 rounded-3" style = "width: 450px">


                            <label>New Password</label>
                            <div id="password-group" class="form-group pass_show position-relative""> 
                                <button type ="button" class = "position-absolute top-0 end-0 border-0 show-btn" style="transform: translate(-50%, 20% ); background: unset">
                                    <i class="bi bi-eye-slash-fill"></i>
                                </button>
                                <input type="password"  name="newpass"required class="form-control" placeholder="New Password"> 
                                <p class="error text-danger position-absolute fw-bold"></p>
                               
                            </div> 
                            <br/>
                            <label>Confirm Password</label>
                            <div id="confirm-group" class="form-group pass_show position-relative""> 
                                <button type ="button" class = "position-absolute top-0 end-0 border-0 show-btn" style="transform: translate(-50%, 20% ); background: unset">
                                    <i class="bi bi-eye-slash-fill"></i>
                                </button>
                                <input type="password"  required class="form-control" placeholder="Confirm Password"> 
                                <p class="error text-danger position-absolute fw-bold"></p>
                            </div> 
                            <br/>
                            <label>Mã Bảo Mật</label>
                            <div id="confirm-group" class="form-group pass_show position-relative""> 

                                <input type="text" name="code" required class="form-control" placeholder="Nhập mã bảo mật"> 
                                <p class="error text-danger position-absolute fw-bold">${requestScope.err}</p>
                            </div> 
                            <br/>
                            <div class="">
                               Nếu bạn chưa nhận được mã  
                                <a href="resendcode2">Gửi lại</a>
                            </div>
                          
                            <button
                                type="submit"
                                class="btn bg-blue text-white btn-lg fs-5 fw-bold mt-3 mb-3"
                                >
                                Thay đổi
                            </button>
                        </form>

                    </div>  
                </div>
            </div>
        </section>
        <script src="resetpass.js"></script>
    </body>
</html>
