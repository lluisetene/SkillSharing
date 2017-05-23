<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Gestion Administradores</title>

	</head>

	<body>
    
    	<h2>Eliminar Administrador</h2>
    	
	    <form:form method="post" modelAttribute="admin"> 
			
			<table>
			
				<tr>
	        	
	                <td><form:input type = "hidden" maxlength = "30" path="name" /></td>
	                <td><form:errors path="name" cssClass="error" /></td>
	                	                
	            </tr>
			
				<tr>
	        	
	                <td><form:input type = "hidden" maxlength = "30" path="mail" /></td>
	                <td><form:errors path="mail" cssClass="error" /></td>
	                	                
	            </tr>
			
			
	        	<tr>
	        	
	                <td><form:input type = "hidden" maxlength = "30" path="username" /></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	                	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:input type = "hidden" maxlength = "30" path="password" /></td>
	                <td><form:errors path="password" cssClass="error" /></td>
	                
	            </tr>
	            
	        </table>
	    
	        
        	¿Seguro que desea borrar al administrador ${admin.name}?
        	<br><br>
        
        	<input type = "submit" name = "submit" value = "Aceptar">
        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/admin/list.html'" name = "cancel" value = "Cancelar">
	    
	    </form:form>
	    	
	</body>
	
</html>