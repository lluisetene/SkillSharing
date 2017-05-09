<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
		<script>
		$(function () {
			var dateFormat = "mm/dd/yy",
			//BeginningDate
			from = $("#datepickerbeginning").datepicker({
				changeMonth:true,
				changeYear:true,
				showOn:"button",
				buttonText:"Calendar",
				}).datepicker("setDate", new Date()).on( "change", function() {
					to.datepicker( "option", "minDate", getDate( this ));
				}),
			//EndingDate
			to = $("#datepickerending").datepicker({
				changeMonth:true, 
				changeYear:true,
				showOn:"button", 
				buttonText:"Calendar",
				}).datepicker("setDate", new Date()).on( "change", function() {
					from.datepicker( "option", "maxDate", getDate( this ) );
				});

			function getDate( element ) {
				var date;
				try {
					date = $.datepicker.parseDate( dateFormat, element.value );
				} catch( error ) {
					date = null;
				}

				return date;
			}
		
		} 
		
		);
		</script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
		<title>Add Offer</title>

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
	                <td><form:input type="date" path="beginningDate" name="datepicker" id="datepickerbeginning" size="10" readonly="true" /><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="endingDate">EndingDate</form:label></td>
	                <td><form:input type="date" path="endingDate" name="datepicker" id="datepickerending" size="10" readonly="true"/><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	                
	            </tr>
	            
	        </table>
	        
	        	<input type = "submit" name = "submit" value = "Accept">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/offer/main.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    	
	</body>
	
</html>