<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<meta charset="UTF-8" />

		<title>Add Offer</title>

	</head>

	<body>
    
    	<h2>New Offer</h2>
    	
	    <form:form method="post" modelAttribute="offer">
		       
			<table>
	        	
	        	<tr>
	                
	                <td><form:label path="idOffer">IdOffer</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idOffer" /></td>
	                <td><form:errors path = "idOffer" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	              <td><form:label path="nid">NID</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	                <td><form:errors path = "nid" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Name</form:label></td>
	                <td><form:input type = "text" maxlength = "100" path="name" /></td>
	                <td><form:errors path = "name" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="idSkill">IdSkill</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" /></td>
	                <td><form:errors path = "idSkill" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="description">Description</form:label></td>
	                <td><form:input type = "text" maxlength = "300" path="description" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="beginningDate">BeginningDate</form:label></td>
	                <td><form:input type = "text" maxlength = "10" path="beginningDate" placeholder="DD/MM/YYYY" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="endingDate">EndingDate</form:label></td>
	                <td><form:input type = "text" maxlength = "10" path="endingDate" placeholder="DD/MM/YYYY" /></td>
	            
	            </tr>
	            
	        </table>
	        
	        	<input type = "submit" name = "submit" value = "Accept">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/offer/main.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    	
	</body>
	
</html>