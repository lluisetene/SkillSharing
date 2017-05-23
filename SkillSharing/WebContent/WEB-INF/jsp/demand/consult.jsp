<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Demanda</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consultar Demandas</h2>
    
    	<form:form method="post" modelAttribute="demand">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idDemand">IdDemanda</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDemand" /></td>
	                <td><form:errors path = "idDemand" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Aceptar">
        	<input type = "button" name = "cancel" value = "Cancelar" onclick = "location='http://localhost:8080/SkillSharing/demand/main.html'"/>
   			
   			<br>
   			<br>
   			
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
		        
		        <tr>
		        
		            <td>${demandResponse.idDemand}</td>
		            <td>${demandResponse.nid}</td>
		            <td>${demandResponse.name}</td>
		            <td>${demandResponse.idSkill}</td>
		            <td>${demandResponse.description}</td>
		            <td>${demandResponse.beginningDate}</td>
		            <td>${demandResponse.endingDate}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>