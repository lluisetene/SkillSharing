<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />
		
		<title>Delete Skill</title>

	</head>

	<body>
    
    	<h2>Delete Skill</h2>
    
    	<form:form method="post" modelAttribute="skill">
        
	        <table>
	        	
	        	<tr>
	                
	             
	                <td><form:input type = "hidden" maxlength = "5" path="idSkill" /></td>
	                <td><form:errors path = "idSkill" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	               
	                <td><form:input type = "hidden" maxlength = "50" path="name" /></td>
	                <td><form:errors path = "name" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	        
					<td><select id="level" name="level" style="display:none">
						<option value="medio" selected="selected">medio</option>
						<option value="alto">alto</option>
						<option value="bajo">bajo</option>
					</select></td>
	            
	            </tr>
	            
	            <tr>
	            
	          
	                <td><form:input type = "hidden" maxlength = "300" path="description" /></td>
	            
	            </tr>
	        
	        </table>
	        
	        ¿Seguro que desea borrar la habilidad con id ${skill.idSkill}?
	        <br><br>
	        
	        <input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/skill/list.html'" name = "cancel" value = "Cancel">
	   
    	</form:form>
    
	</body>

</html>