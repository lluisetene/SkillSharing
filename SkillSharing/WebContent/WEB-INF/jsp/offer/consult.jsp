<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />

		<title>Consult Offer</title>

		<style>
			
			table, th, td {
	    		
	  			border-spacing: 10px 5px;
	
			}
		
		</style>

	</head>
	
	<body>
	
    	<h2>Consult Offer</h2>
    
    	<form:form method="post" modelAttribute="offer">
        
        	<table>
	        
	        	<tr>
	        	
	                <td><form:label style = "font-size:16px" path="idOffer">IdOffer</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idOffer" /></td>
	                <td><form:errors path = "idOffer" cssClass = "error" /></td>
	            
	            </tr>

        	</table>
        
        	<input type = "submit" name = "submit" value = "Accept">
        	<input type = "button" name = "cancel" value = "Cancel" onclick = "location='http://localhost:8080/SkillSharing/offer/main.html'"/>
   			
   			<br>
   			<br>
   			
   			<table>
   			
	   		 	<tr>
	   		 	
		            <th>IdOffer</th>
		            <th>NID</th>
		            <th>Name</th>
		            <th>IdSkill</th>
		            <th>Description</th>
		            <th>BeginningDate</th>
		            <th>EndingDate</th>
		        
		        </tr>
		        
		        <tr>
		        
		            <td>${offerResponse.idOffer}</td>
		            <td>${offerResponse.nid}</td>
		            <td>${offerResponse.name}</td>
		            <td>${offerResponse.idSkill}</td>
		            <td>${offerResponse.description}</td>
		            <td>${offerResponse.beginningDate}</td>
		            <td>${offerResponse.endingDate}</td>
		      
		        </tr> 
   		
   			</table>
   			
    	</form:form>
    
	</body>
	
</html>