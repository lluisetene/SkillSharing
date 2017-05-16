<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Demand</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>List Demands</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdDemand</th>
	            <th>NID</th>
	            <th>Name</th>
	            <th>IdSkill</th>
	            <th>Description</th>
	            <th>BeginningDate</th>
	            <th>EndingDate</th>
	            
	        </tr>
	        
	        <c:forEach items="${demands}" var="demand">
	          
	            <tr>
	          
	                <td>${demand.idDemand}</td>
	                <td>${demand.nid}</td>
	                <td>${demand.name}</td>
	                <td>${demand.idSkill}</td>
	                <td>${demand.description}</td>
	                <td>${demand.beginningDate}</td>
	                <td>${demand.endingDate}</td>
	                <td><a href="update/${demand.idDemand}.html">Update</a>
               		<td><a href="delete/${demand.idDemand}.html">Delete</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/demand/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>