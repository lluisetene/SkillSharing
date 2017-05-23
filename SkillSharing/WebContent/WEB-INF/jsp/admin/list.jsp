<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="es-ES">

	<head>
	
		<title>Gestión Administradores</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>Lista Administradores</h1>
     
    	<table>
    	
	        <tr>
	        
	        	<th>Nombre</th>
	        	<th>Correo</th>
	            <th>Nombre usuario</th>
	            <th>Contraseña</th>
	            
	        </tr>
	        
	        <c:forEach items="${admins}" var="admin">
	          
	            <tr>
	          
	          		<td>${admin.name}</td>
	          		<td>${admin.mail}</td>
	                <td>${admin.username}</td>
	           		<td>${admin.password}</td>
	           		<td><a href="update/${admin.username}.html">Modificar</a>
               		<td><a href="delete/${admin.username}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/admin/main.html'" name = "cancel" value = "Cancelar">
    
	</body>
	
</html>