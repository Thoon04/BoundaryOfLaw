<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"></script>

<style>
.eye-icon {
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
}

.password-container {
	position: relative;
}
</style>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
        var nrc = document.getElementById('NRC').value.trim();
        var phone = document.getElementById('phone').value.trim();
        var gender = document.querySelector('input[name="gender"]:checked');
        var password = document.getElementById('password').value.trim();
        var confirmPassword = document.getElementById('confirmPassword').value.trim();

        var specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;
        var capitalLetterPattern = /[A-Z]/;

        if (!name) {
            document.getElementById('nameError').innerHTML = "Name is required";
            isValid = false;
        }

        if (!email) {
            document.getElementById('emailError').innerHTML = "Email is required";
            isValid = false;
        } else if (!email.includes('@') || !email.includes('.')) {
            document.getElementById('emailError').innerHTML = "Email must contain @ and a domain";
            isValid = false;
        }

        if (!nrc) {
            document.getElementById('nrcError').innerHTML = "NRC is required";
            isValid = false;
        }
        
        var nrcError = document.getElementById('nrcError').innerHTML;
        if (nrcError) {
            isValid=false;
        }

        if (!phone) {
            document.getElementById('phoneError').innerHTML = "Phone is required";
            isValid = false;
        } else if (phone.length < 7 || phone.length > 15) {
            document.getElementById('phoneError').innerHTML = "Phone number must be between 7 and 15 digits";
            isValid = false;
        }

        if (!gender) {
            document.getElementById('genderError').innerHTML = "Gender is required";
            isValid = false;
        }

        if (!password) {
            document.getElementById('passwordError').innerHTML = "Password is required";
            isValid = false;
        } else if (password.length < 8) {
            document.getElementById('passwordError').innerHTML = "Password must be at least 8 characters long";
            isValid = false;
        } else if (!specialCharPattern.test(password)) {
            document.getElementById('passwordError').innerHTML = "Password must contain at least one special character";
            isValid = false;
        } else if (!capitalLetterPattern.test(password)) {
            document.getElementById('passwordError').innerHTML = "Password must contain at least one capital letter";
            isValid = false;
        }


        if (!confirmPassword) {
            document.getElementById('confirmPasswordError').innerHTML = "Confirm Password is required";
            isValid = false;
        } else if (password !== confirmPassword) {
            document.getElementById('confirmPasswordError').innerHTML = "Passwords do not match";
            isValid = false;
        }

        return isValid;
    }
    
    function togglePassword(fieldId, icon) {
        var field = document.getElementById(fieldId);
        if (field.type === "password") {
            field.type = "text";
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            field.type = "password";
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
</script>
</head>
<body>
	<%
	String message = request.getParameter("message");
	%>
	<c:set var="message" scope="session" value="${message }" />
	<div>
		<jsp:include page="Nav.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="Sidebar.jsp"></jsp:include>
				<div class="col bg-primary-subtle border border-primary-subtle">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-6">
								<h4 class="text-center">User Registration</h4>
								<div class="text-danger text-center">${error_msg}</div>
								<form action="/boundaryOfLaws/addUser" method="post"
									id="addUserForm" enctype="multipart/form-data"
									onsubmit="return validateForm();">
									<div class="mb-4">
										<div class="col-sm-12">
											<input type="hidden" class="form-control"
												value="${user.user_id}" id="user_id" name="user_id">
										</div>
									</div>
									<div class="mb-4">
										<label for="name" class="form-label">Name</label>
										<div class="col-sm-12">
											<input type="text" class="form-control" value="${user.name}"
												id="name" name="name">
											<p id="nameError" class="text-danger error-message"></p>
										</div>
									</div>

									<div class="mb-4">
										<label for="email" class="form-label">Email</label>
										<div class="col-sm-12">
											<input type="text" class="form-control" id="email"
												value="${user.email}" name="email">
											<p id="emailError" class="text-danger error-message"></p>
										</div>
									</div>
									<div class="mb-4">
										<label for="password" class="form-label">Password</label>
										<div class="password-container">
											<input type="password" value="${user.password}"
												class="form-control" id="password" name="password">
											<i class="fas fa-eye eye-icon"
												onclick="togglePassword('password', this)"></i>
										</div>
										<p id="passwordError" class="text-danger error-message"></p>
									</div>
									<div class="mb-4">
										<label for="confirmPassword" class="form-label">Confirm
											Password</label>
										<div class="password-container">
											<input type="password" class="form-control"
												id="confirmPassword" name="confirmPassword"> <i
												class="fas fa-eye eye-icon"
												onclick="togglePassword('confirmPassword', this)"></i>
										</div>
										<p id="confirmPasswordError" class="text-danger error-message"></p>
									</div>
									<div class="mb-4">
										<label for="phone" class="form-label">Phone</label>
										<div class="col-sm-12">
											<input type="number" value="${user.phone}" placeholder="+95"
												class="form-control" id="phone" name="phone">
											<p id="phoneError" class="text-danger error-message"></p>
										</div>
									</div>
									<div class="mb-4">
										<label for="NRC" class="form-label">NRC</label>
										<div class="col-sm-12">
											<input type="text" class="form-control" id="NRC"
												value="${user.NRC}" name="NRC">
											<p id="nrcError" class="text-danger error-message"></p>
											<p class="text-danger error-message">${nrcError}</p>
										</div>
									</div>
									<div class="col-form-label col-md-12 pt-0">Gender</div>
									<div class="col-md-12">
										<div class="form-check-inline">
											<input type="radio" class="form-check-input" value="Male"
												id="male" name="gender"
												${user.gender == 'Male' ? 'checked' : ''}checked > <label
												class="form-check-label" for="male"> Male </label>
										</div>
										<div class="form-check-inline">
											<input type="radio" class="form-check-input" value="Female"
												id="female" name="gender"
												${user.gender == 'Female' ? 'checked' : ''}>
											<label class="form-check-label" for="female"> Female
											</label>
										</div>
										<div class="form-check-inline">
											<input type="radio" class="form-check-input" value="Other"
												id="other" name="gender"
												${user.gender == 'Other' ? 'checked' : ''}> <label
												class="form-check-label" for="other"> Other </label>
										</div>
										<p id="genderError" class="text-danger error-message"></p>
									</div>
									<input type="hidden" class="form-control" value="pending"
										id="status" name="status"> <input type="hidden"
										class="form-control" value="user" id="role" name="role">

									<div class="mb-4 text-center">
										<input type="submit" value="Add" id="btnAdd"
											class="btn btn-primary"> <input type="button"
											value="Reset" id="btnReset" class="btn btn-warning">
									</div>
								</form>
								<script>
								$('#btnAdd').on('click',function(e){
									e.preventDefault();
									Swal.fire({
										  title: "Do you want Add new User?",
										  showDenyButton: true,
											confirmButtonColor: "#ff0000",
											denyButtonColor: "#474A59",
										  confirmButtonText: "Add",
										  denyButtonText: "Cancel"
										}).then((result) => {
										  /* Read more about isConfirmed, isDenied below */
										  if (result.isConfirmed) {
											  $('#addUserForm').attr('action', '/boundaryOfLaws/addUser').submit();
										  } else if (result.isDenied) {
										    
										  }
										});
								});
								
								$('#btnReset').on('click',function(e){
									document.getElementById('addUserForm').reset();
								})
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>