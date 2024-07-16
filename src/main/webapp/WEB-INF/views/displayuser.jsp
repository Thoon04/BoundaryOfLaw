<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
	rel="stylesheet" />
<link type="text/css" href="resources/css/style.css" />
<style>
body {
	background: #ddd;
	font-family: "Raleway";
}

.center {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.popup {
	width: 350px;
	height: 280px;
	padding: 30px 20px;
	background: #f5f5f5;
	border-radius: 10px;
	box-sizing: border-box;
	z-index: 2;
	text-align: center;
	opacity: 0;
	top: -200%;
	transform: translate(-50%, -50%) scale(0.5);
}

.popup.active {
	opacity: 1;
	top: 50%;
	transform: translate(-50%, -50%) scale(1);
	transition: transform 300ms cubic-bezier(0.18, 0.89, 0.43, 1.19);
	transition: opacity 300ms ease-in-out, top 1000ms ease-in-out, transform
		1000ms ease-in-out;
}

.popup .icon {
	margin: 5px 0px;
	width: 50px;
	height: 50px;
	border: 2px solid #ff0000;
	text-align: center;
	display: inline-block;
	border-radius: 50%;
	line-height: 60px;
}

.popup .icon i.fa {
	font-size: 30px;
	background-image: linear-gradient(to right, #ff00ff 10%, #ff0000 100%);
}

.popup .title {
	margin: 5px 0px;
	font-size: 30px;
	font-weight: 600;
}

.popup .description {
	color: #222;
	font-size: 20px;
	padding: 5px;
}

.popup .dismiss-btn {
	margin-top: 15px;
}

.popup .dismiss-btn button {
	padding: 10px 20px;
	background: #111;
	color: #f5f5f5;
	border: 2px solid #111;
	font-size: 16px;
	font-weight: 600;
	outline: none;
	border-radius: 10px;
	cursor: pointer;
	transition: all 300ms ease-in-out;
}

.popup .dismiss-btn button:hover {
	color: #111;
	background: #f5f5f5;
}

.popup>div {
	position: relative;
	top: 10px;
	opacity: 0;
}

.popup.active>div {
	top: 0px;
	opacity: 1;
}

.popup.active .icon {
	transition: all 300ms ease-in-out 250ms;
}

.popup.active .title {
	transition: all 300ms ease-in-out 300ms;
}

.popup.active .description {
	transition: all 300ms ease-in-out 350ms;
}

.popup.active .dismiss-btn {
	transition: all 300ms ease-in-out 400ms;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="Nav.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="Sidebar.jsp"></jsp:include>
				<div class="col">
					<div>
						<c:if test="${message != ''}">
							<div class="popup center">
								<div class="icon">
									<i class="fa fa-check"></i>
								</div>
								<div class="title">Success!</div>
								<div class="description">${message }</div>
								<div class="dismiss-btn">
									<button id="dismiss-popup-btn" onclick="Ok()">Ok</button>
								</div>
							</div>
						</c:if>
					</div>
					<a href="addUser"><button type="button"
							class="btn btn-success m-3">Add New User</button></a>
					<table class=" table-hover mr-3 display order-column"
						id="userTable">
						<thead>
							<tr>
								<th scope="col">User ID</th>
								<th scope="col">User Name</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td scope="row">${ user.user_id}</td>
									<td>${user.name}</td>
									<td><a href="editUser/${user.user_id}">
											<button type="button" class="btn btn-success">Update</button>
									</a> <a href="deleteUser/${user.user_id}">
											<button type="button" class="btn btn-secondary btnDelete">Delete</button>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<script>
	                        $(document).ready(function() {
	                            $('#userTable').DataTable();
	
	                            $('#userTable tbody').on('click', '.btnDelete', function(e) {
	                                e.preventDefault();
	                                var deleteUrl = $(this).closest('a').attr('href');
	
	                                Swal.fire({
	                                    title: "Do you want to delete the selected user?",
	                                    showDenyButton: true,
	                                    confirmButtonColor: "#ff0000",
	                                    denyButtonColor: "#474A59",
	                                    confirmButtonText: "Delete",
	                                    denyButtonText: "Cancel"
	                                }).then((result) => {
	                                    if (result.isConfirmed) {
	                                        window.location.href = deleteUrl;
	                                    }
	                                });
	                            });
	
	                            var messageFromController = "${message}";
	                            if (messageFromController !== "") {
	                                document.getElementsByClassName("popup")[0].classList.add("active");
	                            }
	                        });
	
	                        function Ok() {
	                            document.getElementsByClassName("popup")[0].classList.remove("active");
	                        };
	                    </script>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
</body>
</html>
