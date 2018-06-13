<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false" %> <!--to be used When expression language is ignored -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRUD</title>
</head>
<body>
<h2> Enter details</h2>
<c:if test="${user.userId == 0}">
<c:url value="adduser" var="add"></c:url>
<form:form action="${add}" modelAttribute="user" method="post">
	Name:<br> <form:input path="username"/><br><br>
	Password:<br> <form:password path="password"/><br><br>
	Contact no:<br> <form:input path="phone_number"/><br><br>
	<input type="submit" value="Submit">
	
</form:form>
</c:if>

<c:if test="${user.userId != 0}">

<c:url value="updateuser" var="update"></c:url>
<form:form action="${update}" modelAttribute="user">
	Id:<br> <form:input path="userId"/><br><br>
	Name:<br> <form:input path="username"/><br><br>
	Password:<br> <form:input path="password"/><br><br>
	Contact no:<br> <form:input path="phone_number"/><br><br>
	<input type="submit" value="Update">
	
</form:form>
</c:if>
<br>
<h2>User List</h2>
<table border="1px black">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Contact no.</th>
			
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.userId}</td>
				<td>${user.username}</td>
				<td>${user.phone_number}</td>
				<td><a href="edituser${user.userId}">Update</a></td>
				<td><a href="deleteuser${user.userId}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>