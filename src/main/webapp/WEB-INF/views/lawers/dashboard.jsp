<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

<style>

body {
    background-color: rgb(205, 200, 200);
  }

  .custom-bg-color {
    background-color: rgb(69, 54, 54) !important;
    color: white !important; /* Change text color to white for better contrast */
}

.custom-active-link {
    background-color: rgb(69, 54, 54) !important;
    color: white !important; /* Change text color to white for better contrast */
}

.custom-active-link:hover {
    background-color: rgb(179, 179, 179) !important; /* Optional: Different hover color */
}

.none-shadow:focus {
	box-shadow: none !important;
}

.nav-link {
	font-size: 18px !important;
	font-weight: 500 !important;
	color: rgb(249, 245, 245) !important;
}

.nav-link:hover {
	background: rgb(185, 181, 181) !important;
	color: rgb(0, 0, 0) !important;
	font-weight: 500;
}

.text-tran {
	color: transparent !important;
}

.navbar {
	box-shadow: 0px 8px 16px rgba(11, 11, 11, 0.3);
  background-color: rgb(69, 58, 58) !important;
}

.offcanvas {
	background-color: rgb(83, 74, 74) !important;
}

.ml-2 {
	margin-left: 0.5rem;
}

.go-pf {
	background: rgb(39, 39, 39) !important;
	color: rgb(28, 28, 28) !important;
	font-weight: 500;
}

.custom-close-btn {
    background-color: rgb(69, 54, 54) !important;
    color: white !important;
    border: none !important;
}

.custom-close-btn:hover {
  background: rgb(185, 181, 181) !important;
	color: rgb(32, 21, 21) !important;
}

.custom-hamburger-btn:hover {
    background-color: rgb(185, 181, 181) !important; /* Background color on hover */
    color: rgb(32, 21, 21)!important; /* Icon color on hover */
}
</style>
</head>
<body>
	<nav class="navbar bg-secondary text-white fixed-top">
		<div class="container-fluid">
			<div class="d-flex justify-content-center align-items-center">
				<div class="navbar-brand text-white"
					style="font-size: 25px; font-weight: 500">
					Boundary Of Law</div>

          <button class="btn btn-outline-light none-shadow custom-hamburger-btn" type="button"
          style="font-size: 18px" data-bs-toggle="offcanvas"
          data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"
          aria-label="Toggle navigation">
          <i class="fa-solid fa-bars"></i>
      </button>
      
			</div>
			<div class="offcanvas offcanvas-start bg-secondary w-25"
				tabindex="-1" id="offcanvasNavbar"
				aria-labelledby="offcanvasNavbarLabel">
				<div class="d-flex justify-content-evenly align-items-center mt-2">
					<div class="navbar-brand text-white"
						style="font-size: 25px; font-weight: 500">
						Boundary Of Law</div>
					<button type="button" class="btn btn-light none-shadow rounded-5 custom-close-btn"
						style="margin-right: 8px; font-size: 15px"
						data-bs-dismiss="offcanvas" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item">
              <a class="nav-link active custom-active-link p-0 rounded-3 px-4 py-2 mb-2" aria-current="page" href="dashboard">
                  <i class="fa-solid fa-chart-column"></i>
                  <span class="ml-2">Dashboard</span>
              </a>
          </li>
          
                <li class="nav-item">
                  <a class="nav-link active custom-active-link p-0 rounded-3 px-4 py-2 mb-2" aria-current="page" href="#">
                    <i class="fa-solid fa-user-clock"></i>
    
                      <span class="ml-2">Pending-Case List</span>
                  </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active custom-active-link p-0 rounded-3 px-4 py-2 mb-2" aria-current="page" href="#"><i
								class="fa-solid fa-user-check"></i><span class="ml-2">Confirm-Case List</span></a></li>
                  <li class="nav-item">
                    <a class="nav-link active custom-active-link p-0 rounded-3 px-4 py-2 mb-2" aria-current="page" href="#"><i
								class="fa-solid fa-user-xmark"></i><span class="ml-2">Reject-Case List</span></a></li>
                  <li class="nav-item">
                    <a class="nav-link active custom-active-link p-0 rounded-3 px-4 py-2 mb-2" aria-current="page" href="profile"><i
								class="fa-solid fa-user-gear"></i><span class="ml-2">Profile Setting</span></a></li>
					</ul>
				</div>
				<div class="mb-3 p-3">
          <div class="bg-light custom-bg-color rounded-3 p-2 align-content-center">
              <div class="d-flex justify-content-center">
                  <div class="text-center">
                      <div class="mb-2">
                          <img class="rounded-3"
                              src="data:image/jpeg;base64,${lawer.photo}"
                              style="height: 80px; width: 80px; object-fit: cover"
                              alt="user's photo" />
                      </div>
                      <div style="font-size: 20px">${lawer.name }</div>
                  </div>
              </div>
          </div>
      </div>
      
			</div>
			<a class="navbar-brand text-white"
				style="font-size: 25px; font-weight: 500" href="#">DashBoard</a>
		</div>
	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</body>
</html>
