<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />

		<title>Consult Demand</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consult Demand</h2>
    
    	<form:form method="post" modelAttribute="demand">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idDemand">IdDemand</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDemand" /></td>
	                <td><form:errors path = "idDemand" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Accept">
        	<input type = "button" name = "cancel" value = "Cancel" onclick = "location='http://localhost:8080/SkillSharing/demand/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
   			
	   		 	<tr>
	   		 	
		            <th>IdDemand</th>
		            <th>NID</th>
		            <th>Name</th>
		            <th>IdSkill</th>
		            <th>Description</th>
		            <th>BeginningDate</th>
		            <th>EndingDate</th>
		        
		        </tr>
		        
		        <tr>
		        
		            <td>${demandResponse.idDemand}</td>
		            <td>${demandResponse.nid}</td>
		            <td>${demandResponse.name}</td>
		            <td>${demandResponse.idSkill}</td>
		            <td>${demandResponse.description}</td>
		            <td>${demandResponse.beginningDate}</td>
		            <td>${demandResponse.endingDate}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>