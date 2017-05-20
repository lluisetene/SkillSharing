<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Demanda</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>Lista Demandas</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdDemanda</th>
	            <th>DNI</th>
	            <th>Nombre</th>
	            <th>IdHabilidad</th>
	            <th>Descripcion</th>
	            <th>Fecha inicio</th>
	            <th>Fecha fin</th>
	            
	        </tr>
	        
	        <c:forEach items="${demands}" var="demand">
	          
	            <tr>
	          
	                <td>${demand.idDemand}</td>
	                <td>${demand.nid}</td>
	                <td>${demand.name}</td>
	                <td>${demand.idSkill}</td>
	                <td>${demand.description}</td>
	                <td>${demand.beginningDate}</td>
	                <td>${demand.endingDate}</td>
	                <td><a href="update/${demand.idDemand}.html">Modificar</a>
               		<td><a href="delete/${demand.idDemand}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/demand/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>