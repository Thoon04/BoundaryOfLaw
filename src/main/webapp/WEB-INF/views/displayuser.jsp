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
<link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
	<div >
		<jsp:include page="Nav.jsp"></jsp:include>
		<div class="container-fluid">
	
		<div class="row">
		<jsp:include page="Sidebar.jsp"></jsp:include>
			<div class="col">
			<a href="addUser"><button type="button" class="btn btn-success">Add New User</button></a>
				<table class="table table-striped" id="stduentTable">
					<thead>
						<tr>
							<th scope="col">User ID</th>
							<th scope="col">User Name</th>
							<th scope="col">Details</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
							<tr>
								<td scope="row">${ user.user_id}</td>
								<td>${user.name}</td>
								<td><a href="edituser/${user.user_id}">
										<button type="button" class="btn btn-success  "
											onclick="location.href = 'USR002.html';">Update</button>
								</a></td>
								<td><a href="deleteuser/${user.user_id}">
										<button type="submit" class="btn btn-secondary mb-3"
											data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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