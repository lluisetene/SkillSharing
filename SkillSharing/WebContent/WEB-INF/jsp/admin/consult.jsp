<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Gestión Administradores</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consultar Administrador</h2>
    
    	<form:form method="post" modelAttribute="admin">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="username">Nombre usuario</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="username" /></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Aceptar">
        	<input type = "button" name = "cancel" value = "Cancelar" onclick = "location='http://localhost:8080/SkillSharing/admin/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
    	
		        <tr>
		        
		        	<th>Nombre</th>
		        	<th>Correo</th>
		            <th>Nombre usuario</th>
		            <th>Contraseña</th>
		            
		        </tr>
		        
		        <tr>
		        
		        	<td>${adminResponse.name}</td>
		        	<td>${adminResponse.mail}</td>
		            <td>${adminResponse.username}</td>
		      		<td>${adminResponse.password}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>