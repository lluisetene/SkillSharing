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

<t:paginaBasica title="Colaboración"/>
<t:paginaBasicaStudent/>
	
	<div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
    	<div class="panel-body" style="background-color:073763">
			<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
            	<div class="table-responsive">
					<h1 style = "color:black; margin:0; padding-left:40px; padding-top:10px	">Valorar Colaboración</h1>
    				<div style = "height:2px; width:55%; background-color:black"></div>
                    
                  
	
   	
			    <form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="collaboration">
				       
					<table>
		        	
					        	<tr style = "height:50px">
					                <td style = "width:145px"><form:label path = "idCollaboration">IdColaboracion</form:label></td>
					                <td><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idCollaboration" disabled = "true" readonly = "true"/><form:errors path = "idCollaboration" cssClass = "error" /></td>
					            
					                <td style = "width:175px; padding-left:75px"><form:label path="idOffer">Oferta</form:label></td>
					             	<td ><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idOffer" disabled = "true" readonly = "true"/><form:errors path = "idOffer" cssClass = "error" /></td>
									               
					                <td style = "width:200px; padding-left:75px"><form:label path="idDemand">IdDemanda</form:label></td>
					                <td><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idDemand" disabled = "true" readonly = "true"/><form:errors path = "idDemand" cssClass = "error" /></td>
					
								</tr>
								
							</table>
							
							<table>
							
								<tr style = "height:50px">
								
									<td style = "width:145px"><label>Oferta</label></td>
									<td><input style = "width:600px; border:1px solid black; color:black" class = "form-control" type = "text" maxlength = "5"  value = "${offerName.name}" disabled/></td>
								
								</tr>	
								
								<tr style = "height:50px">
								
									<td style = "width:145px"><label>Demanda</label></td>
									<td><input style = "width:600px; border:1px solid black; color:black" class = "form-control" type = "text" maxlength = "5" value = "${demandName.name}" disabled/></td>
								
								</tr>
								
							</table>
							
							<table>
							
								<tr style = "height:50px">
								
									 <td style = "width:145px"><form:label path="hours">Horas</form:label></td>
									 <td><select style = "width:100px; border:1px solid black; color:black"  Class="form-control" id="hours" name="hours">
						 						<option value="---" selected="selected">---</option>
						 						<option value="01:00">01:00</option>
						 						<option value="02:00">02:00</option>
						 						<option value="03:00">03:00</option>
						 						<option value="04:00">04:00</option>
						 						<option value="05:00">05:00</option>
						 						<option value="06:00">06:00</option>
						 						<option value="07:00">07:00</option>
						 						<option value="08:00">08:00</option>
						 						<option value="09:00">09:00</option>
						 						<option value="10:00">10:00</option>
 										</select></td>
								
									 <td style = "width:300px; padding-left:150px"><form:label path="rate">Valoración</form:label></td>
									 <td><select style = "width:100px; border:1px solid black; color:black"  Class="form-control" id="rate" name="rate">
						 						<option value="---" selected="selected">---</option>
						 						<option value="1">1</option>
						 						<option value="2">2</option>
						 						<option value="3">3</option>
						 						<option value="4">4</option>
						 						<option value="5">5</option>
						 						<option value="6">6</option>
						 						<option value="7">7</option>
						 						<option value="8">8</option>
						 						<option value="9">9</option>
						 						<option value="10">10</option>
										</select></td>
								
								</tr>
							
							</table>
							
							<table>
								
								<tr style = "height:100px">
						            
						                <td style = "width:145px"><form:label path="beginningDate">Fecha inicio</form:label></td>
						                <td><form:input cssClass="form-control" style = "background-color:eeeeee;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="beginningDate" name="datepicker" id = "from"  size="10" readonly="true"/><form:errors path="beginningDate" cssClass="error" /></td>
						        
						          		<td style = "padding-left:150px;width:300px"><form:label path="endingDate">Fecha fin</form:label></td>
					               		<td><form:input cssClass="form-control" style = "background-color:eeeeee;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="endingDate" name="datepicker" id="to" size="10" readonly="true"/><form:errors path="endingDate" cssClass="error" /><td>
						          		
						        </tr>

				            </table>
        
	    <div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
		<input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%;margin-top:5%; width:100px; height:35px" class = "btn" value = "Aceptar" data-toggle="modal" data-target="#myModal" onClick = "document.getElementById('idCollaboration').disabled=false,
																																																												document.getElementById('idOffer').disabled=false,
																																																												document.getElementById('idDemand').disabled=false,
																																																												document.getElementById('beginningdate').disabled=false;">
        <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
        
        
        <!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
	    	<div class="modal-dialog">
	    
		      	<!-- Modal content-->
		      	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 style = "color:black" class="modal-title">Modificar Colaboración</h4>
		        	</div>
		        	<div class="modal-body">
		          		<p><i>¿La valoración indicada es la correcta?</i></p>
		        	</div>
		        	<div  class="modal-footer" style = "background-color:eeeeee">
		         		<input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar">
		        	</div>
		      	</div>
	      
	    	</div>
	  </div>
	  </form:form>
	  </div>
	  </div>
	  </div>
	  
	  </div>
	  <div>  </div>
	
