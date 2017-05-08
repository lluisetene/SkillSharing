<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />

		<title>Consult Degree</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consult Degree</h2>
    
    	<form:form method="post" modelAttribute="degree">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idDegree">IdDegree</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDegree" /></td>
	                <td><form:errors path = "idDegree" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Accept">
        	<input type = "button" name = "cancel" value = "Cancel" onclick = "location='http://localhost:8080/SkillSharing/degree/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
   			
	   		 	<tr>
	   		 	
		            <th>IdDegree</th>
		            <th>Name</th>
		            <th>NID</th>
		        
		        </tr>
		        
		        <tr>
		        
		            <td>${degreeResponse.idDegree}</td>
		            <td>${degreeResponse.name}</td>
		            <td>${degreeResponse.nid}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>