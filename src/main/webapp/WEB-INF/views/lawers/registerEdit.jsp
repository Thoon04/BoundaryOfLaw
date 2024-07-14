<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>Edit Lawyer</title>

<style>
.custom-edit-btn {
  background-color: #453a3a !important;
  color: white !important;
  border: none !important;
}

.custom-edit-btn:hover {
  color: rgb(255, 255, 255) !important;
  transform: scale(1.05); /* Scale the button up by 5% */
}

.blur-bg {
  background-color: rgba(163, 157, 157, 0.5);
  border: none !important;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px); /* For Safari */
}

.preview-img {
  max-width: 150px;
  max-height: 150px;
  margin-top: 15px;
  border-radius: 50%; /* Makes the image round */
}

hr {
  color: #453a3a;
}

.form-control {
  background: transparent !important;
  color: rgb(0, 0, 0) !important;
  border: 1px solid #453a3a !important;
  border-left: none !important;
  border-right: none !important;
  border-top: none !important;
  border-radius: 0px !important;
}

.form-select {
  background: transparent !important;
  color: rgb(0, 0, 0) !important;
  border: 1px solid #453a3a !important;
  border-left: none !important;
  border-right: none !important;
  border-top: none !important;
  border-radius: 0px !important;
}

option {
  background-color: rgb(83, 74, 74) !important;
  color: white !important;
}


input:focus {
  border: 1px solid  rgb(45, 201, 253) !important;
  border-left: none !important;
  border-right: none !important;
  border-top: none !important;
  border-radius: 0px !important;
  box-shadow: none !important;
}

select:focus {
  border: 1px solid  rgb(45, 201, 253) !important;
  border-left: none !important;
  border-right: none !important;
  border-top: none !important;
  border-radius: 0px !important;
  box-shadow: none !important;
}


</style>

<script>
function validateForm() {
    var isValid = true;
    
    // Clear previous error messages
    $('.error-message').text('');

    var name = $('#name').val().trim();
    var email = $('#email').val().trim();
    var nrc = $('#NRC').val().trim();
    var phone = $('#phone').val().trim();
    var gender = $('input[name="gender"]:checked').val();
    var currentState = $('#current_state').val();
    var price = $('#price').val().trim();
    var caseTypeId = $('#case_type_id').val();
    
 

    var specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;
    var capitalLetterPattern = /[A-Z]/;

    if (!name) {
        $('#nameError').text("Name is required");
        isValid = false;
    }

    if (!email) {
        $('#emailError').text("Email is required");
        isValid = false;
    } else if (!email.includes('@') || !email.includes('.')) {
        $('#emailError').text("Email must contain @ and a domain");
        isValid = false;
    }

    if (!nrc) {
        $('#nrcError').text("NRC is required");
        isValid = false;
    }
    
    var nrcError = $('#nrcError').text();
    if (nrcError) {
        isValid = false;
    }

    if (!phone) {
        $('#phoneError').text("Phone is required");
        isValid = false;
    } else if (phone.length < 7 || phone.length > 15) {
        $('#phoneError').text("Phone number must be between 7 and 15 digits");
        isValid = false;
    }

    if (!gender) {
        $('#genderError').text("Gender is required");
        isValid = false;
    }

    if (!currentState || currentState == "choose") {
        $('#stateError').text("State/Region is required");
        isValid = false;
    }

    if (!price) {
        $('#priceError').text("Price is required");
        isValid = false;
    }

    if (!caseTypeId || caseTypeId == "choose") {
        $('#caseTypeError').text("Case Type is required");
        isValid = false;
    }

    
    return isValid;
}
</script>
</head>
<body>

<form action="/boundaryOfLaws/editLawer" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">

<section style="background-color: rgb(255, 255, 255); min-height: 100vh" class="d-flex justify-content-center align-items-center">
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-4">
                <div class="card h-100 blur-bg" >
                    <div class="card-body align-self-center text-center text-black">
                        <img src="data:image/jpeg;base64,${lawer.photo}" alt="Lawyer Photo" class="preview-img" id="photoPreview" />
                       
                        <p class="mt-3" style="font-style: italic; font-weight: 500">${lawer.role.toUpperCase()}</p>
                        <h5 class="my-3">
                            <input type="text" class="form-control" value="${lawer.name}" id="name" name="name">
                        </h5>
                        <p id="nameError" class="text-danger error-message"></p>
                       
                        <select name="current_state" class="form-select" aria-label="current_state" id="current_state">
                            <option value="choose" disabled ${lawer.currentState == null ? 'selected' : ''}>Choose...</option>
                            <option value="Ayeyarwady Region" ${lawer.currentState == 'Ayeyarwady Region' ? 'selected' : ''}>Ayeyarwady Region</option>
                            <option value="Bago Region" ${lawer.currentState == 'Bago Region' ? 'selected' : ''}>Bago Region</option>
                            <option value="Magway Region" ${lawer.currentState == 'Magway Region' ? 'selected' : ''}>Magway Region</option>
                            <option value="Mandalay Region" ${lawer.currentState == 'Mandalay Region' ? 'selected' : ''}>Mandalay Region</option>
                            <option value="Sagaing Region" ${lawer.currentState == 'Sagaing Region' ? 'selected' : ''}>Sagaing Region</option>
                            <option value="Tanintharyi Region" ${lawer.currentState == 'Tanintharyi Region' ? 'selected' : ''}>Tanintharyi Region</option>
                            <option value="Yangon Region" ${lawer.currentState == 'Yangon Region' ? 'selected' : ''}>Yangon Region</option>
                            <option value="Naypyidaw Region" ${lawer.currentState == 'Naypyidaw Region' ? 'selected' : ''}>Naypyidaw Region</option>
                            <option value="Kachin State" ${lawer.currentState == 'Kachin State' ? 'selected' : ''}>Kachin State</option>
                            <option value="Kayah State" ${lawer.currentState == 'Kayah State' ? 'selected' : ''}>Kayah State</option>
                            <option value="Kayin State" ${lawer.currentState == 'Kayin State' ? 'selected' : ''}>Kayin State</option>
                            <option value="Mon State" ${lawer.currentState == 'Mon State' ? 'selected' : ''}>Mon State</option>
                            <option value="Rakhine State" ${lawer.currentState == 'Rakhine State' ? 'selected' : ''}>Rakhine State</option>
                            <option value="Shan State" ${lawer.currentState == 'Shan State' ? 'selected' : ''}>Shan State</option>
                            <option value="Chin State" ${lawer.currentState == 'Chin State' ? 'selected' : ''}>Chin State</option>
                        </select>
                        <div class="d-flex justify-content-center mb-2 mt-4">
                            <button type="button" class="btn custom-edit-btn w-25" onclick="window.history.back();">
                                <i class="fas fa-arrow-left"></i>
                            </button>
                            <button type="submit" class="btn custom-edit-btn w-75 ms-2">Confirm Edit</button>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card text-black h-100 blur-bg" >
                    <div class="card-body">
                       
                        <div class="row mb-3">
                            <label for="email" class="col-sm-3 col-form-label"><i class="fas fa-envelope"></i> Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="email" name="email" value="${lawer.email}">
                                <p id="emailError" class="text-danger error-message"></p>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label for="phone" class="col-sm-3 col-form-label"><i class="fa-solid fa-phone"></i> Phone</label>
                            <div class="col-sm-9">
                                <input type="tel" class="form-control" id="phone" name="phone" value="${lawer.phone}">
                                <p id="phoneError" class="text-danger error-message"></p>
                            </div>
                        </div>
                        
                         <div class="row mb-3">
                            <label for="gender" class="col-sm-3 col-form-label"><i class="fas fa-venus-mars"></i> Gender</label>
                            <div class="col-sm-9">
                               <div class="form-check-inline">
										<input type="radio" class="form-check-input" value="Male"
											id="male" name="gender"
											${lawer.gender == 'Male' ? 'checked' : ''} checked> <label
											class="form-check-label" for="male"> Male </label>
									</div>
									<div class="form-check-inline">
										<input type="radio" class="form-check-input" value="Female"
											id="female" name="gender"
											${lawer.gender == 'Female' ? 'checked' : ''}> <label
											class="form-check-label" for="female"> Female </label>
									</div>
									<div class="form-check-inline">
										<input type="radio" class="form-check-input" value="Other"
											id="other" name="gender"
											${lawer.gender == 'Other' ? 'checked' : ''}> <label
											class="form-check-label" for="other"> Other </label>
									</div>
                                <p id="genderError" class="text-danger error-message"></p>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label for="NRC" class="col-sm-3 col-form-label"><i class="fas fa-id-card"></i> NRC</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="NRC" name="NRC" value="${lawer.nrc}">
                                <p id="nrcError" class="text-danger error-message"></p>
                            </div>
                        </div>
                        
                         <div class="row mb-3">
                            <label for="case_type_id" class="col-sm-3 col-form-label"><i class="fas fa-balance-scale"></i> Case</label>
                            <div class="col-sm-9">
                               <select id="case_type_id" name="case_type_id"
										class="form-select">
										<option value="choose" disabled ${lawer.caseTypeId==null?'selected' : ''}>Choose...</option>
										<c:forEach var='caseType' items='${case_types}'>
											<option value='${caseType.id}'>${caseType.name}</option>
										</c:forEach>
									</select>
                                <p id="caseTypeError" class="text-danger error-message"></p>
                            </div>
                        </div>
                       
                        <div class="row mb-3">
                            <label for="price" class="col-sm-3 col-form-label"><i class="fas fa-dollar-sign"></i> Price</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" id="price" name="price" value="${lawer.price}">
                                <p id="priceError" class="text-danger error-message"></p>
                            </div>
                        </div>
                       
                       
                                <input type="hidden" class="form-control" id="id" name="id" value="${lawer.id}">
                               	
                       
                               
                      
                              


                        
                       </div>
                    </div>
                </div>
            </div>
        </div>
    
</section>

</form>

</body>
</html>