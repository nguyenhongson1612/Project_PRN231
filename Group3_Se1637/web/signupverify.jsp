<%-- 
    Document   : signupverify
    Created on : Feb 24, 2023, 8:16:51 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <link rel="stylesheet" href="signupverify.css" />
    </head>
    <body>
        <div class="container">
            <!-- Instructions -->
            <div class="row">
                <div class="alert alert-success col-md-12" role="alert" id="notes">
                    <h4>NOTES</h4>
                    <ul>
                        <li>You will recieve a verification code on your mail after you registered. Enter that code below.</li>
                        <li>If somehow, you did not recieve the verification email then <a href="resendcode">resend the verification email</a></li>
                    </ul>
                </div>
            </div>
            <!-- Verification Entry Jumbotron -->
            <div class="row">
                <div class="col-md-12">
                      <p class="text-danger fw-bold text-center">${requestScope.mess}</p>
                    <div class="jumbotron text-center">
                        
                        <h2>Enter the verification code</h2>
                        <form method="post" role="form">
                            <div class="col-md-9 col-sm-12">
                                <div class="form-group form-group-lg">
                                    <input type="text" class="form-control col-md-6 col-sm-6 col-sm-offset-2" name="verifyCode" required>
                                    <input class="btn btn-primary btn-lg col-md-2 col-sm-2" type="submit" value="Verify">
                                </div>
                            </div>
                           
                        </form>
                         
                    </div>
                  
                </div>
            </div>
        </div>

    </body>
</html>