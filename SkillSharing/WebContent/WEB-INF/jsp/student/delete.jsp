<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
		
		<title>Estudiante</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

	</head>

	<body>
    
    	<h2>Eliminar Estudiante</h2>
    
    	<form:form method="post" modelAttribute="student">
        
	        <table>
			
	        	<tr>
	        	
	                <td><form:input type = "hidden" maxlength = "9" path="nid"/></td>
	                <td><form:errors path="nid" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:input type = "hidden" maxlength = "50" path="name"/></td>
	                <td><form:errors path="name" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:input type = "hidden" maxlength = "30" path="username"/></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	      
	                <td><form:input type = "hidden" maxlength = "30" path="password"/></td>
	                <td><form:errors path="password" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:input type = "hidden" maxlength = "30" path="mail" /></td>
	                <td><form:errors path="mail" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	          
	                <td><form:input type = "hidden" maxlength = "1" name = "course" min = "1" max = "4" value = "1" placeholder="º" path="course"/></td>
	                <td><form:errors path="course" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><select id = "offerHours" name = "offerHours" style="display:none">
						<option value="20:00" selected="selected">20 horas (por defecto)</option>
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
					</select></td>
	          
	            </tr>
	            
	            <tr>
	            
	            
	                <td><select id = "demandHours" name = "demandHours" style="display:none">
						<option value="00:00" selected="selected">00 horas (por defecto)</option>
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
					</select></td>
	            
	            </tr>
	            
	             <tr>
	            
	
	                <td><select id="banned" name="banned" style="display:none">
						<option value="falso" selected="selected">falso</option>
						<option value="verdadero">verdadero</option>
					</select></td>
	            
	            </tr>
	        
	        </table>
	        
	        ¿Seguro que desea borrar al estudiante ${student.name}; DNI:${student.nid}?
	        <br><br>
	        
	        <input type = "submit" name = "submit" value = "Aceptar"/>
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/list.html'" name = "cancel" value = "Cancelar">
	   
    	</form:form>
    
	</body>

</html>