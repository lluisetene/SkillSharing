<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />
		
		<title>Delete Degree</title>

	</head>

	<body>
    
    	<h2>Delete Degree</h2>
    
    	<form:form method="post" modelAttribute="degree">
        
	         <table>
	        	
	        	<tr>
	                
	             
	                <td><form:input type = "hidden" maxlength = "5" path="idDegree" /></td>
	                <td><form:errors path = "idDegree" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	             
	                <td><form:input type = "hidden" maxlength = "100" path="name" /></td>
	                <td><form:errors path = "name" cssClass = "error" /></td>
	            
	            </tr>
	            
	            <tr>
	            
	            
	                <td><form:input type = "hidden" maxlength = "9" path="nid" /></td>
	                <td><form:errors path = "nid" cssClass = "error" /></td>
	            
	            </tr>
	        
	        </table>
	        
	         ¿Seguro que desea borrar el grado con id ${degree.idDegree}?
	        <br><br>
	        
	        <input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/degree/list.html'" name = "cancel" value = "Cancel">
	   
    	</form:form>
    
	</body>

</html>