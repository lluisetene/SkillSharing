<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
		
		<title>Update Collaboration</title>

	</head>

	<body>
    
    	<h2>Change Collaboration</h2>
    
    	<form:form method="post" modelAttribute="collaboration">
        
	        <table>
			
	        	<tr>
	        	
	                <td><form:label path = "idCollaboration">IdCollaboration</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idCollaboration" /></td>
	                <td><form:errors path = "idCollaboration" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="idOffer">IdOffer</form:label></td>
	             	<td><form:input type = "text" maxlength = "5" path="idOffer"/></td>
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
						<option value="00:15">00:15</option>
						<option value="00:30">00:30</option>
						<option value="00:45">00:45</option>
						<option value="01:00">01:00</option>
						<option value="01:15">01:15</option>
						<option value="01:30">01:30</option>
						<option value="01:45">01:45</option>
						<option value="02:00">02:00</option>
						<option value="02:15">02:15</option>
						<option value="02:30">02:30</option>
						<option value="02:45">02:45</option>
						<option value="03:00">03:00</option>
						<option value="03:15">03:15</option>
						<option value="03:30">03:30</option>
						<option value="03:45">03:45</option>
						<option value="04:00">04:00</option>
						<option value="04:15">04:15</option>
						<option value="04:30">04:30</option>
						<option value="04:45">04:45</option>
						<option value="05:00">05:00</option>
						<option value="05:15">05:15</option>
						<option value="05:30">05:30</option>
						<option value="05:45">05:45</option>
						<option value="06:00">06:00</option>
						<option value="06:30">06:30</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="16:00">16:00</option>
						<option value="24:00">24:00</option>
						<option value="32:00">32:00</option>
						<option value="40:00">40:00</option>
						<option value="80:00">80:00</option>
						<option value="120:00">120:00</option>
						<option value="160:00">160:00</option>
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