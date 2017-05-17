<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />
		
		<title>Delete Collaboration</title>

	</head>

	<body>
    
    	<h2>Delete Collaboration</h2>
    
    	<form:form method="post" modelAttribute="collaboration">
		       
			<table>
			
	        	<tr>
	        	
	                
	                <td><form:input type = "hidden" maxlength = "5" path="idCollaboration" /></td>
	                <td><form:errors path = "idCollaboration" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	               
	                <td><form:input type = "hidden" maxlength = "5" path="idOffer" /></td>
	                <td><form:errors path = "idOffer" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                
	                <td><form:input type = "hidden" maxlength = "5" path="idDemand" /></td>
	                <td><form:errors path = "idDemand" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	  	  
	                <td><form:input type="date" path="beginningDate" name="beginningdate" id="from" size="10" readonly="true" style="display:none"/><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	             
	                <td><form:input type="date" path="endingDate" name="endingdate" id="to" size="10" readonly="true" style="display:none"/><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	             
					<td><select id = "hours" name = "hours" style="display:none">
						<option value="${collaboration.hours}" selected="selected">${collaboration.hours}</option>
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						
					</select></td>
	           
	            </tr>
	            
	            <tr>
	            
	              
	              	<td><select id = "rate" name = "rate" style="display:none">
		               <option value= "5" selected="selected">5 (default)</option>
		               <option value="0">0</option>
		               <option value="1">1</option>
		               <option value="2">2</option>
		               <option value="3">3</option>
		               <option value="4">4</option>
		               <option value="6">6</option>
		               <option value="7">7</option>
		               <option value="8">8</option>
		               <option value="9">9</option>
		               <option value="10">10</option>
	               </select></td>
	           
	            </tr>
	        
	        </table>
	        
	        	¿Seguro que desea borrar la colaboracion con id ${collaboration.idCollaboration}?
	        	<br><br>
	        
	        	<input type = "submit" name = "submit" value = "Accept">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/collaboration/list.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    	
	</body>
	
</html>