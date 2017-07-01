<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "es.uji.ei1027.skillsharing.model.Admin" %>
<%@ page import = "javax.servlet.http.HttpSession" %>

<html lang="es-ES">

	<t:paginaBasica title="Modificar Colaboración"/>

		 <%
	        Admin admin = new Admin();
	        HttpSession sesion = request.getSession();
	        admin = (Admin)sesion.getAttribute("adminLogin");
	        String correo = admin.getMail();   
	        String [] nombreApellidos = admin.getName().split(" ");
	        String nombre = " ";
	        String apellidos = " ";
	        String userName = admin.getUsername();
	        
	        if (nombreApellidos.length == 1){
	        	
	        	nombre = nombreApellidos[0];
	        	
	        }else if (nombreApellidos.length == 2){
	        	
	        	nombre = nombreApellidos[0];
				apellidos = nombreApellidos[1];
	        	
	        }else if (nombreApellidos.length == 3){
	        	
	        	nombre = nombreApellidos[0];
				apellidos = nombreApellidos[1] + " " + nombreApellidos[2];
	        	
	        }else{
	        	
	        	nombre = nombreApellidos[0] + " " + nombreApellidos[1];
				apellidos = nombreApellidos[2] + " " + nombreApellidos[3];
	        	
	        }
	        
        %>
	
		<head>
		
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
	    
	
			<style>
			
			.ui-datepicker-trigger{
	
				height:25px;
				
			}

				th,tr,td{
				
					color:black;
	
				}
				
				.bordesRedondeados{

					-khtml-border-radius: 20px;
					-moz-border-radius: 20px;
					-webkit-border-radius: 20px;
					border-radius: 20px;

				}
			
			</style>
	
		</head>
		
		<body style = "background-color:eeeeee">
			
				<div class = "col-md-3" style="width:25%; margin-left:0%; margin-top:1%">
				
					<div style = "margin-bottom:5%;padding:3%;background-color:white; border:1px solid black; height:100%">
					
						<div class = "panel-body" style="background-color:073763; border:1px solid black; width:100%; height:22%; margin-left:0%; margin-right:0%; padding:5%">
						
							<div class = "col-md-3" style = "padding:0; width:75; display:inline-block">
					
								<span class = "fa fa-user-secret" style="font-size:90px; color:ffffff"></span>
								<p style = "text-align:center;color:eeeeee"><%out.print(userName);%></p>
							
							</div>
							<div  style = "padding-left:5%; width:70%; display:inline-block">
						
								<ul class = "nav">
								
									<li style = "height:30%;color:eeeeee"><%out.print(correo);%></li>
									<li style = "height:30%;color:eeeeee"><%out.print(nombre);%></li>
									<li style = "color:eeeeee"><%out.print(apellidos);%></li>
								
								
								</ul>
							
							</div>

						</div>
						
						<div class = "panel-body" style="background-color:073763; border:1px solid black; width:100%; height:76.5%; margin-left:0%; margin-right:0%; margin-top:3%;padding:5%">
						
							<div style = "font-size:30; width:100%;border:1px solid black;margin-bottom:10;margin-top:5;padding:11;background-color:eeeeee;color:black">
							
									<table>
								
									<tr>
									
										<td class="fa fa-group" style ="color:black;text-align:center;font-size:30px"></td>
										<td style ="padding-left:7;text-align:left;width:50%; color:black"><b>Usuarios</b></td>
										<td style ="text-align:right; width:100%;color:black; font-size:25px"><b><i>${studentsSelect.size()}</i></b></td>
									
									</tr>

								</table>
								
							
							</div>
							<div style = "font-size:30;width:100%;border:1px solid black;margin-bottom:10;padding:11;background-color:eeeeee;color:black">
							
								<table>
								
									<tr>
									
										<td class="fa fa-bullhorn" style ="color:black;text-align:center;font-size:30px"></td>
										<td style ="padding-left:10;text-align:left;width:50%;color:black"><b>Ofertas</b></td>
										<td style ="text-align:right; width:100%;color:black; font-size:25px"><b><i>${offersSelect.size()}</i></b></td>
									
									</tr>
									
								
								
								</table>
							
							</div>
							<div style = "font-size:30;width:100%;border:1px solid black;margin-bottom:8;padding:11;background-color:eeeeee;color:black">
							
								<table >
								
									<tr>
									
										<td class="fa fa-bullhorn" style ="color:black;text-align:center;font-size:30px"></td>
										<td style ="padding-left:10;text-align:left;width:50%;color:black"><b>Demandas</b></td>
										<td style ="text-align:right; width:100%;color:black; font-size:25px"><b><i>${demandsSelect.size()}</i></b></td>
									
									</tr>
									
								
								
								</table>
							
							</div>
							<div style = "font-size:30;width:100%;border:1px solid black;margin-bottom:8;padding:11;background-color:eeeeee;color:black">
							
								<table>
								
									<tr>
									
										<td class="fa fa-slideshare" style ="color:black;text-align:center;font-size:30px"></td>
										<td style ="padding-left:10;text-align:left;width:50%;color:black"><b>Colaboraciones</b></td>
										<td style ="text-align:right; width:100%;color:black; font-size:25px"><b><i>${collaborationsSelect.size()}</i></b></td>
									
									</tr>

								</table>
							
							</div>
							<div  style = "font-size:30;width:100%;border:1px solid black;margin-bottom:8;padding:11;background-color:eeeeee;color:black">
							
								<table>
								
									<tr>
									
										<td class="fa fa-bookmark" style ="color:black;text-align:center;font-size:30px"></td>
										<td style ="padding-left:18;text-align:left;width:50%;color:black"><b>Habilidades</b></td>
										<td style ="text-align:right; width:100%;color:black; font-size:25px"><b><i>${skillsSelect.size()}</i></b></td>
									
									</tr>

								</table>
							
							</div>
							<div  style = "font-size:30;width:100%;border:1px solid black;margin-bottom:8;padding:11;background-color:eeeeee;color:black">
							
								<table>
								
									<tr>
									
										<td class="fa fa-server" style ="color:black;text-align:center;font-size:30px"></td>
										<td style ="padding-left:10;;text-align:left;width:50%;color:black"><b>Grados</b></td>
										<td style ="text-align:right; width:100%;color:black; font-size:25px"><b><i>${degreesSelect.size()}</i></b></td>
									
									</tr>

								</table>
							
							</div>
							<div style = "font-size:30;width:100%;border:1px solid black;padding:11;background-color:eeeeee;color:black">
							
								<table>
								
									<tr>
									
										<td class="fa fa-user-secret" style ="color:black;text-align:center;font-size:30px"></td>
										<td style ="padding-left:15;text-align:left;width:50%;color:black"><b>Administradores</b></td>
										<td style ="text-align:right; width:100%;color:black; font-size:25px"><b><i>${adminsSelect.size()}</i></b></td>
									
									</tr>

								</table>
							
							</div>
						
						</div>
						
					</div>
					
				</div>
				
				<div class = "bordesRedondeados" style = "width:73%;margin-left:25%;margin-top:1%;padding:0.5%;background-color:073763; border:1px solid black; height:83%; margin-bottom:125px">
    
    				<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:100%; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
   						
    					<h1 style = "color:black;margin:0; padding-left:20px">Modificar Colaboración</h1>
    					
    					<div style = "height:2px; width:40%; background-color:black"></div>
    
				    	<form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="collaboration">
				      
							<table>
		        	
					        	<tr style = "height:50px">
					                <td style = "width:145px"><form:label path = "idCollaboration">IdColaboracion</form:label></td>
					                <td><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idCollaboration" disabled = "true" readonly = "true"/><form:errors path = "idCollaboration" cssClass = "error" /></td>
					            
					                <td style = "width:120px; padding-left:50px"><form:label path="idOffer">IdOferta</form:label></td>
					             	<td ><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idOffer" disabled = "true" readonly = "true"/><form:errors path = "idOffer" cssClass = "error" /></td>
									               
					                <td style = "width:150px; padding-left:80px"><form:label path="idDemand">IdDemanda</form:label></td>
					                <td><form:input style = "width:75px; border:1px solid black; color:black" cssClass = "form-control" type = "text" maxlength = "5" path="idDemand" disabled = "true" readonly = "true"/><form:errors path = "idDemand" cssClass = "error" /></td>
					
								</tr>
								
							</table>
							
							<table>
							
								<tr style = "height:50px">
								
									<td style = "width:145px"><label>Oferta</label></td>
									<td><input style = "width:625px; border:1px solid black; color:black" class = "form-control" type = "text" maxlength = "5"  value = "${offerName.name}" disabled/></td>
								
								</tr>	
								
								<tr style = "height:50px">
								
									<td style = "width:145px"><label>Demanda</label></td>
									<td><input style = "width:625px; border:1px solid black; color:black" class = "form-control" type = "text" maxlength = "5" value = "${demandName.name}" disabled/></td>
								
								</tr>
								
							</table>
							
							<table>
							
								<tr style = "height:50px">
								
									 <td style = "width:145px"><form:label path="hours">Horas</form:label></td>
									 <td><select style = "width:150px; border:1px solid black; color:black"  Class="form-control" id="hours" name="hours">
									 	
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
								
									 <td style = "width:195px; padding-left:112px"><form:label path="rate">Valoración</form:label></td>
									 <td><select style = "width:170px; border:1px solid black; color:black"  Class="form-control" id="rate" name="rate">
									 		
									 		<c:choose>
									 	
									 		<c:when test = "${collaboration.rate == 0}">
									 	
									 			<option value="0">No establecidas</option>
									 	
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
						            
						                <td style = "width:145px"><form:label path="beginningDate">Fecha inicio</form:label></td>
						                <td><form:input cssClass="form-control" style = "background-color:white;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="beginningDate" name="datepicker" id = "from"  size="10" readonly="true"/><form:errors path="beginningDate" cssClass="error" /></td>
						        
						          		<td style = "padding-left:138px;width:195px"><form:label path="endingDate">Fecha fin</form:label></td>
					               		<td><form:input cssClass="form-control" style = "background-color:white;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="endingDate" name="datepicker" id="to" size="10" readonly="true"/><form:errors path="endingDate" cssClass="error" /><td>
						          		
						        </tr>

				            </table>

				<div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
				<input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/admin/main.html'" name = "cancel" value = "Cancelar">
					   		<input type = "button" style=  "font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%;margin-top:5%; width:100px; height:35px" data-toggle="modal" data-target="#myModal" class = "btn" value = "Aceptar"  />
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
							          <p><i>¿Seguro que desea Modificar esta Colaboración?</i></p>
							        </div>
							        <div  class="modal-footer" style = "background-color:eeeeee">
							         <input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar" onclick = "document.getElementById('idCollaboration').disabled=false, 
	        																   document.getElementById('idOffer').disabled=false,
	        																   document.getElementById('idDemand').disabled=false;">
							        </div>
							      </div>
							      
							    </div>
							  </div>
					   
					   
		    			</form:form>
		    			
		    		</div>
		
			</div>

<t:barrainferior/>