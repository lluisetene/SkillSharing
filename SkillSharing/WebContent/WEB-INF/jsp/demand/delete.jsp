<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="es-ES">

	<head>
	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">

		<title>Demanda</title>

	</head>

	<body>
    
    	<h2>Eliminar Demandas</h2>
    
    	  <form:form method="post" modelAttribute="demand">
		       
			<table>
	        	
	        	<tr>
	                
	             
	                <td><form:input type = "hidden" maxlength = "5" path="idDemand" disbaled = "true"/></td>
	            	<td><form:errors path="idDemand" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	              
	                <td><form:input type = "hidden" maxlength = "9" path="nid" disbaled = "true"/></td>
	            	<td><form:errors path="nid" cssClass="error"/></td>
	            </tr>
	            
	            <tr>
	            
	          
	                <td><form:input type = "hidden" maxlength = "100" path="name" disbaled = "true"/></td>
	            	<td><form:errors path="name" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	            
	                <td><form:input type = "hidden" maxlength = "5" path="idSkill" disbaled = "true"/></td>
	            	<td><form:errors path="idSkill" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	                
	            
	                <td><form:input type = "hidden" maxlength = "300" path="description" disbaled = "true"/></td>
	            </tr>
	            
	            <tr>
	            
	               
	                <td><form:input type="text" path="beginningDate" name="datepicker" id="datepickerbeginning" size="10" readOnly="true" style="display:none"/><td>
	                <td><form:errors path="beginningDate" cssClass="error" /></td>
	            </tr>
	            
	            <tr>
	            
	            
	                <td><form:input type="text" path="endingDate" name="datepicker" id="datepickerending" size="10" readOnly="true" style="display:none"/><td>
	                <td><form:errors path="endingDate" cssClass="error" /></td>
	            </tr>
	            
	        </table>
	        
	       	 	¿Seguro que desea borrar la demanda ${demand.name} (id ${demand.idDemand})?
	        	<br><br>
	        
	       	<input type = "submit" name = "submit" onClick="location='${pageContext.request.contextPath}/student/main.html'" value = "Aceptar"/>
	        <input type = "submit" name = "submit" onClick="location='${pageContext.request.contextPath}/student/main.html'" value = "Cancelar">
	    
	    </form:form>
	    	
	</body>
	
</html>