<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

	<head>
	
		<title>Admins</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>List Admins</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>UserName</th>
	            <th>Password</th>
	            
	        </tr>
	        
	        <c:forEach items="${userlogin}" var="userlogin">
	          
	            <tr>
	          
	                <td>${student.username}</td>
	           		<td>${student.password}</td>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/login/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>