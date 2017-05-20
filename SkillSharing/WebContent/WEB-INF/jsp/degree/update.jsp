<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
		
		<title>Grado</title>

	</head>

	<body>
    
    	<h2>Modificar Grado</h2>
    
    	<form:form method="post" modelAttribute="degree">
        
	        <table>
	        	
	        	<tr>
	                
	                <td><form:label path="idDegree">IdGrado</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDegree" disabled = "true"/></td>
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
	        
	        <input type = "submit" name = "submit" value = "Aceptar" onclick = "document.getElementById('idDegree').disabled=false;">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/degree/list.html'" name = "cancel" value = "Cancelar">
	   
    	</form:form>
    
	</body>

</html>