<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Skills</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>List Skills</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdSkill</th>
	            <th>Name</th>
	            <th>Level</th>
	            <th>Description</th>
	            
	        </tr>
	        
	        <c:forEach items="${skills}" var="skill">
	          
	            <tr>
	          
	                <td>${skill.idSkill}</td>
	                <td>${skill.name}</td>
	                <td>${skill.level}</td>
	           		<td>${skill.description}</td>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/skill/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>