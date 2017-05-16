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
	        
	        	<th>Name</th>
	        	<th>Mail</th>
	            <th>UserName</th>
	            <th>Password</th>
	            
	        </tr>
	        
	        <c:forEach items="${userslogin}" var="userlogin">
	          
	            <tr>
	          
	          		<td>${userlogin.name}</td>
	          		<td>${userlogin.mail}</td>
	                <td>${userlogin.username}</td>
	           		<td>${userlogin.password}</td>
	           		<td><a href="update/${userlogin.username}.html">Update</a>
               		<td><a href="delete/${userlogin.username}.html">Delete</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/login/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>