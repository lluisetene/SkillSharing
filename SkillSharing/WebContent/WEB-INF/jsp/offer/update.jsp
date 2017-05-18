<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
	
		<title>Update Offer</title>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

	</head>

	<body>
    
    	<h2>Change Offer</h2>
    	
	    <form:form method="post" modelAttribute="offer">
		       
			<table>
	        	
	        	<tr>
	                
	                <td><form:label path="idOffer">IdOffer</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idOffer" disabled = "true"/></td>
	            	<td><form:errors path="idOffer" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="nid">NID</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" disabled = "true"/></td>
	            	<td><form:errors path="nid" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Name</form:label></td>
	                <td><form:input type = "text" maxlength = "100" path="name" disabled = "true"/></td>
	            	<td><form:errors path="name" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="idSkill">IdSkill</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" disabled = "true"/></td>
	            	<td><form:errors path="idSkill" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="description">Description</form:label></td>
	                <td><form:input type = "text" maxlength = "300" path="description" disabled = "true"/></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="beginningDate">BeginningDate</form:label></td>
	                <td><form:input type="text" path="beginningDate" name="datepicker" id="from" size="10" readonly="true"/><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="endingDate">EndingDate</form:label></td>
	                <td><form:input type="text" path="endingDate" name="datepicker" id="to" size="10" readonly="true"/><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	            </tr>
	            
	        </table>
	        
	        	<input type = "submit" name = "submit" value = "Accept" onclick = "document.getElementById('idOffer').disabled=false, 
	        																	   document.getElementById('nid').disabled=false,
	        																	   document.getElementById('name').disabled=false,
	        																	   document.getElementById('idSkill').disabled=false,
	        																	   document.getElementById('description').disabled=false;">
	        														
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/offer/list.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    
	    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script> 
		$(document).ready(function() {
			$("#from").datepicker({
				changeMonth:true,
				changeYear:true,
				showOn: "button",
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	            buttonImageOnly: true,
	            dateFormat:"dd/mm/yy",
	            minDate:0,
				onClose: function todate(selectedDate) {
					$("#to").datepicker("option", "minDate", selectedDate);
				}
			}).datepicker("setDate", new Date());
			$("#to").datepicker({				
				changeMonth:true,
				changeYear:true,
				showOn: "button",
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	            buttonImageOnly: true,
	            dateFormat:"dd/mm/yy",
	            minDate:0,
				onClose: function fromdate(selectedDate) {
				$("#from").datepicker("option", "maxDate", selectedDate);
				}
			}).datepicker("setDate", new Date());
		
		  });
		
		</script>
	    
	    
	</body>
	
</html>