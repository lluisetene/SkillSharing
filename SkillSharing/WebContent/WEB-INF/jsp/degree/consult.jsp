<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Grado</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consultar Grado</h2>
    
    	<form:form method="post" modelAttribute="degree">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idDegree">IdCarrera</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDegree" /></td>
	                <td><form:errors path = "idDegree" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Aceptar">
        	<input type = "button" name = "cancel" value = "Cancelar" onclick = "location='http://localhost:8080/SkillSharing/degree/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
   			
	   		 	<tr>
	   		 	
		            <th>IdCarrera</th>
		            <th>Nombre</th>
		            <th>DNI</th>
		        
		        </tr>
		        
		        <tr>
		        
		            <td>${degreeResponse.idDegree}</td>
		            <td>${degreeResponse.name}</td>
		            <td>${degreeResponse.nid}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>