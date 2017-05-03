<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Degrees</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>List Degrees</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdDegree</th>
	            <th>Name</th>
	            <th>NID</th>
	            
	        </tr>
	        
	        <c:forEach items="${degrees}" var="degree">
	          
	            <tr>
	          
	                <td>${degree.idDegree}</td>
	                <td>${degree.name}</td>
	                <td>${degree.nid}</td>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/degree/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>