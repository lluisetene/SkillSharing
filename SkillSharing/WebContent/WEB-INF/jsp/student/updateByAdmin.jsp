<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "es.uji.ei1027.skillsharing.model.Admin" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<html lang="es-ES">

	<t:paginaBasica title="Página Personal admin"/>

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
	        	
	        }else{
	        	
	        	nombre = nombreApellidos[0];
				apellidos = nombreApellidos[1] + " " + nombreApellidos[2];
	        	
	        }
	        
        %>
	
		<head>
	
			<style>
	
				
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
				
				<div class = "bordesRedondeados" style = "width:73%;margin-left:25%;margin-top:1%;padding:0.5%;background-color:073763; border:1px solid black; height:100%; margin-bottom:15px">
    
    				<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:100%; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
   						
    					<h1 style = "color:black;margin:0; padding-left:20px">Modificar Usuario</h1>
    					
    					<div style = "height:2px; width:40%; background-color:black"></div>
    
				    	<form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="student">
				      
					        <table>
							
					        	<tr style = "height:50px">
					        	
					                <td style = "padding-right: 150px"><form:label path="nid">DNI</form:label></td>
					                <td><form:input style = "border:1px solid black; color:black" cssClass="form-control" type = "text" maxlength = "9" path="nid" readonly = "true" disabled = "true"/></td>
					                <td><form:errors path="nid" cssClass="error" /></td>
					                
					            </tr>
					            
					            <tr style = "height:50px">
					            
					                <td><form:label path="name">Nombre</form:label></td>
					                <td><form:input  cssClass="form-control" type = "text" maxlength = "50" path="name" style = "width:225%;border:1px solid black; color:black" readonly = "true" disabled = "true"/></td>
					                <td><form:errors path="name" cssClass="error" /></td>
					                
					            </tr>
					            
					            <tr style = "height:50px">
					            
					                <td><form:label path="username">Nombre usuario</form:label></td>
					                <td><form:input  cssClass="form-control" type = "text" maxlength = "30" path="username" style = "width:175%;border:1px solid black; color:black" readonly = "true" disabled = "true"/></td>
					                <td><form:errors path="username" cssClass="error" /></td>
					                
					            </tr>
					            
					            <tr style = "height:50px">
					            
					                <td><form:label path="password">Contraseña</form:label></td>
					                <td><form:input style = "border:1px solid black; color:black" cssClass="form-control" type = "password" maxlength = "30" path="password" readonly = "true" disabled = "true"/></td>
					                <td><form:errors path="password" cssClass="error" /></td>
					                
					            </tr>
					            
					            <tr style = "height:50px">
					            
					                <td><form:label path="mail">Correo</form:label></td>
					                <td><form:input cssClass="form-control" type = "email" maxlength = "30" path="mail" style = "width:175%;border:1px solid black; color:black" readonly = "true" disabled = "true"/></td>
					                <td><form:errors path="mail" cssClass="error" /></td>
					                
					            </tr>
					            
					            <tr style = "height:50px"> 
					            
					                <td><form:label path="course">Curso</form:label></td>
					                <td><form:input style = "border:1px solid black; color:black" cssClass="form-control" type = "number" maxlength = "1" name = "course" min = "1" max = "4" value = "${student.course}" placeholder="º" path="course" readonly = "true" disabled = "true"/></td>
					                <td><form:errors path="course" cssClass="error" /></td>
					                
					            </tr>
					            
					            <tr style = "height:50px">
					            
					                <td><form:label path="offerHours">Horas Ofertadas</form:label></td>
					                <td><select style = "border:1px solid black; color:black" Class="form-control" id = "offerHours" name = "offerHours">
										<option value="20:00" selected="selected">20 horas (por defecto)</option>
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
									
									<td><form:label path="demandHours" style = " padding-left: 50px;padding-right: 50px">Horas Demandadas</form:label></td>
					                <td><select style = "border:1px solid black; color:black" Class="form-control" id = "demandHours" name = "demandHours">
										<option value="00:00" selected="selected">00 horas (por defecto)</option>
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
					          
					            </tr>
					            
					             <tr style = "height:50px">
					            
					                <td><form:label path="banned">Baneado</form:label></td>
					                <td><select style = "border:1px solid black; color:black" Class="form-control" id="banned" name="banned">
										<option value="false" selected="selected">falso</option>
										<option value="true">verdadero</option>
									</select></td>
					            
					            </tr>
					        
					        </table>
					        <div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
					       	<input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%;margin-top:5%; width:100px; height:35px" class = "btn" type = "submit" name = "submit" value = "Aceptar" data-toggle="modal" data-target="#myModal" onclick = "document.getElementById('nid').disabled=false,
																																																											       		document.getElementById('username').disabled=false,
																																																											       		document.getElementById('name').disabled=false,
																																																											       		document.getElementById('password').disabled=false,
																																																											       		document.getElementById('course').disabled=false,
																																																											       		document.getElementById('mail').disabled=false;"/>
					        <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/admin/main.html'" name = "cancel" value = "Cancelar">
					   
		    			</form:form>
		    			
		    		</div>
		
			</div>
			

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
	          <p><i>El usuario ha sido modificado con éxito</i></p>
	        </div>
	        <div  class="modal-footer" style = "background-color:eeeeee">
	          <button type="button" class="btn" data-dismiss="modal" style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px">Aceptar</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	  