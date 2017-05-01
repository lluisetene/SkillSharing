<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<meta charset="UTF-8" />
		
		<title>Update Student</title>

	</head>

	<body>
    
    	<h2>Change Student</h2>
    
    	<form:form method="post" modelAttribute="student">
        
	        <table>
			
	        	<tr>
	        	
	                <td><form:label path="nid">NID</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Name</form:label></td>
	                <td><form:input type = "text" maxlength = "50" path="name" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="username">Username</form:label></td>
	                <td><form:input type = "text" maxlength = "30" path="username" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="password">Password</form:label></td>
	                <td><form:input type = "password" maxlength = "30" path="password" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="mail">Email</form:label></td>
	                <td><form:input type = "email" maxlength = "30" path="mail" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="course">Course</form:label></td>
	                <td><form:input type = "number" maxlength = "1" name = "course" min = "1" max = "4" value = "1" placeholder="º" path="course" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="offerHours">OfferHours</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="offerHours" placeholder="HH:MM" /></td>
	          
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="demandHours">DemandHours</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="demandHours" placeholder="HH:MM" /></td>
	            
	            </tr>
	            
	             <tr>
	            
	                <td><form:label path="banned">Banned</form:label></td>
	                <td><select id="banned" name="banned">
						<option value="" selected="selected"> -select-</option>
						<option value="true">true</option>
						<option value="false">false</option>
					</select></td>
	            
	            </tr>
	        
	        </table>
	        
	        <input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/main.html'" name = "cancel" value = "Cancel">
	   
    	</form:form>
    
	</body>

</html>