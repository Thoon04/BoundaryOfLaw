<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lawyer Registration</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.preview-img {
	max-width: 100px;
	max-height: 100px;
	margin-top: 10px;
}

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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>




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
        var currentState = document.getElementById('current_state').value;
        var price = document.getElementById('price').value.trim();
        var photo = document.getElementById('photo').value;
        var caseTypeId = document.getElementById('case_type_id').value;
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

        if (!currentState || currentState == "choose") {
            document.getElementById('stateError').innerHTML = "State/Region is required";
            isValid = false;
        }

        if (!price) {
            document.getElementById('priceError').innerHTML = "Price is required";
            isValid = false;
        }

        if (!photo) {
            document.getElementById('photoError').innerHTML = "Photo is required";
            isValid = false;
        }

        if (!caseTypeId || caseTypeId == "choose") {
            document.getElementById('caseTypeError').innerHTML = "Case Type is required";
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



<body
	style="background-color: rgb(163, 157, 157);">


	<div class="container">
		<div class="row justify-content-center">


			<div class="card my-5" style= "background-color:  rgb(205, 200, 200)">
				<div class="card-body text-black">
					<form action="/boundaryOfLaws/lawyer-register" method="post"
						enctype="multipart/form-data" onsubmit="return validateForm();">
						<h4 class="text-center text-dark mb-4">
							Lawyer Registration<i class="fas fa-gavel"></i>
						</h4>
						<div class="text-danger text-center mb-4">${error_msg}</div>
						<div class="row mb-4">
							<div class="col-md-6">
								<label for="name" class="form-label" style="margin-left: 15px">Name</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="${user.name}"
										id="name" name="name">
									<p id="nameError" class="text-danger error-message"></p>
								</div>
							</div>

							<div class="col-md-6">
								<label for="email" class="form-label" style="margin-left: 15px">Email</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="email"
										value="${user.email}" name="email">
									<p id="emailError" class="text-danger error-message"></p>
								</div>
							</div>
						</div>

						<div class="row mb-4">
							<div class="col-md-6">

								<label for="NRC" class="form-label" style="margin-left: 15px">NRC</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="NRC"
										value="${user.NRC}" name="NRC">
									<p id="nrcError" class="text-danger error-message"></p>
									<p class="text-danger error-message">${nrcError}</p>
								</div>
							</div>

							<div class="col-md-6">
								<label for="phone" class="form-label" style="margin-left: 15px">Phone</label>
								<div class="col-sm-12">
									<input type="number" value="${user.phone}" placeholder="+95"
										class="form-control" id="phone" name="phone">
									<p id="phoneError" class="text-danger error-message"></p>
								</div>
							</div>
						</div>

						<div class="row mb-4">
							<div class="col-md-4">
								<div class="col-form-label col-md-12 pt-0"
									style="margin-left: 15px">Gender</div>
								<div class="col-md-12">
									<div class="form-check-inline">
										<input type="radio" class="form-check-input" value="Male"
											id="male" name="gender"
											${user.gender == 'Male' ? 'checked' : ''} checked> <label
											class="form-check-label" for="male"> Male </label>
									</div>
									<div class="form-check-inline">
										<input type="radio" class="form-check-input" value="Female"
											id="female" name="gender"
											${user.gender == 'Female' ? 'checked' : ''}> <label
											class="form-check-label" for="female"> Female </label>
									</div>
									<div class="form-check-inline">
										<input type="radio" class="form-check-input" value="Other"
											id="other" name="gender"
											${user.gender == 'Other' ? 'checked' : ''}> <label
											class="form-check-label" for="other"> Other </label>
									</div>
									<p id="genderError" class="text-danger error-message"></p>
								</div>
							</div>

							<div class="col-md-4 ">
								<div class="col-from-label col-md-12 pt-0">State/Region</div>
								<div class="col-md-12">
									<select name="current_state" class="form-select"
										aria-label="current_state" id="current_state">
										<option value="choose" disabled ${lawer.currentState==null?'selected' : ''}>Choose...</option>
										<option value="Ayeyarwady Region"
											${lawer.currentState == 'Ayeyarwady Region' ? 'selected' : ''}>Ayeyarwady
											Region</option>
										<option value="Bago Region"
											${lawer.currentState == 'Bago Region' ? 'selected' : ''}>Bago
											Region</option>
										<option value="Magway Region"
											${lawer.currentState == 'Magway Region' ? 'selected' : ''}>Magway
											Region</option>
										<option value="Mandalay Region"
											${lawer.currentState == 'Mandalay Region' ? 'selected' : ''}>Mandalay
											Region</option>
										<option value="Sagaing Region"
											${lawer.currentState == 'Sagaing Region' ? 'selected' : ''}>Sagaing
											Region</option>
										<option value="Tanintharyi Region"
											${lawer.currentState == 'Tanintharyi Region' ? 'selected' : ''}>Tanintharyi
											Region</option>
										<option value="Yangon Region"
											${lawer.currentState == 'Yangon Region' ? 'selected' : ''}>Yangon
											Region</option>
										<option value="Naypyidaw Region"
											${lawer.currentState == 'Naypyidaw Region' ? 'selected' : ''}>Naypyidaw
											Region</option>
										<option value="Kachin State"
											${lawer.currentState == 'Kachin State' ? 'selected' : ''}>Kachin
											State</option>
										<option value="Kayah State"
											${lawer.currentState == 'Kayah State' ? 'selected' : ''}>Kayah
											State</option>
										<option value="Kayin State"
											${lawer.currentState == 'Kayin State' ? 'selected' : ''}>Kayin
											State</option>
										<option value="Mon State"
											${lawer.currentState == 'Mon State' ? 'selected' : ''}>Mon
											State</option>
										<option value="Rakhine State"
											${lawer.currentState == 'Rakhine State' ? 'selected' : ''}>Rakhine
											State</option>
										<option value="Shan State"
											${lawer.currentState == 'Shan State' ? 'selected' : ''}>Shan
											State</option>
										<option value="Chin State"
											${lawer.currentState == 'Chin State' ? 'selected' : ''}>Chin
											State</option>
									</select>

								</div>
								<p id="stateError" class="text-danger error-message"></p>
							</div>

							<div class="col-md-4">
								<div class="col-from-label col-md-12 pt-0">Case Type</div>
								<div class="col-md-12">
									<select id="case_type_id" name="case_type_id"
										class="form-select">
										<option value="choose" disabled ${lawer.caseTypeId==null?'selected' : ''}>Choose...</option>
										<c:forEach var='caseType' items='${case_types}'>
											<option value='${caseType.id}'>${caseType.name}</option>
										</c:forEach>
									</select>

								</div>
								<p id="caseTypeError" class="text-danger error-message"></p>
							</div>

						</div>

						<div class="row mb-4">
							<div class="col-md-6">

								<label for="price" class="form-label" style="margin-left: 15px">Price</label>
								<div class="col-sm-12">
									<input type="number" value="${lawer.price}"
										class="form-control" placeholder="xxxxKyats" id="price"
										name="price">
									<p id="priceError" class="text-danger error-message"></p>
								</div>
							</div>




							<div class="col-4">
								<label for="photo" class="form-label" style="margin-left: 15px">Photo</label>
								<div class="col-sm-12">
									<input type="file" class="form-control" accept="image/*"
										id="photo" name="photo"
										value="data:image/jpeg;base64,${lawer.photo}"
										onchange="previewPhoto(event)">
								</div>
								<p id="photoError" class="text-danger error-message"></p>
							</div>
							<div class="col-2">
								<img src="data:image/jpeg;base64,${lawer.photo}" alt=""
									class="preview-img" id="photoPreview" />
							</div>
							<div class="col-5"></div>
						</div>

						<div class="row mb-4">
							<div class="col-md-6 px-4">
								<label for="password" class="form-label">Password</label>
								<div class="password-container">
									<input type="password" value="${user.password}"
										class="form-control" id="password" name="password"> <i
										class="fas fa-eye eye-icon"
										onclick="togglePassword('password', this)"></i>
								</div>
								<p id="passwordError" class="text-danger error-message"></p>
							</div>



							<div class="col-md-6 px-4">
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
						</div>


						<input type="hidden" class="form-control" value="pending"
							id="status" name="status"> <input type="hidden"
							class="form-control" value="lawyer" id="role" name="role">

						<div class=" text-center">
							<input type="submit" value="Submit form" class="btn btn-info">
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>


	<c:if test="${not empty success_msg}">
		<div class="">
		
		</div>
	</c:if>

	<script>
        function previewPhoto(event) {
            var reader = new FileReader();
            reader.onload = function(){
                var output = document.getElementById('photoPreview');
                output.src = reader.result;
                output.style.display = 'block';
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

	<script>
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

	<!-- <script>
    $(document).ready(function() {
        $('#NRC').on('blur', function() {
            var nrc = $(this).val().trim();
            if (nrc) {
                $.ajax({
                    url: '/lawyer/checkNRC',
                    type: 'GET',
                    data: { nrc: nrc },
                    success: function(response) {
                        if (response) {
                            $('#nrcError').text('NRC is already in use.');
                        } else {
                            $('#nrcError').text('');
                        }
                    },
                    error: function() {
                        $('#nrcError').text('Error checking NRC.');
                    }
                });
            }
        });
    });
 </script> -->


</body>
</html>
