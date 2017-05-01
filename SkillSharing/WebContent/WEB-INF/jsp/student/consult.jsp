<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<meta charset="UTF-8" />

		<title>Consult Student</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
				font-size:12px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consult Student</h2>
    
    	<form:form method="post" modelAttribute="student">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="nid">NID</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	                <td><form:errors path="nid" cssClass="error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Accept">
        	<input type = "button" name = "cancel" value = "Cancel" onclick = "location='http://localhost:8080/SkillSharing/student/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
    	
		        <tr>
		        
		            <th>NID</th>
		            <th>Name</th>
		            <th>UserName</th>
		            <th>Password</th>
		            <th>Email</th>
		            <th>Course</th>
		            <th>offerHours</th>
		            <th>demandHours</th>
		            <th>banned</th>
		            
		        </tr>
		        
		        <tr>
		        
		            <td>${studentResponse.nid}</td>
		            <td>${studentResponse.name}</td>
		            <td>${studentResponse.username}</td>
		      		<td>${studentResponse.password}</td>
		      		<td>${studentResponse.mail}</td>
		            <td>${studentResponse.course}</td>
		            <td>${studentResponse.offerHours}</td>
		      		<td>${studentResponse.demandHours}</td>
		      		<td>${studentResponse.banned}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>