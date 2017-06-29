<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ES">

<head>

	<style>
	
		tr {
		
			height:50px;
		
		}
	
	</style>

</head>

<t:paginaBasica title="Colaboracion"/>
<t:paginaBasicaStudent/>
	
	<div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
    	<div class="panel-body" style="background-color:073763">
			<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
            	<div class="table-responsive">
					<h1 style = "color:black; margin:0; padding-left:40px; padding-top:10px	">Modificar Colaboración</h1>
    				<div style = "height:2px; width:55%; background-color:black"></div>
                    
                  
	
   	
    <form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="collaboration">
	       
		<table>
		        	
					        	<tr style = "display:none;height:50px">
					                <td style = "width:175px"><form:label path = "idCollaboration">IdColaboracion</form:label></td>
					                <td><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idCollaboration" disabled = "true" readonly = "true"/><form:errors path = "idCollaboration" cssClass = "error" /></td>
					            
					                <td style = "width:250px; padding-left:100px"><form:label path="idOffer">IdOferta</form:label></td>
					             	<td ><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idOffer" value="${offer.idOffer}" disabled = "true" readonly = "true"/><form:errors path = "idOffer" cssClass = "error" /></td>
									               
					                <td style = "width:250px; padding-left:100px"><form:label path="idDemand">IdDemanda</form:label></td>
					                <td><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idDemand" value = "${demanda.idDemand}" disabled = "true" readonly = "true"/><form:errors path = "idDemand" cssClass = "error" /></td>
					
								</tr>
								
							</table>
							
							<table>
							
								<tr style = "height:50px">
								
									<td style = "width:150px"><label>Oferta</label></td>
									<td><input style = "width:625px; border:1px solid black; color:black" class = "form-control" type = "text" maxlength = "5"  value = "${offer.name}" disabled readonly/></td>
								
								</tr>	
								
								<tr style = "height:50px">
								
									<td style = "width:150px"><label>Demanda</label></td>
									<td><input style = "width:625px; border:1px solid black; color:black" class = "form-control" type = "text" maxlength = "5" value = "${demanda.name}" disabled readonly/></td>
								
								</tr>
								
							
								
							</table>
							
							<table>
							
								<tr style = "height:50px">
								
									<td style = "width:150px"><label>Habilidad</label></td>
									<td><input style = "width:200px; border:1px solid black; color:black" class = "form-control" type = "text" value = "${skill.name}" disabled readonly/></td>
									
									<td style = "width:275px; padding-left:110px"><label>Nivel</label></td>
									<td><input style = "width:75px; border:1px solid black; color:black" class = "form-control" type = "text" value = "${skill.level}" disabled readonly/></td>
								
								</tr>
							
							</table>
							
							<table>
							
								<tr style = "height:50px">
								
									 <td style = "width:150px"><form:label path="hours">Horas</form:label></td>
									 <td><select style = "background-color:eeeeee;width:150px; border:1px solid black; color:black"  Class="form-control" id="hours" name="hours" disabled>
									 	
									 	<c:choose>
									 	
									 		<c:when test = "${collaboration.hours == '' || collaboration.hours == null }">
									 	
									 			<option value="">No establecidas</option>
									 	
									 		</c:when>
									 		<c:otherwise>
									 		
									 			<option value="${collaboration.hours}">(Actual) ${collaboration.hours}</option>
									 		
									 		</c:otherwise>
									 	
									 	</c:choose>
									 	
								 			
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
								
									 <td style = "width:325px; padding-left:160px"><form:label path="rate">Valoración</form:label></td>
									 <td><select style = "background-color:eeeeee;width:150px; border:1px solid black; color:black"  Class="form-control" id="rate" name="rate" disabled>
									 		
									 		<c:choose>
									 	
									 		<c:when test = "${collaboration.rate == 0}">
									 	
									 			<option value="0">No establecida</option>
									 	
									 		</c:when>
									 		<c:otherwise>
									 		
									 			<option value="${collaboration.rate}">(Actual) ${collaboration.rate}</option>
									 		
									 		</c:otherwise>
									 	
									 	</c:choose>
									 							
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
						            
						                <td style = "width:150px"><form:label path="beginningDate">Fecha inicio</form:label></td>
						                <td><form:input cssClass="form-control" style = "background-color:white;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="beginningDate" name="datepicker" id = "from"  size="10" readonly="true"/><form:errors path="beginningDate" cssClass="error" /></td>
						        
						          		<td style = "padding-left:195px;width:360px"><form:label path="endingDate">Fecha fin</form:label></td>
					               		<td><form:input cssClass="form-control" style = "background-color:white;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="endingDate" name="datepicker" id="to" size="10" readonly="true"/><form:errors path="endingDate" cssClass="error" /><td>
						          		
						        </tr>

				            </table>

        
	    <div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
                <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
		<input type = "button" style=  "font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%;margin-top:5%; width:100px; height:35px" data-toggle="modal" data-target="#myModal" class = "btn" value = "Aceptar"  />
        
        
        <!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
	    	<div class="modal-dialog">
	    
		      	<!-- Modal content-->
		      	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 style = "color:black" class="modal-title">Modificar Colaboracion</h4>
		        	</div>
		        	<div class="modal-body">
		          		<p><i>Seguro que desea Modificar esta colaboracion?</i></p>
		        	</div>
		        	<div  class="modal-footer" style = "background-color:eeeeee">
		         		<input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar" onclick = "document.getElementById('idCollaboration').disabled=false,
		         																																																 document.getElementById('idOffer').disabled=false,
		         																																																 document.getElementById('idDemand').disabled=false,
		         																																																 document.getElementById('hours').disabled=false,
		         																																																 document.getElementById('rate').disabled=false;">
		        	</div>
		      	</div>
	      
	    	</div>
	  </div>
	   
    	</form:form>
    	</div>
    	</div>
    	</div>
    	</div>
    	
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script> 
	$(document).ready(function() {
		$("#from").datepicker({
			changeMonth:true,
			changeYear:true,
			showOn: "button",
	           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	           buttonImageOnly: true,
	           dateFormat:"dd/mm/yy",
	           minDate:"${collaboration.getBeginningDate()}",
			onClose: function todate(selectedDate) {
				$("#to").datepicker("option", "minDate", selectedDate);
			}
		}).datepicker("setDate", "${collaboration.getBeginningDate()}");
		$("#to").datepicker({				
			changeMonth:true,
			changeYear:true,
			showOn: "button",
	           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	           buttonImageOnly: true,
	           dateFormat:"dd/mm/yy",
	           minDate:0,
			onClose: function fromdate(selectedDate) {
			$("#from").datepicker("option", "maxDate", selectedDate);
			}
		}).datepicker("setDate", "${collaboration.getEndingDate()}");
	
	  });
</script>