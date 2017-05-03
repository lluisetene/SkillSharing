<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Collaborations</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>List Collaborations</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdCollaboration</th>
	            <th>IdOffer</th>
	            <th>IdDemand</th>
	            <th>BeginningDate</th>
	            <th>EndingDate</th>
	            <th>Hours</th>
	            <th>Rate</th>
	            
	        </tr>
	        
	        <c:forEach items="${collaborations}" var="collaboration">
	          
	            <tr>
	          
	                <td>${collaboration.idCollaboration}</td>
	                <td>${collaboration.idOffer}</td>
	                <td>${collaboration.idDemand}</td>
	                <td>${collaboration.beginningDate}</td>
	                <td>${collaboration.endingDate}</td>
	                <td>${collaboration.hours}</td>
	                <td>${collaboration.rate}</td>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/collaboration/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>