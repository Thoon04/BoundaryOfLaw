<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org/">
<head>

    <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
    <script
            src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <style type="text/css">
        .form-gap {
            padding-top: 70px;
        }
        body{
            background: -webkit-linear-gradient(left, #f5c6cb, #e83e8c);
        }

    </style>
</head>

<body>
<div class="form-gap"></div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3>
                            <i class="fa fa-lock fa-4x"></i>
                        </h3>
                        <h2 class="text-center">Enter OTP</h2>
                        
                        <div class="panel-body">

                            <form id="register-form"  action="/boundaryOfLaws/validateOtp" method="post" role="form" autocomplete="off"
                                  class="form" >
                                <!--                                        <p>${message}</p>-->

                                <div class="form-group">
                                    <div class="input-group">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope color-blue"></i></span> <input
                                            id="opt" name="otp" placeholder="Enter OTP"
                                            class="form-control" type="text" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="recover-submit"
                                           class="btn btn-lg btn-primary btn-block"
                                           value="Reset Password" type="submit">
                                </div>

                                <input type="hidden" class="hide" name="token" id="token"
                                       value="">
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
