<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">
	
		<title>Offer</title>

		<style>
		
			table, th, td {
  
	  			border-spacing: 10px 5px;
	  			font-size:12px;

			}
	
		</style>
		
	</head>
	
	<body>
    
    	<h1>List Offers</h1>
     
    	<table>
    	
	        <tr>
	        
	            <th>IdOffer</th>
	            <th>NID</th>
	            <th>Name</th>
	            <th>IdSkill</th>
	            <th>Description</th>
	            <th>BeginningDate</th>
	            <th>EndingDate</th>
	            
	        </tr>
	        
	        <c:forEach items="${offers}" var="offer">
	          
	            <tr>
	          
	                <td>${offer.idOffer}</td>
	                <td>${offer.nid}</td>
	                <td>${offer.name}</td>
	                <td>${offer.idSkill}</td>
	                <td>${offer.description}</td>
	                <td>${offer.beginningDate}</td>
	                <td>${offer.endingDate}</td>
	                <td><a href="update/${offer.idOffer}.html">Update</a>
               		<td><a href="delete/${offer.idOffer}.html">Delete</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<br>
    
    	<input type = "button" onclick = "location='http://localhost:8080/SkillSharing/offer/main.html'" name = "cancel" value = "Cancel">
    
	</body>
	
</html>