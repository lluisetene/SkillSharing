<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />
		
		<title>Update Skill</title>

	</head>

	<body>
    
    	<h2>Change Skill</h2>
    
    	<form:form method="post" modelAttribute="skill">
        
	        <table>
	        	
	        	<tr>
	                
	                <td><form:label path="idSkill">IdSkill</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" /></td>
	                <td><form:errors path = "idSkill" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">name</form:label></td>
	                <td><form:input type = "text" maxlength = "50" path="name" /></td>
	                <td><form:errors path = "name" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="level">level</form:label></td>
					<td><select id="level" name="level">
						<option value="medio" selected="selected">medio</option>
						<option value="alto">alto</option>
						<option value="bajo">bajo</option>
					</select></td>
	            
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="description">description</form:label></td>
	                <td><form:input type = "text" maxlength = "300" path="description" /></td>
	            
	            </tr>
	        
	        </table>
	        
	        <input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/skill/main.html'" name = "cancel" value = "Cancel">
	   
    	</form:form>
    
	</body>

</html>