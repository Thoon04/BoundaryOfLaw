<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
		src="https://cdn.jsdelivr.net/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link type="text/css" href="style.css"/>
<style>
.nav-pills li a:hover{
    background-color: rgb(66,66,243);
}
</style>
</head>
<body>
	<div
		class="d-flex flex-column justify-content-between col-auto bg-dark min-vh-100">
		<div class="mt-4">
			<a
				class="text-white d-none d-sm-inline text-decoration-none d-flex align-items-center ms-4"
				role="button"> <span class="fs-5">SystemUser</span>
			</a>
			<hr class="text-white d-none d-sm-block" />
			<ul class="nav nav-pills flex-column mt-2 mt-sm-0 " id="menu">
				<li class="nav-item my-1"><a href="lawDisplay"
					class="nav-link text-white text-center text-sm-start"
					aria-current="page"> <i class="fa-solid fa-gauge"></i> <span
						class="ms-2 d-none d-sm-inline">Laws management</span>
				</a></li>
				<li class="nav-item my-1"><a href="/boundaryOfLaws/enduser"
					class="nav-link text-white" aria-current="page"> <i
						class="fa-solid fa-house"></i> <span
						class="ms-2 d-none d-sm-inline">EndUser management</span>
				</a></li>
				<li class="nav-item my-1 disabled"><a href="#sidemenu"
					data-bs-toggle="collapse" class="nav-link text-white"
					aria-current="page"> <i class="fa fa-table"></i> <span
						class="ms-2 d-none d-sm-inline">Layer management</span> <i
						class="fa fa-caret-down"></i>
				</a>
					<ul class="nav collapse ms-1 flex-column" id="sidemenu"
						data-bs-parent="#menu">
						<li class="nav-item"><a class="nav-link text-white " href="#"
							aria-current="page">Confirmed Layer</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">Rejected
								Layer</a></li>
					</ul></li>
				<li class="nav-item my-sm-1 my-2"><a href="#"
					class="nav-link text-white text-center text-sm-start"
					aria-current="page"> <i class="fa fa-users"></i> <span
						class="ms-2 d-none d-sm-inline">Case management</span>
				</a></li>
				<li class="nav-item my-sm-1 my-2"><a href="#"
					class="nav-link text-white text-center text-sm-start"
					aria-current="page"> <i class="fa fa-users"></i> <span
						class="ms-2 d-none d-sm-inline">CaseType management</span>

				</a></li>
				<li class="nav-item my-sm-1 my-2"><a href="displayUser"
					class="nav-link text-white text-center text-sm-start"
					aria-current="page"> <i class="fa fa-users"></i> <span
						class="ms-2 d-none d-sm-inline">User management</span>
				</a></li>
			</ul>
			<a href="/boundaryOfLaws/pdf">Click</a>

		</div>

	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" integrity="sha512-u3fPA7V8qQmhBPNT5quvaXVa1mnnLSXUep5PS1qo5NRzHwG19aHmNJnj1Q8hpA/nBWZtZD4r4AX6YOt5ynLN2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>