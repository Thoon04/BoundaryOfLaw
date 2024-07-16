
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        .btn-detail{
            color: rgb(0, 76, 255);
        }
        .btn-detail:hover{
            color: rgb(0, 41, 136);
            transform: scale(1.2);
        }
        .btn-confirm{
            color: rgb(4, 131, 12);
        }
        .btn-confirm:hover{
            color: rgb(0, 62, 4);
            transform: scale(1.2);
        }
        .btn-reject{
            color: rgb(255, 0, 0);
        }
        .btn-reject:hover{
            color: rgb(196, 0, 0);
            transform: scale(1.2);
        }
    </style>
</head>
  <body>
    <div class="d-flex justify-content-center align-items-center mt-5">
      <table class="table table-striped table-hover table-secondary w-75">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone</th>
            <th scope="col">Case</th>
            <th class="text-center" scope="col">Status</th>
            <th scope="col"></th>
           
          </tr>
        </thead>
        
    
           
        <tbody>
          <c:forEach var="data" items="${RAList}" varStatus="status">
          <tr>
            <th scope="row">${status.index + 1}</th>
            <td>${ data.user_name}</td>
            <td>${data.email}</td>
            <td>${data.phone}</td>
            <td>${data.casetype_name} (${data.case_sub_code})</td>
            <td class="text-center">${data.apply_case_status}</td>
            <td><i title="Detail" class="fa-solid fa-circle-info btn-detail"></i></td>
          </tr>
           </c:forEach>
        </tbody>
       
      </table>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
      integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
