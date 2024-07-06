<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" />
</head>
<body>
    <div class="container">
        <h2>User Profile</h2>
        <div class="mb-4">
            <label class="form-label">Name:  ${enduser.name}</label>
           
        </div>
        <div class="mb-4">
            <label class="form-label">Email:  ${enduser.email}</label>
            
        </div>
        <div class="mb-4">
            <label class="form-label">Phone:  ${enduser.phone}</label>
           
        </div>
        <div class="mb-4">
            <label class="form-label">NRC:  ${enduser.NRC}</label>
           
        </div>
        <div class="mb-4">
            <label class="form-label">State/Region:  ${enduser.current_state}</label>
         
        </div>
        <div class="mb-4">
            <label class="form-label">Gender:  ${enduser.gender}</label>
           
        </div>
    </div>
</body>
</html>
