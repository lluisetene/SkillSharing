<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />

		<title>Consult Collaboration</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;

	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consult Collaboration</h2>
    
    	<form:form method="post" modelAttribute="collaboration">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idCollaboration">IdCollaboration</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idCollaboration" /></td>
	                <td><form:errors path = "idCollaboration" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Accept">
        	<input type = "button" name = "cancel" value = "Cancel" onclick = "location='http://localhost:8080/SkillSharing/collaboration/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
   			
	   		 	<tr>
	   		 	
		            <th>IdCollaboration</th>
		            <th>IdOffer</th>
		            <th>IdDemand</th>
		            <th>BeginningDate</th>
		            <th>EndingDate</th>
		            <th>Hours</th>
		            <th>Rate</th>
		        
		        </tr>
		        
		        <tr>
		        
		            <td>${collaborationResponse.idCollaboration}</td>
		            <td>${collaborationResponse.idOffer}</td>
		            <td>${collaborationResponse.idDemand}</td>
		            <td>${collaborationResponse.beginningDate}</td>
		            <td>${collaborationResponse.endingDate}</td>
		            <td>${collaborationResponse.hours}</td>
		            <td>${collaborationResponse.rate}</td>
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>