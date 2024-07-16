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
                if (!name) {
            document.getElementById('nameError').innerHTML = "Name is required";
            isValid = false;
        }
                return isValid;
    }
        

</style>

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
								<h4 class="text-center">Add CaseType Form</h4>
								<div class="text-danger text-center">${error_msg}</div>
								<form action="/boundaryOfLaws/addcasetype" method="post"
									id="addCasetypeForm" enctype="multipart/form-data"
									onsubmit="return validateForm();">
									<div class="mb-4">
										<div class="col-sm-12">
											<input type="hidden" class="form-control"
												value="${casetype.id}" id="id" name="id">
										</div>
									</div>
									<div class="mb-4">
										<label for="name" class="form-label">Name</label>
										<div class="col-sm-12">
											<input type="text" class="form-control" value="${casetype.name}"
												id="name" name="name">
											<p id="nameError" class="text-danger error-message"></p>
										</div>
									</div>

									
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
											  $('#addCaseTypeForm').attr('action', '/boundaryOfLaws/addcasetype').submit();
										  } else if (result.isDenied) {
										    
										  }
										});
								});
								
								$('#btnReset').on('click',function(e){
									document.getElementById('addCaseTypeForm').reset();
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