<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<title>CaseTypes List</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link rel="stylesheet" href="resources/css/style.css" />

</head>
<body>
	<div class="col">
		<c:if test="${not empty message}">
			<div class="alert alert-info">${message}</div>
		</c:if>

		<div class="container mt-5">
			<h1 class="mb-4">CaseTypes List</h1>

<a href="/boundaryOfLaws/addcasetype"
								class="btn btn-sm btn-info">Add</a> 

			<!-- Table for displaying PDF files -->
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>CaseType Name</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="casetype" items="${casetypes}">
						<tr>
							<td>${casetype.id}</td>
							<td>${casetype.name}</td>
							<td><a href="/boundaryOfLaws/editcasetype/${casetype.id}"
								class="btn btn-sm btn-info">Edit</a> <a
								href="/boundaryOfLaws/deletecasetype/${casetype.id}"
								class="btn btn-sm btn-danger">Delete</a>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>
