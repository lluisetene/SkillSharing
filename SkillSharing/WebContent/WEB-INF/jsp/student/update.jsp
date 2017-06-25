<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>

	<style>
	
		tr {
		
			height:50px;
		
		}
	
	</style>

</head>

<t:paginaBasica title="Configurar Perfil"/>
<t:paginaBasicaStudent/>

	
<div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
    	<div class="panel-body" style="background-color:073763">
			<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
            	<div class="table-responsive">
					<h1 style = "color:black; margin:0; padding-left:40px; padding-top:10px	">Configuración Personal</h1>
    				<div style = "height:2px; width:60%; background-color:black"></div>
    
	    	<form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="student">
	      
		         <table>
				
		        	<tr>
		        	
		                <td style = "padding-right: 150px"><form:label path="nid">DNI</form:label></td>
		                <td style = "width:36%"><form:input style = "border:1px solid black; color:black" cssClass="form-control" type = "text" maxlength = "9" path="nid" readonly = "true" disabled = "true"/><form:errors path="nid" cssClass="error" /></td>
		                
		                
		            </tr>
		            
		            <tr>
		            
		                <td><form:label path="name">Nombre</form:label></td>
		                <td><form:input  cssClass="form-control" type = "text" maxlength = "50" path="name" style = "width:150%;border:1px solid black; color:black" readonly = "true" disabled = "true"/></td>
		                <td><form:errors path="name" cssClass="error" /></td>
		                
		            </tr>
		            
		            <tr>
		            
		                <td><form:label path="username">Nombre usuario</form:label></td>
		                <td><form:input  cssClass="form-control" type = "text" maxlength = "30" path="username" style = "width:100%;border:1px solid black; color:black" readonly = "true" disabled = "true"/></td>
		                <td><form:errors path="username" cssClass="error" /></td>
		                
		            </tr>
		            
		            <tr>
		            
		                <td><form:label path="password">Contraseña</form:label></td>
		                <td><form:input style = "border:1px solid black; color:black" cssClass="form-control" type = "password" maxlength = "30" path="password"/><form:errors path="password" cssClass="error" /></td>
		             
		                
		            </tr>
		            
		            <tr>
		            
		                <td><form:label path="mail">Correo</form:label></td>
		                <td><form:input cssClass="form-control" type = "email" maxlength = "30" path="mail" style = "width:100%;border:1px solid black; color:black" readonly = "true" disabled = "true"/></td>
		                <td><form:errors path="mail" cssClass="error" /></td>
		                
		            </tr>
		            
		            <tr> 
		            
		                <td><form:label path="course">Curso</form:label></td>
		                <td><form:input style = "width:25%; border:1px solid black; color:black" cssClass="form-control" type = "number" maxlength = "1" name = "course" min = "1" max = "4" value = "${student.course}" placeholder="º" path="course" required="true"/></td>
		                <td><form:errors path="course" cssClass="error" /></td>
		                
		            </tr>
		            
		            <tr>
		            
		                <td><form:label path="offerHours">Horas Ofertadas</form:label></td>
		                <td><form:input style = "width: 65%;border:1px solid black;  color:black" Class="form-control" type = "text" id = "offerHours" name = "offerHours" path="offerHours" disabled = "true" readonly="true"/></td>
		                <td><form:errors path="offerHours" cssClass="error" /></td>
						
						<td><form:label path="demandHours" style = "padding-right: 50px">Horas Demandadas</form:label></td>
		                <td><form:input style = "border:1px solid black; color:black;"  Class="form-control" id = "demandHours" name = "demandHours" path="demandHours" disabled = "true" readonly="true"/></td>
		                <td><form:errors path="demandHours" cssClass="error" /></td>
		          
		            </tr>
		            
		             <tr>
		            
		                <td><form:label path="banned">Baneado</form:label></td>
		                <td><form:input style = "background-color:eeeeee;width:40%;border:1px solid black; color:black; " Class="form-control" id="banned" name="banned" path="banned" disabled="true" /></td> 
		            
		            </tr>
		        
		        </table>
		        <div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
		       	<input type = "button" style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%;margin-top:5%; width:100px; height:35px" class = "btn" value = "Aceptar" data-toggle="modal" data-target="#myModal" />
		        <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
		  
		  
		  
		   <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 style = "color:black" class="modal-title">Modificar Usuario</h4>
				        </div>
				        <div class="modal-body">
				          <p><i>¿Seguro que desea modificar sus datos?</i></p>
				        </div>
				        <div  class="modal-footer" style = "background-color:eeeeee">
				         <input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar" onclick = "document.getElementById('nid').disabled=false,
																																																				         document.getElementById('name').disabled=false,
																																																				         document.getElementById('username').disabled=false,
																																																				         document.getElementById('mail').disabled=false,
																																																				         document.getElementById('offerHours').disabled=false,
																																																				         document.getElementById('demandHours').disabled=false,
																																																		       		document.getElementById('banned').disabled=false;">
				        </div>
				      </div>
				      
				    </div>
				  </div> 
   			</form:form>
   			
   			
   			
   			</div>

   			</div>
   			
   		</div>

</div>

<div class = "col-lg-8 panel-body" style = "margin-top:10px;background-color:073763; border-radius:10px 10px 10px 10px;">

	<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
	
		<h1 style = "color:black;margin:0; padding-top:10px; padding-left:20px">Mis grados <button style = "background-color:eeeeee;  border:none" onclick = "location='http:${pageContext.request.contextPath}/degree/add.html'"><span style = "color: black; background-color:eeeeee" class="fa fa-plus-circle"></span></button></h1>
    					
    	<div style = "height:2px; width:40%; background-color:black"></div>
    	
    	<c:choose>
    	
    		<c:when test = "${degreesStudent.size() == 0}">
    		
    			<br>
    			<p style = "text-align:center"><i>No estás apuntado en ningún grado actualmente</i></p>
    			<br>
    		
    		</c:when>
    		<c:otherwise>
    		
    			<c:forEach items="${degreesStudent}" var="degree">
					
					<br>		
					<option value="${degree.name}">${degree.name} </option>
					
					<br>
		
				</c:forEach>
    		
    		
    		</c:otherwise>
    	
    	
    	</c:choose>
    
		
		
		
			</div>
			</div>

		  
