<%-- 
    Document   : getemailactive
    Created on : Mar 3, 2023, 5:55:57 PM
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
    <title>Bootstrap 5 Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body>
    <div class="container d-flex flex-column">
      <div class="row align-items-center justify-content-center
          min-vh-100">
        <div class="col-12 col-md-8 col-lg-4">
          <div class="card shadow-sm">
            <div class="card-body">
              <div class="mb-4">
                <h5>Get Security Code</h5>
                <p class="mb-2">(*)Nhập email để lấy mã bảo mật
                </p>
              </div>
                <form method="post">
                <div class="mb-3">
                  <label for="email" class="form-label ">Email</label>
                  <input type="email" id="email" class="form-control" name="email" placeholder="Nhập Email Của Bạn"
                    required="">
                  <p class=" error  text-danger position-absolute fw-bold text-small">${requestScope.err}</p>
                </div>
                <br/>
                <div class="mb-3 d-grid">
                  <button type="submit" class="btn btn-primary">
                    Get Code
                  </button>
                </div>
                <span>Nếu bạn chưa có tài khoản <a href="signup">sign up</a> ngay</span>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

 
</html>
