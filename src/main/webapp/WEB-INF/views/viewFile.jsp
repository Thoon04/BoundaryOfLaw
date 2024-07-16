<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div>
		<jsp:include page="Nav.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="Sidebar.jsp"></jsp:include>
				<div class="col">
					<h1>Viewing PDF File: ${pdfFile.name}</h1>

   			        <c:forEach var="imageUrl" items="${imageUrls}">
         				   <img src="${imageUrl}" alt="PDF Page" style="width: 100%; max-width: auto; height: auto;"><br>
       				 </c:forEach>
			
				</div>
			</div>
		</div>
	</div>

</body>
</html>