<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/boundaryOfLaws/editcasetype" method="post">
		<div class="alert-danger col-sm-5" role="alert">${error_msg}</div>

		<div class="mb-4">
			<label class="form-lable">Id</label>
			<div class="col-sm-5">
				<input type="text" name="id" class="form-control"
					value="${casetype.id}">
			</div>
		</div>

		<div class="mb-4">
			<label class="form-lable">Name</label>
			<div class="col-sm-5">
				<input type="text" name="name" class="form-control"
					value="${casetype.name}">
			</div>
		</div>

		<div class="mb-4">
			<input type="submit" value="Edit" class="btn btn-primary">
		</div>

	</form>

</body>
</html>