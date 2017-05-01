<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Delete Skill</title>

	</head>

	<body>
		
		<h2>Remove Skill</h2>
    
    	<form:form method="post" modelAttribute = "skill">
    	
	    	<table>
	    	
	        	<tr>
	        	
	                <td><form:label path="idSkill">IdSkill</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" /></td>
	                <td><form:errors path = "idSkill" cssClass = "error" /></td>
	           
	            </tr>
	            
	        </table>
	    	
	    	<input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/skill/main.html'" name = "cancel" value = "Cancel">
    	
    	</form:form>

	</body>

</html>