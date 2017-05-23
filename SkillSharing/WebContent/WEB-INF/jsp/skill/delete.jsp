<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
		
		<title>Habilidad</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">


	</head>

	<body>
    
    	<h2>Eliminar Habilidad</h2>
    
    	<form:form method="post" modelAttribute="skill">
        
	        <table>
	        	
	        	<tr>
	                
	             
	                <td><form:input type = "hidden" maxlength = "5" path="idSkill" /></td>
	                <td><form:errors path = "idSkill" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	               
	                <td><form:input type = "hidden" maxlength = "50" path="name" /></td>
	                <td><form:errors path = "name" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	        
					<td><select id="level" name="level" style="display:none">
						<option value="medio" selected="selected">medio</option>
						<option value="alto">alto</option>
						<option value="bajo">bajo</option>
					</select></td>
	            
	            </tr>
	            
	            <tr>
	            
	          
	                <td><form:input type = "hidden" maxlength = "300" path="description" /></td>
	            
	            </tr>
	        
	        </table>
	        
	        ¿Seguro que desea borrar la habilidad ${skill.name} (id ${skill.idSkill})?
	        <br><br>
	        
	        <input type = "submit" name = "submit" value = "Aceptar">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/skill/list.html'" name = "cancel" value = "Cancelar">
	   
    	</form:form>
    
	</body>

</html>