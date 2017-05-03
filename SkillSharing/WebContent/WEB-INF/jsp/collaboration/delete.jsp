<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Delete Collaboration</title>

	</head>

	<body>
		
		<h2>Remove Collaboration</h2>
    
    	<form:form method="post" modelAttribute = "collaboration">
    	
	    	<table>
	    	
	        	<tr>
	        	
	                <td><form:label path="idCollaboration">IdCollaboration</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idCollaboration" /></td>
	                <td><form:errors path = "idCollaboration" cssClass = "error" /></td>
	           
	            </tr>
	            
	        </table>
	    	
	    	<input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/collaboration/main.html'" name = "cancel" value = "Cancel">
    	
    	</form:form>

	</body>

</html>