<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- <%@ taglib prefix="t" tagdir="/WEB-INF/tags" %> PONER CUANDO TENGAMOS ETIQUETAS QUE AÑADIR--> 

<!DOCTYPE html>

<html>
	
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/offer.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Add Collaboration</title>

	</head>

	<body>
    
    	<h2>New Collaboration</h2>
    	
	    <form:form method="post" modelAttribute="collaboration">
		       
			<table>
			
	        	<tr>
	        	
	                <td><form:label path = "idCollaboration">IdCollaboration</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idCollaboration" /></td>
	                <td><form:errors path = "idCollaboration" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="idOffer">IdOffer</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idOffer" /></td>
	                <td><form:errors path = "idOffer" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="idDemand">IdDemand</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDemand" /></td>
	                <td><form:errors path = "idDemand" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	  	            <td><form:label path="beginningDate">BeginningDate</form:label></td>
	                <td><form:input type="date" path="beginningDate" name="datepicker" id="datepickerbeginning" size="10" /><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="endingDate">EndingDate</form:label></td>
	                <td><form:input type="date" path="endingDate" name="datepicker" id="datepickerending" size="10"/><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="hours">Hours</form:label></td>
					<td><select id = "hours" name = "hours">
						<option value="10:00" selected="selected">10 hours (default)</option>
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
	            
	                <td><form:label path="rate">Rate</form:label></td>
	              	<td><select id = "rate" name = "rate">
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
	        
	        	<input type = "submit" name = "submit" value = "Accept">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/collaboration/main.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    	
	</body>
	
</html>