<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Log in</title>
	
	</head>

	<body>
    
    	<h2>Autenticacion</h2>
    	
    		<form:form method="post" modelAttribute="login" action="${pageContext.request.contextPath}/login.html">
    		
        	<p>
        
        	    <form:label path="username">Nombre usuario</form:label>
    	        <form:input path="username" />
	            <form:errors path="username" cssClass="error" />
            
        	</p>
        
        	<p>
        
            	<form:label path="password">Contraseña</form:label>
            	<form:password path="password" />
            	<form:errors path="password" cssClass="error" />
            
        	</p>
                
        	<input type="submit" value="Log in" />
        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/index.jsp'" name = "cancel" value = "Cancelar">
        
    	</form:form>
    	
	</body>
		
</html>