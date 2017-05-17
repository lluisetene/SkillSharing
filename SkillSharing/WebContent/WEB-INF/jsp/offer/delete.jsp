<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />
		
		<title>Delete Offer</title>

	</head>

	<body>
    
    	<h2>Delete Offer</h2>
    
    	<form:form method="post" modelAttribute="offer">
		       
			<table>
	        	
	        	<tr>
	                
	            
	                <td><form:input type = "hidden" maxlength = "5" path="idOffer" /></td>
	            	<td><form:errors path="idOffer" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	           
	                <td><form:input type = "hidden" maxlength = "9" path="nid" /></td>
	            	<td><form:errors path="nid" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	  
	                <td><form:input type = "hidden" maxlength = "100" path="name" /></td>
	            	<td><form:errors path="name" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	    
	                <td><form:input type = "hidden" maxlength = "5" path="idSkill" /></td>
	            	<td><form:errors path="idSkill" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	         
	                <td><form:input type = "hidden" maxlength = "300" path="description" /></td>
	            </tr>
	            
	            <tr>
	            
	
	                <td><form:input type="date" path="beginningDate" name="datepicker" id="datepickerbeginning" size="10" readOnly="true" style="display:none"/><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	        
	                <td><form:input type="date" path="endingDate" name="datepicker" id="datepickerending" size="10" readOnly="true" style="display:none"/><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	            </tr>
	            
	        </table>
	        
	        	¿Seguro que desea borrar la oferta con id ${offer.idOffer}?
	        	<br><br>
	        
	        	<input type = "submit" name = "submit" value = "Accept">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/offer/list.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    	
	</body>
	
</html>