<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Grado</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>Lista Grados</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IDGrado</th>
	            <th>Nombre</th>
	            <th>DNI</th>
	            
	        </tr>
	        
	        <c:forEach items="${degrees}" var="degree">
	          
	            <tr>
	          
	                <td>${degree.idDegree}</td>
	                <td>${degree.name}</td>
	                <td>${degree.nid}</td>
	                <td><a href="update/${degree.idDegree}.html">Modificar</a>
               		<td><a href="delete/${degree.idDegree}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/degree/main.html'" name = "cancel" value = "Cancelar">
    
	</body>
	
</html>