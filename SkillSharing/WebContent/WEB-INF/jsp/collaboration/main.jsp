<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>Collaboration</title>

	</head>

	<body>
	
		<h1>Available operations</h1>
	
		<ul>
		
			<li><a href = "add.html">Add</a></li>
			<li><a href = "update.html">Update</a></li>
			<li><a href = "delete.html">Delete</a></li>
			<li><a href = "consult.html">Consult</a></li>
			<li><a href = "list.html">List</a></li>	
		
		</ul>

	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/index.jsp'" name = "cancel" value = "<< Tables">

	</body>

</html>