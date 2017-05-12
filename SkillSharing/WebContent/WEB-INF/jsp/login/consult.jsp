<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">


		<meta charset="UTF-8" />

		<title>Consult Admin</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consult Student</h2>
    
    	<form:form method="post" modelAttribute="userlogin">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="username">Username</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="username" /></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Accept">
        	<input type = "button" name = "cancel" value = "Cancel" onclick = "location='http://localhost:8080/SkillSharing/login/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
    	
		        <tr>
		        
		            <th>UserName</th>
		            <th>Password</th>
		            
		        </tr>
		        
		        <tr>
		        
		            <td>${userloginResponse.username}</td>
		      		<td>${userloginResponse.password}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>