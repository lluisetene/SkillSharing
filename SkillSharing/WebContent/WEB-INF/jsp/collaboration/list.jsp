<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Colaboracion</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>Lista Colaboraciones</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdColaboracion</th>
	            <th>IdOferta</th>
	            <th>IdDemanda</th>
	            <th>Fecha inicio</th>
	            <th>Fecha fin</th>
	            <th>Horas</th>
	            <th>Valoracion</th>
	            
	        </tr>
	        
	        <c:forEach items="${collaborations}" var="collaboration">
	          
	            <tr>
	          
	                <td>${collaboration.idCollaboration}</td>
	                <td>${collaboration.idOffer}</td>
	                <td>${collaboration.idDemand}</td>
	                <td>${collaboration.beginningDate}</td>
	                <td>${collaboration.endingDate}</td>
	                <td>${collaboration.hours}</td>
	                <td>${collaboration.rate}</td>
	                <td><a href="update/${collaboration.idCollaboration}.html">Modificar</a>
               		<td><a href="delete/${collaboration.idCollaboration}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/collaboration/main.html'" name = "cancel" value = "Cancelar">
    
	</body>
	
</html>