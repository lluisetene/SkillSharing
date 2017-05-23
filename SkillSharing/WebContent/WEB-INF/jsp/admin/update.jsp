<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />
		
		<title>Gestión Administradores</title>

	</head>

	<body>
    
    	<h2>Actualizar Datos</h2>
    
    	<form:form method="post" modelAttribute="admin">
        
	        <table>
	        
	        	<tr>
	        	
	                <td><form:label path="name">Nombre</form:label></td>
	                <td><form:input type = "text" maxlength = "30" path="name" /></td>
	                <td><form:errors path="name" cssClass="error" /></td>
	                	                
	            </tr>
	            
	            <tr>
	        	
	                <td><form:label path="mail">Correo</form:label></td>
	                <td><form:input type = "email" maxlength = "30" path="mail" /></td>
	                <td><form:errors path="mail" cssClass="error" /></td>
	                	                
	            </tr>
			
	        	<tr>
	        	
	                <td><form:label path="username">Nombre usuario</form:label></td>
	                <td><form:input type = "text" maxlength = "30" path="username" readonly="true" /></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="password">Contraseña</form:label></td>
	                <td><form:input type = "password" maxlength = "30" path="password" /></td>
	                <td><form:errors path="password" cssClass="error" /></td>
	                
	            </tr>
	            
	        </table>
	        
	        <input type = "submit" name = "submit" value = "Aceptar">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/admin/main.html'" name = "cancel" value = "Cancelar">
	   
    	</form:form>
    
	</body>

</html>