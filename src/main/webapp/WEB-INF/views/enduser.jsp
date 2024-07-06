<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.min.css"/>'/>
<script>
function validateForm() {
    let isValid = true;

    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;
    let phone = document.getElementById("phone").value;
    let nrc = document.getElementById("NRC").value;
    let currentState = document.getElementById("current_state").value;
    let gender = document.querySelector('input[name="gender"]:checked');

    // Clear previous error messages
    document.getElementById("nameError").innerText = "";
    document.getElementById("emailError").innerText = "";
    document.getElementById("passwordError").innerText = "";
    document.getElementById("phoneError").innerText = "";
    document.getElementById("nrcError").innerText = "";
    document.getElementById("stateError").innerText = "";
    document.getElementById("genderError").innerText = "";

    if (!name) {
        document.getElementById("nameError").innerText = "Name must be filled out";
        isValid = false;
    }
    if (!email) {
        document.getElementById("emailError").innerText = "Email must be filled out";
        isValid = false;
    }
    if (!password) {
        document.getElementById("passwordError").innerText = "Password must be filled out";
        isValid = false;
    }
    if (!phone) {
        document.getElementById("phoneError").innerText = "Phone must be filled out";
        isValid = false;
    }
    if (!nrc) {
        document.getElementById("nrcError").innerText = "NRC must be filled out";
        isValid = false;
    }
    if (!currentState) {
        document.getElementById("stateError").innerText = "State/Region must be selected";
        isValid = false;
    }
    if (!gender) {
        document.getElementById("genderError").innerText = "Gender must be selected";
        isValid = false;
    }

    return isValid;
}
</script>
</head>
<body>
    <div class="container">
        <h4>User</h4>
        <div class="text-danger">${error_msg}</div>
        <form:form action="/boundaryOfLaws/addenduser" method="post" modelAttribute="enduser" onsubmit="return validateForm()">
            <div class="mb-4">
                <div class="col-sm-3">
                    <form:input type="hidden" id="id" class="form-control" path="id"></form:input>
                </div>
            </div>
            <div class="mb-4">
                <form:label path="name" class="form-label">UserName</form:label>
                <div class="col-sm-3">
                    <form:input type="text" id="name" class="form-control" path="name"></form:input>
                    <div id="nameError" class="text-danger"></div>
                </div>
                <form:errors path="name" cssClass="text-danger"></form:errors>
            </div>
            <div class="mb-4">
                <form:label path="email" class="form-label">Email</form:label>
                <div class="col-sm-3">
                    <form:input type="email" id="email" class="form-control" path="email"></form:input>
                    <div id="emailError" class="text-danger"></div>
                </div>
                <form:errors path="email" cssClass="text-danger"></form:errors>
            </div>
            <div class="mb-4">
                <form:label path="password" class="form-label">Password</form:label>
                <div class="col-sm-3">
                    <form:input type="text" id="password" class="form-control" path="password"></form:input>
                    <div id="passwordError" class="text-danger"></div>
                </div>
                <form:errors path="password" cssClass="text-danger"></form:errors>
            </div>
            <div class="mb-4">
                <form:label path="phone" class="form-label">Phone</form:label>
                <div class="col-sm-3">
                    <form:input type="phone" id="phone" class="form-control" path="phone" value="+95"></form:input>
                    <div id="phoneError" class="text-danger"></div>
                </div>
                <form:errors path="phone" cssClass="text-danger"></form:errors>
            </div>
            <div class="mb-4">
                <form:label path="NRC" class="form-label">NRC</form:label>
                <div class="col-sm-3">
                    <form:input type="text" id="NRC" class="form-control" path="NRC"></form:input>
                    <div id="nrcError" class="text-danger"></div>
                </div>
                <form:errors path="NRC" cssClass="text-danger"></form:errors>
            </div>
            <div class="mb-4">
                <form:label path="current_state" class="form-label"></form:label>
                <label for="current_state" class="form-label">State/Region</label>
                <div class="col-sm-3">
                    <form:select id="current_state" path="current_state" class="form-control">
                        <form:option value="" label="Select your state/region" />
                        <form:option value="ygn" label="Yangon Region" />
                        <form:option value="mdy" label="Mandalay Region" />
                        <form:option value="mgy" label="Magway Region" />
                        <form:option value="sgi" label="Sagaing Region" />
                        <form:option value="ayd" label="Ayeyarwady Region" />
                        <form:option value="tny" label="Tanintharyi Region" />
                        <form:option value="pg" label="Bago Region" />
                        <form:option value="kachin" label="Kachin State" />
                        <form:option value="kayar" label="Kayah State" />
                        <form:option value="kayin" label="Kayin State" />
                        <form:option value="chin" label="Chin State" />
                        <form:option value="mon" label="Mon State" />
                        <form:option value="rakhaing" label="Rakhine State" />
                        <form:option value="shan" label="Shan State" />
                    </form:select>
                    <div id="stateError" class="text-danger"></div>
                </div>
                <form:errors path="current_state" cssClass="text-danger"></form:errors>
            </div>
            <div class="mb-4">
                <div class="col-sm-3">
                    <label for="gender" class="register_form">Gender</label>
                    <div class="gender-container">
                        <label><input type="radio" name="gender" value="male" /> Male</label>
                        <label><input type="radio" name="gender" value="female" /> Female</label>
                        <label><input type="radio" name="gender" value="other" /> Other</label>
                    </div>
                    <div id="genderError" class="text-danger"></div>
                </div>
                <form:errors path="gender" cssClass="text-danger"></form:errors>
            </div>
            <div class="mb-4">
                <div class="col-sm-3">
                    <form:input type="hidden" class="form-control" path="status" value="pending"></form:input>
                </div>
            </div>
            <div class="mb-3">
                <input type="submit" name="register" value="Register" class="btn btn-primary" />
                <input type="reset" name="reset" value="Cancel" class="btn btn-secondary" />
            </div>
        </form:form>
    </div>
</head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link rel="stylesheet" href="resources/css/style.css" />
<body class="Register">
	<div class="register_form">
		<div class="form">
		<form:form class="userregistration_form" style="background-color:smoke-white;margin:350px" action="/boundaryOfLaws/addenduser" method="post" modelAttribute="enduser">
				<h2>EndUserRegistration</h2>
			<div class="mb-4">
					<input type="hidden" class="form-control" name="id" placeholder="ID"
						path="id"></input>
				</div>

				<div class="mb-3">
					<lable for="username" class="form-lable">Username</lable>
					<input type="text" class="form-control" name="name"
						placeholder="Username" path="name" />

				</div>


				<div class="mb-3">
					<lable for="email" class="form-lable">Email</lable>
					<input type="email" class="form-control" name="email"
						placeholder="Email" path="email" />
				</div>


				<div class="mb-3">
					<lable for="password" class="form-lable">Password </lable>

					<input type="password" class="form-control" name="password"
						placeholder="Password" path="password" />
				</div>


				<div class="mb-3">
					<lable for="phone" class="form-lable"> Phone</lable>
					<input type="text" class="form-control" name="phone"
						placeholder="+95" path="phone" value="+95" />

				</div>


				<div class="mb-3">
					<lable for="NRC" class="form-lable">NRC</lable>

					<input type="text" class="form-control" name="NRC"
						placeholder="NRC" path="NRC" />

				</div>



				<div class="mb-3">
					<lable for="current_state" class="form-lable" path="current_state">Current_State</lable>
					<select name="current_state" required>
						<option value="" disabled selected>Select your state</option>
						<option value="ygn">Yangon</option>
						<option value="mdy">Mandalay</option>
						<option value="npt">NaypyiTaw</option>
					</select>


				</div>



				<div class="mb-3">
					<lable for="id" class="form-lable" path="gender">Gender </lable>

					<div class="gender-container">
						<label><input type="radio" name="gender" value="male">
							Male</label> <label><input type="radio" name="gender"
							value="female"> Female</label> <label><input type="radio"
							name="gender" value="other"> Other</label>
					</div>

				</div>

				<div>
					<form:input type="hidden" class="form-control" path='status'></form:input>
				</div>

				<input type="submit" name="register" value="Register"
					class="btn btn-primary">
			</form:form>

		</div>
	</div>

</body>
</html>
