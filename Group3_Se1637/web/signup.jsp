<%-- 
    Document   : signup
    Created on : Feb 11, 2023, 4:16:49 PM
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
        <title>Signup</title>
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
        <div class="auth-form min-vh-100 bg-blue">
            <div
                class="container w-100 min-vh-100 d-flex justify-content-center align-items-center"
                >
                <div class="row w-100 d-flex justify-content-center align-items-center">
                    <div class="col-12 col-md-8 col-lg-5">
                        <form method="post" id="signup-form" class="bg-white p-4 rounded-3">
                            <h2 class="mb-2">Sign Up</h2>
                            <p>Điền đầy đủ thông tin vào form dưới đây để tạo tài khoản</p>
                            <hr />
                            <div class="input-group mb-4">
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-user"></i
                                    ></span>
                                <input
                                    type="text"
                                    class="form-control"
                                    aria-describedby="inputGroupPrepend"
                                    placeholder="Username"
                                    aria-label="Username"
                                    required
                                    name="user"
                                    />
                                <p class="error text-danger fw-bold position-absolute text-small">${requestScope.err}</p>
                            </div>


                            <div class="input-group mb-4">
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-address-card"></i
                                    ></span>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Fullname"
                                    aria-label="Fullname"
                                    aria-describedby="basic-addon1"
                                    name="fullname"
                                    />
                            </div>
                            <div class="input-group mb-4">
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-paper-plane"></i
                                    ></span>
                                <input
                                    type="email"
                                    class="form-control"
                                    placeholder="Email Address"
                                    aria-label="Email Address"
                                    aria-describedby="basic-addon1"
                                    required
                                    name="email"
                                    />
                                <p class="error text-danger position-absolute fw-bold"></p>
                                <p class=" error text-danger fw-bold position-absolute text-small">${requestScope.err2}</p>
                            </div>
                            <div id="phone-group" class="input-group mb-4">
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-phone"></i
                                    ></span>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Phone Number"
                                    aria-label="Phone Number"
                                    aria-describedby="basic-addon1"
                                    name="phone"
                                    />
                                <p class="error text-danger position-absolute fw-bold"></p>
                                <p class=" error  text-danger position-absolute fw-bold text-small">${requestScope.err3}</p>
                            </div>
                            <div class="input-group mb-4">
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-address-book"></i
                                    ></span>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Address"
                                    aria-label="Address"
                                    aria-describedby="basic-addon1"
                                    name="address"
                                    />
                            </div>
                            <div id="password-group" class="input-group mb-4 position-relative">
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
                                    required
                                    name="password"
                                    />
                                <p class="error text-danger position-absolute fw-bold"></p>
                            </div>
                            <div
                                id="confirm-group"
                                class="input-group mb-4 position-relative"
                                >
                                <span class="input-group-text" id="basic-addon1"
                                      ><i class="fa-solid fa-lock fs-6"></i>
                                    <i class="fa fa-check"></i
                                    ></span>
                                <button type ="button" class = "position-absolute top-0 end-0 border-0 show-btn" style="transform: translate(-50%, 20% ); background: unset; z-index: 9">
                                    <i class="bi bi-eye-slash-fill"></i>
                                </button>
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="Confirm Password"
                                    aria-label="Confirm Password"
                                    aria-describedby="basic-addon1"
                                    required
                                    name="repass"
                                    />
                                <p class="error text-danger position-absolute fw-bold"></p>
                            </div>
                            <div>
                                <label class="form-check-label"
                                       ><input type="checkbox" required="required" /> I accept the
                                    <a href="#">Terms of Use</a> &amp;
                                    <a href="#">Privacy Policy</a></label
                                >
                            </div>
                            <button
                                type="submit"
                                class="btn bg-blue text-white btn-lg fs-5 fw-bold mt-3 mb-3"
                                >
                                Sign Up
                            </button>
                            <div class="">
                                Already have an account?
                                <a href="login">Login here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="signup.js"></script>
    </body>
</html>
