<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Oferta</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>Lista Ofertas</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdOferta</th>
	            <th>DNI</th>
	            <th>Nombre</th>
	            <th>IdHabilidad</th>
	            <th>Descripcion</th>
	            <th>Fecha inicio</th>
	            <th>Fecha fin</th>
	            
	        </tr>
	        
	        <c:forEach items="${offers}" var="offer">
	          
	            <tr>
	          
	                <td>${offer.idOffer}</td>
	                <td>${offer.nid}</td>
	                <td>${offer.name}</td>
	                <td>${offer.idSkill}</td>
	                <td>${offer.description}</td>
	                <td>${offer.beginningDate}</td>
	                <td>${offer.endingDate}</td>
	                <td><a href="update/${offer.idOffer}.html">Modificar</a>
               		<td><a href="delete/${offer.idOffer}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/offer/main.html'" name = "cancel" value = "Cancelar">
    
	</body>
	
</html>