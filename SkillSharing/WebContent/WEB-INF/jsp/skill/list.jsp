<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Habilidad</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>Lista Habilidad</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdHabilidad</th>
	            <th>Nombre</th>
	            <th>Nivel</th>
	            <th>Descripcion</th>
	            
	        </tr>
	        
	        <c:forEach items="${skills}" var="skill">
	          
	            <tr>
	          
	                <td>${skill.idSkill}</td>
	                <td>${skill.name}</td>
	                <td>${skill.level}</td>
	           		<td>${skill.description}</td>
	           		<td><a href="update/${skill.idSkill}.html">Modificar</a>
               		<td><a href="delete/${skill.idSkill}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/skill/main.html'" name = "cancel" value = "Cancelar">
    
	</body>
	
</html>