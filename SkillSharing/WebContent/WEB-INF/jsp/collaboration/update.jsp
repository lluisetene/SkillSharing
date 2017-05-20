<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>

		<title>Colaboracion</title>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
		
	</head>

	<body>
    
    	<h2>Modificar Colaboracion</h2>
    
    	<form:form method="post" modelAttribute="collaboration">
        
	        <table>
			
	        	<tr>
	        	
	                <td><form:label path = "idCollaboration">IdColaboracion</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idCollaboration" disabled = "true"/></td>
	                <td><form:errors path = "idCollaboration" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="idOffer">IdOferta</form:label></td>
	             	<td><form:input type = "text" maxlength = "5" path="idOffer" disabled = "true"/></td>
	                <td><form:errors path = "idOffer" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="idDemand">IdDemanda</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDemand" disabled = "true"/></td>
	                <td><form:errors path = "idDemand" cssClass = "error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	  	            <td><form:label path="beginningDate">Fecha inicio</form:label></td>
	                <td><form:input type="text" path="beginningDate" name="datepicker" id="from" size="10" /><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="endingDate">Fecha fin</form:label></td>
	                <td><form:input type="text" path="endingDate" name="datepicker" id="to" size="10"/><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="hours">Horas</form:label></td>
					<td><select id = "hours" name = "hours" disabled>
						<option value="${collaboration.hours}">${collaboration.hours}</option>
	
					</select></td>
						
	           
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="rate">Valoracion</form:label></td>
	              	<td><select id = "rate" name = "rate" disabled>
		               <option value= "${collaboration.rate}">${collaboration.rate}</option>

	               </select></td>
	           
	            </tr>
	       
	        </table>
	        <input type = "submit" name = "submit" value = "Aceptar" onclick = "document.getElementById('idCollaboration').disabled=false, 
	        																   document.getElementById('idOffer').disabled=false,
	        																   document.getElementById('idDemand').disabled=false,
	        																   document.getElementById('hours').disabled=false,
	        																   document.getElementById('rate').disabled=false;">
	        																  
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/collaboration/list.html'" name = "cancel" value = "Cancelar">
	   
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