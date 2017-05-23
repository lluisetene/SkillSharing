<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
		
		<title>Habilidad</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
				
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consultar Habilidad</h2>
    
    	<form:form method="post" modelAttribute="skill">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idSkill">IdHabilidad</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" /></td>
	                <td><form:errors path = "idSkill" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Aceptar">
        	<input type = "button" name = "cancel" value = "Cancelar" onclick = "location='http://localhost:8080/SkillSharing/skill/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
   			
	   		 	<tr>
	   		 	
		            <th>IdHabilidad</th>
		            <th>Nombre</th>
		            <th>Nivel</th>
		        	<th>Descripcion</th>
		        
		        </tr>
		        
		        <tr>
		        
		            <td>${skillResponse.idSkill}</td>
		            <td>${skillResponse.name}</td>
		            <td>${skillResponse.level}</td>
		      		<td>${skillResponse.description}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>