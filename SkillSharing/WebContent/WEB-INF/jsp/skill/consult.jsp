<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />

		<title>Consult Skill</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
				font-size:12px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consult Skill</h2>
    
    	<form:form method="post" modelAttribute="skill">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idSkill">IdSkill</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" /></td>
	                <td><form:errors path = "idSkill" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Accept">
        	<input type = "button" name = "cancel" value = "Cancel" onclick = "location='http://localhost:8080/SkillSharing/skill/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
   			
	   		 	<tr>
	   		 	
		            <th>IdSkill</th>
		            <th>Name</th>
		            <th>Level</th>
		        	<th>Description</th>
		        
		        </tr>
		        
		        <tr>
		        
		            <td>${skillResponse.idSkill}</td>
		            <td>${skillResponse.name}</td>
		            <td>${skillResponse.level}</td>
		      		<td>${skillResponse.description}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>