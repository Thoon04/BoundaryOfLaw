<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
	integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"
	integrity="sha512-u3fPA7V8qQmhBPNT5quvaXVa1mnnLSXUep5PS1qo5NRzHwG19aHmNJnj1Q8hpA/nBWZtZD4r4AX6YOt5ynLN2g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function validateForm() {
            // Clear previous error messages
            var errorMessages = document.querySelectorAll('.error-message');
            errorMessages.forEach(function (msg) {
                msg.innerHTML = "";
            });

            var isValid = true;

            var name = document.getElementById('name').value.trim();
            var email = document.getElementById('email').value.trim();
            var password = document.getElementById('password').value.trim();
            var con_password = document.getElementById('confirm_password').value.trim();
            var phone = document.getElementById('phone').value.trim();
            var nrc = document.getElementById('NRC').value.trim();
            
            var gender = document.querySelector('input[name="gender"]:checked');
            

            if (!name) {
                document.getElementById('nameError').innerHTML = "Name is required";
                isValid = false;
            }

            if (!email) {
                document.getElementById('emailError').innerHTML = "Email is required";
                isValid = false;
            }

            if (!nrc) {
                document.getElementById('nrcError').innerHTML = "NRC is required";
                isValid = false;
            }

            if (!phone) {
                document.getElementById('phoneError').innerHTML = "Phone is required";
                isValid = false;
            }

            if (!gender) {
                document.getElementById('genderError').innerHTML = "Gender is required";
                isValid = false;
            }

            if (!password) {
                document.getElementById('passwordError').innerHTML = "Password is required";
                isValid = false;
            }if (!con_password) {
                document.getElementById('passwordError').innerHTML = "Confirm Password is required";
                isValid = false;
            }

            return isValid;
        }
    </script>
</head>
<body>
	<div >
		<jsp:include page="Nav.jsp"></jsp:include>
		<div class="container-fluid">
	
		<div class="row">
		<jsp:include page="Sidebar.jsp"></jsp:include>
			<div class="col  bg-primary-subtle border border-primary-subtle">
			<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h4 class="text-center">User Registration</h4>
                <div class="text-danger text-center">${error_msg}</div>
                <form action="/boundaryOfLaws/displayUser" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
                	<div class="mb-4">
                        <div class="col-sm-12">
                            <input type="hidden" class="form-control" id="user_id" name="user_id">
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="name" class="form-label">User Name</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="name" name="name">
                            <p id="nameError" class="text-danger error-message"></p>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="email" class="form-label">Email</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="email" name="email">
                            <p id="emailError" class="text-danger error-message"></p>
                        </div>
                    </div>
					<div class="mb-4">
                        <label for="password" class="form-label">Password</label>
                        <div class="col-sm-12">
                            <input type="password" class="form-control" id="password" name="password">
                            <p id="passwordError" class="text-danger error-message"></p>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Confirm Password</label>
                        <div class="col-sm-12">
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password">
                            <p id="passwordError" class="text-danger error-message"></p>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="phone" class="form-label">Phone</label>
                        <div class="col-sm-12">
                            <input type="text" placeholder="+95" class="form-control" id="phone" name="phone">
                            <p id="phoneError" class="text-danger error-message"></p>
                        </div>
                    </div>

                    <div class="col-form-label col-md-12 pt-0">Gender</div>
                    <div class="col-md-12">
                        <div class="form-check-inline">
                            <input type="radio" class="form-check-input" value="Male" id="male" name="gender" ${user.gender == 'Male' ? 'checked' : ''}> 
                            <label class="form-check-label" for="male"> Male </label>
                        </div>
                        <div class="form-check-inline">
                            <input type="radio" class="form-check-input" value="Female" id="female" name="gender" ${user.gender == 'Female' ? 'checked' : ''}> 
                            <label class="form-check-label" for="female"> Female </label>
                        </div>
                        <div class="form-check-inline">
                            <input type="radio" class="form-check-input" value="Other" id="other" name="gender" ${user.gender == 'Other' ? 'checked' : ''}> 
                            <label class="form-check-label" for="other"> Other </label>
                        </div>
                        <p id="genderError" class="text-danger error-message"></p>
                    </div>
					<div class="mb-4">
                        <label for="NRC" class="form-label">NRC</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="NRC" name="NRC">
                            <p id="nrcError" class="text-danger error-message"></p>
                        </div>
                    </div>
                 <input type="hidden" class="form-control" value="SystemUser" id="role" name="role">

                    <div class="mb-4 text-center">
                        <input type="submit" value="Add" class="btn btn-primary">
                        <input type="button" value="Reset" class="btn btn-warning">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <c:if test="${not empty success_msg}">
        <script>
            swal({
                title: "Success!",
                text: "${success_msg}",
                icon: "success",
                button: "OK",
            });
        </script>
    </c:if>
			</div>
		</div>
	</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
		integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"
		integrity="sha512-u3fPA7V8qQmhBPNT5quvaXVa1mnnLSXUep5PS1qo5NRzHwG19aHmNJnj1Q8hpA/nBWZtZD4r4AX6YOt5ynLN2g=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>