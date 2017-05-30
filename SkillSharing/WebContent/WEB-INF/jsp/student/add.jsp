<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
		
		<title>Estudiante</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

	</head>

	</head>

	<body>
    
    	<h2>Nuevo Estudiante</h2>
    	
	    <form:form method="post" modelAttribute="student"> 
			
			<table>
			
	        	<tr>
	        	
	                <td><form:label path="nid">DNI</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	                <td><form:errors path="nid" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Nombre</form:label></td>
	                <td><form:input type = "text" maxlength = "50" path="name" /></td>
	                <td><form:errors path="name" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="username">Nombre usuario</form:label></td>
	                <td><form:input type = "text" maxlength = "30" path="username" /></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="password">Contraseña</form:label></td>
	                <td><form:input type = "password" maxlength = "30" path="password" /></td>
	                <td><form:errors path="password" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="mail">Correo</form:label></td>
	                <td><form:input type = "email" maxlength = "30" path="mail" /></td>
	                <td><form:errors path="mail" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="course">Curso</form:label></td>
	                <td><select id = "course" name = "course">
	                	<option value="1" selected="selected">Primero</option>
	                	<option value="2">Segundo</option>
	                	<option value="3">Tercero</option>
	                	<option value="2">Cuarto</option>                	
	                	</select>
	                </td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="offerHours">Horas Ofertadas</form:label></td>
	                <td><select id = "offerHours" name = "offerHours">
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
	            
	                <td><form:label path="demandHours">Horas Demandadas</form:label></td>
	                <td><select id = "demandHours" name = "demandHours">
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
	            
	                <td><form:label path="banned">Baneado</form:label></td>
					<td><select id="banned" name="banned">
						<option value="false" selected="selected">falso</option>
						<option value="true">verdadero</option>
					</select></td>
	            
	            </tr>
	        
	        </table>
	    
	    	<input type = "submit" name = "submit" value = "Aceptar">
	        <input type = "button" onclick = "location='http:${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
	    
	    </form:form>
	    	
	</body>
	
</html>