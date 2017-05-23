<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Grado</title>

	</head>

	<body>
    
    	<h2>Nuevo Grado</h2>
    	
	    <form:form method="post" modelAttribute="degree">
		       
			<table>
			
	        	<tr>
	        	
	                <td><form:label path="idDegree">IDCarrera</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDegree" /></td>
	                <td><form:errors path = "idDegree" cssClass = "error" /></td>
	                	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Nombre</form:label></td>
	                <td><form:input type = "text" maxlength = "100" path="name" /></td>
	                <td><form:errors path = "name" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="nid">DNI</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	                <td><form:errors path = "nid" cssClass = "error" /></td>
	                
	            </tr>
	        
	        </table>
	        
	        	<input type = "submit" name = "submit" value = "Aceptar">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/degree/main.html'" name = "cancel" value = "Cancelar">
	    
	    </form:form>
	    	
	</body>
	
</html>