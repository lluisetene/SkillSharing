<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

	<head>
	
		<title>Students</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>List Students</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>NID</th>
	            <th>Name</th>
	            <th>UserName</th>
	            <th>Password</th>
	            <th>Email</th>
	            <th>Course</th>
	            <th>offerHours</th>
	            <th>demandHours</th>
	            <th>banned</th>
	            
	        </tr>
	        
	        <c:forEach items="${students}" var="student">
	          
	            <tr>
	          
	                <td>${student.nid}</td>
	                <td>${student.name}</td>
	                <td>${student.username}</td>
	           		<td>${student.password}</td>
	           		<td>${student.mail}</td>
	                <td>${student.course}</td>
	                <td>${student.offerHours}</td>
	           		<td>${student.demandHours}</td>
	           		<td>${student.banned}</td>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>