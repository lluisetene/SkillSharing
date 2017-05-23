<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
		
		<title>Demanda</title>
		
		
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/calendar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	</head>

	<body>
    
    	<h2>Nueva Demanda</h2>
    	
	    <form:form method="post" modelAttribute="demand">
		       
			<table>
	        	
	        	<tr>
	                
	                <td><form:label path="idDemand">IdDemanda</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idDemand" /></td>
	            	<td><form:errors path="idDemand" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="nid">DNI</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	            	<td><form:errors path="nid" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Nombre</form:label></td>
	                <td><form:input type = "text" maxlength = "100" path="name"/></td>
	            	<td><form:errors path="name" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="idSkill">IdHabilidad</form:label></td>
	                <td><form:input type = "text" maxlength = "5" path="idSkill" /></td>
	            	<td><form:errors path="idSkill" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	                <td><form:label path="description">Descripcion</form:label></td>
	                <td><form:input type = "text" maxlength = "300" path="description" /></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="beginningDate">Fecha inicio</form:label></td>
	                <td><form:input type="text" path="beginningDate" name="beginningdate" id="from" size="10" readonly="true"/><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="endingDate">Fecha fin</form:label></td>
	                <td><form:input type="text" path="endingDate" name="endingdate" id="to" size="10" readonly="true" /><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	            </tr>
	            
	        </table>
	        
	        	<input type = "submit" name = "submit" value = "Aceptar">
	        	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/demand/main.html'" name = "cancel" value = "Cancelar">
	    
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