<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Colaboracion</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;

	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consultar Colaboracion</h2>
    
    	<form:form method="post" modelAttribute="collaboration">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idCollaboration">IdColaboracion</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idCollaboration" /></td>
	                <td><form:errors path = "idCollaboration" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Aceptar">
        	<input type = "button" name = "cancel" value = "Cancelar" onclick = "location='http://localhost:8080/SkillSharing/collaboration/main.html'"/>
   			
   			<br>
   			<br>
   			
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
		        
		        <tr>
		        
		            <td>${collaborationResponse.idCollaboration}</td>
		            <td>${collaborationResponse.idOffer}</td>
		            <td>${collaborationResponse.idDemand}</td>
		            <td>${collaborationResponse.beginningDate}</td>
		            <td>${collaborationResponse.endingDate}</td>
		            <td>${collaborationResponse.hours}</td>
		            <td>${collaborationResponse.rate}</td>
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>