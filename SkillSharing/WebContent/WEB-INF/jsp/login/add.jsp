<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />

		<title>Add Admin</title>

	</head>

	<body>
    
    	<h2>New Admin</h2>
    	
	    <form:form method="post" modelAttribute="userlogin"> 
			
			<table>
			
	        	<tr>
	        	
	                <td><form:label path="username">Username</form:label></td>
	                <td><form:input type = "text" maxlength = "30" path="username" /></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	                	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="password">Password</form:label></td>
	                <td><form:input type = "password" maxlength = "30" path="password" /></td>
	                <td><form:errors path="password" cssClass="error" /></td>
	                
	            </tr>
	            
	        </table>
	    
	    	<input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/login/main.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    	
	</body>
	
</html>