<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:paginaBasica title="Oferta">

	<jsp:body>
	
    	<h1>Lista Ofertas</h1>
     
    	<table class="table table-bordered table-hover table-striped">
    	
	        <tr>
	        
	            <th>IdOferta</th>
	            <th>DNI</th>
	            <th>Nombre</th>
	            <th>IdHabilidad</th>
	            <th>Descripcion</th>
	            <th>Fecha inicio</th>
	            <th>Fecha fin</th>
	            
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
	                <td><a href="update/${offer.idOffer}.html">Modificar</a>
               		<td><a href="delete/${offer.idOffer}.html">Eliminar</a>
	           
	            </tr>
	        
	        </c:forEach>  
	            
  	  	</table>
    
    	<input type = "button" onclick = "location='${pageContext.request.contextPath}/offer/main.html'" name = "cancel" value = "Cancelar">
    	
    </jsp:body>
	
</t:paginaBasica>