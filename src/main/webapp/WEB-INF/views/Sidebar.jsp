
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex flex-column justify-content-between col-auto bg-dark min-vh-100">
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
</body>
</html>