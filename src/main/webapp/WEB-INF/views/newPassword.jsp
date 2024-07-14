<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org/">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Password</title>
    </head>
    <body>
        <h2>Enter New Password</h2>
        <form  action="/boundaryOfLaws/newPassword" method="post" >
            <label for="password1">New Password:</label><br>
            <input type="password" id="password1" name="password1"><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
