<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
		
		<title>Gestion Demandas</title>

	</head>

	<body>
	
		<h1>Operaciones disponibles</h1>
	
		<ul>
		
			<li><a href = "add.html">Añadir</a></li>
			<li><a href = "consult.html">Consultar</a></li>
			<li><a href = "list.html">Listar</a></li>	
		
		</ul>

	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/index.jsp'" name = "cancel" value = "<< Tablas">

	</body>

</html>