<%-- 
    Document   : login
    Created on : Feb 11, 2023, 10:11:03 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <link rel="stylesheet" href="index.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" integrity="sha512-YFENbnqHbCRmJt5d+9lHimyEMt8LKSNTMLSaHjvsclnZGICeY/0KYEeiHwD1Ux4Tcao0h60tdcMv+0GljvWyHg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
        <div class="min-vh-100 bg-blue">
            <div
                class="container w-100 min-vh-100 d-flex justify-content-center align-items-center"
                >
                <div class="row w-100 d-flex justify-content-center align-items-center">
                    <div class="col-12 col-md-8 col-lg-5">
                        <form class="bg-white p-4 rounded-3" method="post">
                            <h1 class="mb-2">Log In</h1>
                            <p>Please fill in this form to login your account!</p>
                            <hr />
                            <p class="text-danger fw-bold text-center text-small">${requestScope.err}</p>
                            <br/>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-user"></i
                                    ></span>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Username hoặc Email"
                                    aria-label="Username"
                                    aria-describedby="basic-addon1"
                                    name="username"
                                    />
                            </div>
                            <div class="input-group mb-3 position-relative">
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-lock"></i
                                    ></span>
                                <button type ="button" class = "position-absolute top-0 end-0 border-0 show-btn" style="transform: translate(-50%, 20% ); background: unset; z-index: 9">
                                    <i class="bi bi-eye-slash-fill"></i>
                                </button>
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="Password"
                                    aria-label="Password"
                                    aria-describedby="basic-addon1"
                                    name="password"
                                    />
                            </div>
                            <div>
                                <a class="text-decoration-none" href="forgotpassword">Quên mật khẩu</a>
                            </div>
                            <div class="">
                                Nếu bạn chưa có tài khoản?
                                <a href="signup" class="text-decoration-none"
                                   >Đăng ký ngay</a
                                >
                            </div>
                            <br />
                            <button
                                type="submit"
                                class="btn bg-blue text-white btn-lg fs-5 fw-bold"
                                >
                                Đăng Nhập
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            let errorElement = document.querySelector('.text-danger');
            if (errorElement) {
                let errorMessage = errorElement.innerHTML;
                if (errorMessage.indexOf('Tài khoản chưa được kích hoạt. Truy cập đường dẫn sau để kích hoạt lại tài khoản') !== -1) {
                    errorMessage += ' <a href="getemail">Kích hoạt ngay</a>';
                    errorElement.innerHTML = errorMessage;
                }
            }
        </script>
        <script src = "./login.js">
           
        </script>
    </body>
</html>
