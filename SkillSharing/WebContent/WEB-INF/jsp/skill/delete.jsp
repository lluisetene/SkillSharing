<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "es.uji.ei1027.skillsharing.model.Admin" %>
<%@ page import = "javax.servlet.http.HttpSession" %>

<html lang="es-ES">

	<t:paginaBasica title="Eliminar Habilidad"/>

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
		
	
	   	<script>
     
	   		function popUp(){
         
	   			$("#mostrarmodal").modal("show");
      		};
    
    	</script>

   		<div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      
      		<div class="modal-dialog">
        
        		<div class="modal-content">
           
           			<div class="modal-header">
          
          				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              
              			<h3>Eliminar Habilidad</h3>
           
           			</div>
           
           			<div class="modal-body">
              
              				<h4 style = "color:red"><b>No ha sido posible eliminar la habilidad</b></h4>
	              			<i>Esta habilidad est� siendo usada en ofertas/demandas y es por ello que no puede ser borrada.</i>    
       
       				</div>
           
           			<div class="modal-footer">
          
          				<a href="#" data-dismiss="modal">Cerrar</a>
           
           			</div>
      
      			</div>
   	
   			</div>
	
		</div>
		
		<c:choose>
		
			<c:when test = "${Error == true}">
				<script type="text/javascript">
					
					 popUp();

				</script>
			
			</c:when>
		
		</c:choose>
			
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
				
				<div class = "bordesRedondeados" style = "width:73%;margin-left:25%;margin-top:1%;padding:0.5%;background-color:073763; border:1px solid black; height:85%; margin-bottom:110px">
    
    				<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:100%; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
   						
    					<h1 style = "color:black;margin:0; padding-left:20px">Eliminar Habilidad</h1>
    					
    					<div style = "height:2px; width:40%; background-color:black"></div>
    
				    	<form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="skill">
				      
						<table>
			
				        	<tr style = "height:50px">
				        	
				                <td style = width:25%><form:label style = "padding-right: 50px" path="idSkill" >ID Habilidad</form:label></td>
				                <td><form:input style = "width:10%; border:1px solid black; color:black"  cssClass="form-control" type = "text" maxlength = "5" path="idSkill" disabled = "true" readonly = "true"/><form:errors path = "idSkill" cssClass = "error" /></td>
				               				                
				            </tr>
				            
				            <tr style = "height:50px">
				            
				                <td><form:label style = "padding-right: 50px" path="name">Nombre Habilidad</form:label></td>
				                <td><form:input style = "width:75%; border:1px solid black; color:black"  cssClass="form-control" type = "text" maxlength = "50" path="name" disabled = "true" readonly = "true"/><form:errors path = "name" cssClass = "error" /></td>
				                
				            </tr>
				            
				            <tr style = "height:50px">
				            	<c:set var="nivel" scope="request" value="${skill.level}" />
				                <td><form:label style = "padding-right: 50px" path="level">Nivel</form:label></td>
								<td><select style = "background-color:eeeeee;width:15%; border:1px solid black; color:black"  Class="form-control" id="level" name="level" disabled>
									<c:choose>
									
										<c:when test="${nivel == 'bajo'}">	
									
											<option value="bajo">bajo</option>
											<option value="medio">medio</option>
											<option value="alto">alto</option>
											
										</c:when>
										
										<c:when test="${nivel == 'medio'}">
										
											<option value="medio">medio</option>
											<option value="bajo">bajo</option>
											<option value="alto">alto</option>
										
										</c:when>
										
										<c:when test="${nivel == 'alto'}">
											
											<option value="alto">alto</option>
											<option value="bajo">bajo</option>
											<option value="medio">medio</option>
										
										</c:when>
									
								</c:choose>
								</select></td>
				                
				            </tr>
				            
				            <tr style = "height:50px">
				            
				                <td><form:label path="description" >Descripci�n <h6 style = "display:inline-block">(300 Caracteres)</h6></form:label></td>
				                
				            </tr>
				            
				            <tr>
				            
				            	<td colspan="2"><form:textarea  style = "resize:none; border:1px solid black; color:black" maxlength = "300" rows = "5" cols = "59" cssClass = "form-control" path="description" disabled = "true" readonly = "true"/>
				            	
				            	
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
							          <h4 style = "color:black" class="modal-title">Eliminar Habilidad</h4>
							        </div>
							        <div class="modal-body">
							          <p><i>�Seguro que desea Eliminar esta habilidad?</i></p>
							        </div>
							        <div  class="modal-footer" style = "background-color:eeeeee">
							         <input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar" onclick = "document.getElementById('idSkill').disabled=false,
																																																														document.getElementById('name').disabled=false,
																																																														document.getElementById('level').disabled=false,
																																																														document.getElementById('description').disabled=false;">
							        </div>
							      </div>
							      
							    </div>
							  </div>
					   
					   
		    			</form:form>
		    			
		    		</div>
		
			</div>
			

	  
	  
<t:barrainferior/>