<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Estudiante</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>Lista Estudiante</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>DNI</th>
	            <th>Nombre</th>
	            <th>Nombre usuario</th>
	            <th>Contraseña</th>
	            <th>Correo</th>
	            <th>Curso</th>
	            <th>Horas Ofertadas</th>
	            <th>Horas Demandadas</th>
	            <th>Baneado</th>
	            
	        </tr>
	        
	        <c:forEach items="${students}" var="student">
	          
	            <tr>
	          
	                <td>${student.nid}</td>
	                <td>${student.name}</td>
	                <td>${student.username}</td>
	           		<td>${student.password}</td>
	           		<td>${student.mail}</td>
	                <td>${student.course}</td>
	                <td>${student.offerHours}</td>
	           		<td>${student.demandHours}</td>
	           		<td>${student.banned}</td>
	           		<td><a href="update/${student.nid}.html">Modificar</a>
               		<td><a href="delete/${student.nid}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/main.html'" name = "cancel" value = "Cancelar">
    
	</body>
	
</html>