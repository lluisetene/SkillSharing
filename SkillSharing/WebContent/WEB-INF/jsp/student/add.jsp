<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>

	<head>

		<meta charset="UTF-8" />

		<title>Add Student</title>

	</head>

	<body>
    
    	<h2>New Student</h2>
    	
	    <form:form method="post" modelAttribute="student"> 
			
			<table>
			
	        	<tr>
	        	
	                <td><form:label path="nid">NID</form:label></td>
	                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
	                <td><form:errors path="nid" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="name">Name</form:label></td>
	                <td><form:input type = "text" maxlength = "50" path="name" /></td>
	                <td><form:errors path="name" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="username">UserName</form:label></td>
	                <td><form:input type = "text" maxlength = "30" path="username" /></td>
	                <td><form:errors path="username" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="password">Password</form:label></td>
	                <td><form:input type = "password" maxlength = "30" path="password" /></td>
	                <td><form:errors path="password" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="mail">Email</form:label></td>
	                <td><form:input type = "email" maxlength = "30" path="mail" /></td>
	                <td><form:errors path="mail" cssClass="error" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="course">Course</form:label></td>
	                <td><form:input type = "number" maxlength = "1" name = "course" min = "1" max = "4" value = "1" path="course" /></td>
	                
	            </tr>
	            
	            <tr>
	            
	                <td><form:label path="offerHours">OfferHours</form:label></td>
	                <td><select id = "offerHours" name = "offerHours">
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
	            
	                <td><form:label path="demandHours">DemandHours</form:label></td>
	                <td><select id = "demandHours" name = "demandHours">
						<option value="00:00" selected="selected">00:00 (default)</option>
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
	            
	                <td><form:label path="banned">Banned</form:label></td>
					<td><select id="banned" name="banned">
						<option value="false" selected="selected">false</option>
						<option value="true">true</option>
					</select></td>
	            
	            </tr>
	        
	        </table>
	    
	    	<input type = "submit" name = "submit" value = "Accept">
	        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/main.html'" name = "cancel" value = "Cancel">
	    
	    </form:form>
	    	
	</body>
	
</html>