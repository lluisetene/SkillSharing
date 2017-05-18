<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
	
	<head>
	
	<title>Add Offer</title>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/calendar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	</head>
	<body>
    
    	<h2>New Offer</h2>
    	
	    <form:form method="post" modelAttribute="offer">
		       
			<table>
	        	
	        	<tr>
	                
	                <td><form:label path="idOffer">IdOffer</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idOffer" /></td>
	            	<td><form:errors path="idOffer" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="nid">NID</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	            	<td><form:errors path="nid" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Name</form:label></td>
	                <td><form:input type = "text" maxlength = "100" path="name" /></td>
	            	<td><form:errors path="name" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="idSkill">IdSkill</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" /></td>
	            	<td><form:errors path="idSkill" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="description">Description</form:label></td>
	                <td><form:input type = "text" maxlength = "300" path="description" /></td>
	            </tr>
	            
	            <tr>
	            
	  	            <td><form:label path="beginningDate">BeginningDate</form:label></td>
	                <td><form:input type="text" path="beginningDate" name="beginningdate" id="from" size="10" readonly="true"/><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="endingDate">EndingDate</form:label></td>
	                <td><form:input type="text" path="endingDate" name="endingdate" id="to" size="10" readonly="true" /><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	                
	            </tr>
	            
	        </table>
	        	<input type = "submit" name = "submit" value = "Accept">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/offer/main.html'" name = "cancel" value = "Cancel">
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