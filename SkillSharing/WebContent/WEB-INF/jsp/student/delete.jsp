<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<meta charset="UTF-8" />
		
		<title>Delete Student</title>

	</head>

	<body>
    
    	<h2>Delete Student</h2>
    
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
						<option value="20:00" selected="selected">20 hours (default)</option>
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
						<option value="00:00" selected="selected">00 hours (default)</option>
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
						<option value="false" selected="selected">false</option>
						<option value="true">true</option>
					</select></td>
	            
	            </tr>
	        
	        </table>
	        
	        ¿Seguro que desea borrar al estudiante con nid ${student.nid}?
	        <br><br>
	        
	        <input type = "submit" name = "submit" value = "Accept"/>
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/list.html'" name = "cancel" value = "Cancel">
	   
    	</form:form>
    
	</body>

</html>