<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
		
		<title>Oferta</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consultar Oferta</h2>
    
    	<form:form method="post" modelAttribute="offer">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idOffer">IdOferta</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idOffer" /></td>
	                <td><form:errors path = "idOffer" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Aceptar">
        	<input type = "button" name = "cancel" value = "Cancelar" onclick = "location='http://localhost:8080/SkillSharing/offer/main.html'"/>
   			
   			<br>
   			<br>
   			
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
		        
		        <tr>
		        
		            <td>${offerResponse.idOffer}</td>
		            <td>${offerResponse.nid}</td>
		            <td>${offerResponse.name}</td>
		            <td>${offerResponse.idSkill}</td>
		            <td>${offerResponse.description}</td>
		            <td>${offerResponse.beginningDate}</td>
		            <td>${offerResponse.endingDate}</td>
		           	<td><a href="update/${offer.idOffer}.html">Modificar</a>
               		<td><a href="delete/${offer.idOffer}.html">Eliminar</a>
		            
		            
		        </tr> 
   			
   			</table> 
   			
    	</form:form>
    
	</body>
	
</html>