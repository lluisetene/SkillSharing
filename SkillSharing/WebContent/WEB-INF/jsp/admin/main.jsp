<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "es.uji.ei1027.skillsharing.model.Admin" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<c:set var="adminLogin" scope="request" value="${session.getAttribute('adminLogin')}" />

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
				
				<div class = "bordesRedondeados" style = "width:73%;margin-left:25%;margin-top:1%;padding:0.5%;background-color:073763; border:1px solid black; height:396%; margin-bottom:15px">
		
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
									<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="student">
										
										<td style = "font-size:30px;color:black">Usuarios</td>
										<td style = "font-size:15px; padding-top:10px; padding-left:130px;color:black">DNI</td>
										<td  style = "font-size:25px; padding-left:65px;color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
										<td style = "padding-left:10px;color:black">

										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="nid" name="nid">
					
											<option value="Todas" >Todas</option>	
											
											<c:forEach items="${studentsSelect}" var="student">
							
												<option value="${student.nid}">${student.nid}</option>
					
											</c:forEach>
											
										</select>
										
									</td>
									
									</form:form>
									
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
								
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>DNI</th>
										<th>Nombre Usuario</th>
										<th>Nombre y Apellidos</th>
										<th>Baneado</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${studentsList}" var="student">
	          
	           						 	<tr>
	          
							          		<td>${student.nid}</td>
							          		<td>${student.username}</td>
							                <td><div style = "width: 225;overflow:hidden;white-space:nowrap;text-overflow: ellipsis;">${student.name}</div></td>
							           		<td>${student.banned}</td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/student/updateByAdmin/${student.nid}.html'"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/student/deleteByAdmin/${student.nid}.html'"></button></td>
							           
	            						</tr>
	        
	        						</c:forEach>  

								</table>
								
							</div>
							
						</div>	
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
								
									
								<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="admin">
									<td style = "font-size:30px;color:black">Admins</td>
									<td style = "font-size:15px; padding-top:10px; padding-left:150px;color:black">Usuario</td>
									<td style = "font-size:25px; padding-left:40px;color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									<td style = "padding-left:10px;color:black">
									
										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="username" name="username">
					
											<option value="Todas" >Todas</option>	
											
											<c:forEach items="${adminsSelect}" var="admin">
							
												<option value="${admin.username}">${admin.username}</option>
					
											</c:forEach>
											
										</select>
									</form:form>
									
									<td style = "font-size:20px; padding-left:240px;color:black"><b>Añadir</b></td>
									<td style = "font-size:30px; padding-left:10px;color:black"><button style = "background-color:eeeeee;  border:none" onclick = "location='http:${pageContext.request.contextPath}/admin/add.html'"><span style = "color: black; background-color:eeeeee" class="fa fa-plus-circle"></span></button></td>
								
								
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
							
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre Usuario</th>
										<th>Nombre y Apellidos</th>
										<th>Correo</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${adminsList}" var="admin">
							
										<c:choose>
		          							
		          							<c:when test="${adminLogin.username != admin.username}">
				
			           						 	<tr>
			          
									          		<td>${admin.username}</td>
									                <td><div style = "width: 225;overflow:hidden;white-space:nowrap;text-overflow: ellipsis;">${admin.name}</div></td>
									           		<td>${admin.mail}</td>
									           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/admin/update/${admin.username}.html'"></button></td>
								               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/admin/delete/${admin.username}.html'"></button></td>
									           
			            						</tr>
			            					</c:when>
			            					<c:when test="${adminLogin.username == admin.username}">
			            						<td>${admin.username}</td>
								                <td><div style = "width: 225;overflow:hidden;white-space:nowrap;text-overflow: ellipsis;">${admin.name}</div></td>
								           		<td>${admin.mail}</td>
								           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/admin/update/${admin.username}.html'" disabled></button></td>
								               	<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/admin/delete/${admin.username}.html'" disabled></button></td>
			            					</c:when>
		        						</c:choose>
	        						</c:forEach>  
	
								</table>
								
							</div>
						
						</div>
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
								<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="skill">
									<td style = "font-size:30px;color:black">Habilidades</td>
									<td style = "font-size:15px; padding-top:10px; padding-left:95px;color:black">Habilidad</td>
									<td style = "font-size:25px; padding-left:30px;color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									<td style = "padding-left:10px;color:black">

										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="idSkill" name="idSkill">
					
											<option value="Todas" >Todas</option>	
											
											<c:forEach items="${skillsSelect}" var="skill">
							
												<option value="${skill.idSkill}">${skill.name}</option>
					
											</c:forEach>
											
										</select>
									</form:form>
								
									<td style = "font-size:20px; padding-left:240px;color:black"><b>Añadir</b></td>
									<td style = "font-size:30px; padding-left:10px;color:black"><button style = "background-color:eeeeee;  border:none" onclick = "location='http:${pageContext.request.contextPath}/skill/add.html'"><span style = "color: black; background-color:eeeeee" class="fa fa-plus-circle"></span></button></td>
								
								</tr>
							
							</table>
							
						<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
						
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre</th>
										<th>Nivel</th>
										<th>Descripción</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${skillsList}" var="skill">
	          
	           						 	<tr>
	          
							          		<td><div style = "width: 150;overflow:hidden;white-space:nowrap;text-overflow: ellipsis;">${skill.name}</div></td>
							                <td>${skill.level}</td>
							           		<td><div style = "width: 550;overflow:hidden;white-space:nowrap;text-overflow: ellipsis;">${skill.description}</div></td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/skill/update/${skill.idSkill}.html'"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/skill/delete/${skill.idSkill}.html'"></button></td>
							           
	            						</tr>
	        
	        						</c:forEach> 
	
								</table>
								
							</div>
						
						</div>
						
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
								<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="degree">
									<td style = "font-size:30px;color:black">Grados</td>
									<td style = "font-size:15px; padding-top:10px; padding-left:155px;color:black">Grado</td>
									<td style = "font-size:25px; padding-left:50px;color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									<td style = "padding-left:10px;color:black">
									
										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="name" name="name">
					
											<option value="Todas" >Todas</option>	
											
											<c:forEach items="${degreesSelect}" var="degree">
							
												<option value="${degree.name}">${degree.name}</option>
					
											</c:forEach>
											
										</select>
									</form:form>
									
									<td style = "font-size:20px; padding-left:235px;color:black"><b>Añadir</b></td>
									<td style = "font-size:30px; padding-left:10px;color:black"><button style = "background-color:eeeeee;  border:none" onclick = "location='http:${pageContext.request.contextPath}/degree/add.html'"><span style = "color: black; background-color:eeeeee" class="fa fa-plus-circle"></span></button></td>
								
								</tr>
							
							</table>
							
						<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
							
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre</th>
										<th>DNI Estudiante</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${degreesList}" var="degree">
	          
	           						 	<tr>
	          
							          		<td>${degree.name}</td>
							          		<td>${degree.nid}</td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/degree/update/${degree.idDegree}.html'"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/degree/delete/${degree.idDegree}.html'"></button></td>
							           
	            						</tr>
	        
	        						</c:forEach> 
	
								</table>
								
							</div>	
						
						</div>
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
								<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="offer">
									<td style = "font-size:30px;color:black">Ofertas</td>
									<td style = "font-size:15px; padding-top:10px; padding-left:155px;color:black">Habilidad</td>
									<td style = "font-size:25px; padding-left:30px;color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									<td style = "padding-left:10px;color:black">

										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="idOffer" name="idOffer">
					
											<option value="Todas" >Todas</option>	
											
											<c:forEach items="${skillsSelect}" var="skill">
							
												<option value="${skill.idSkill}">${skill.name}</option>
					
											</c:forEach>
											
										</select>									
									
									</td>
								</form:form>
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
								
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre</th>
										<th>Habilidad</th>
										<th>Fecha Inicio</th>
										<th>Fecha Fin</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${offersList}" var="offer">
	          
	           						 	<tr>
	          
							          		<td>${offer.name}</td>
							                <td>${offer.getIdSkill().split("/")[1]}</td>
							           		<td>${offer.beginningDate}</td>
							           		<td>${offer.endingDate}</td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/offer/updateByAdmin/${offer.idOffer}.html'"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/offer/deleteByAdmin/${offer.idOffer}.html'"></button></td>
							           
	            						</tr>
	        
	        						</c:forEach>
								

								</table>
								
							</div>
							
						
						</div>
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
								<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="demand">
									<td style = "font-size:30px;color:black">Demandas</td>
									<td style = "font-size:15px; padding-top:10px; padding-left:107px;color:black">Habilidad</td>
									<td style = "font-size:25px; padding-left:30px;color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									<td style = "padding-left:10px;color:black">
									
									<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="idDemand" name="idDemand">
										<option value="Todas" >Todas</option>	
										
										<c:forEach items="${skillsSelect}" var="skill">
						
											<option value="${skill.idSkill}">${skill.name}</option>
				
										</c:forEach>
										
									</select>
									
									</td>
								</form:form>	
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
								
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre</th>
										<th>Habilidad</th>
										<th>Fecha Inicio</th>
										<th>Fecha Fin</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${demandsList}" var="demand">
	          
	           						 	<tr>
	          
							          		<td>${demand.name}</td>
							                <td>${demand.getIdSkill().split("/")[1]}</td>
							           		<td>${demand.beginningDate}</td>
							           		<td>${demand.endingDate}</td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/demand/updateByAdmin/${demand.idDemand}.html'"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/demand/deleteByAdmin/${demand.idDemand}.html'"></button></td>
							           
	            						</tr>
	        
	        						</c:forEach> 

								</table>
								
							</div>
							
							
						</div>
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
								<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="collaboration">
									<td style = "font-size:30px;color:black">Colaboraciones</td>
									<td style = "font-size:15px; padding-top:10px; padding-left:45px;color:black">Puntuación</td>
									<td style = "font-size:25px; padding-left:20px;color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									<td style = "padding-left:10px;color:black">
									
									<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="rate" name="rate">
										
											<option value="-1" >Todas</option>	
											
											<c:forEach items="${collaborationsSelect}" var="collaboration">
							
												<option value="${collaboration.rate}">${collaboration.rate}</option>
					
											</c:forEach>
											
										</select>
									
									</td>
								</form:form>
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
								
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Id Colaboración</th>
										<th>Fecha Inicio</th>
										<th>Fecha Fin</th>
										<th>Horas</th>
										<th>Puntuación</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${collaborationsList}" var="collaboration">
	          
	           						 	<tr>
	          
							          		<td>${collaboration.idCollaboration}</td>
							                <td>${collaboration.beginningDate}</td>
							           		<td>${collaboration.endingDate}</td>
							           		<td>${collaboration.hours}</td>
							           		<td>${collaboration.rate}</td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/updateByAdmin/${collaboration.idCollaboration}.html'"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/deleteByAdmin/${collaboration.idCollaboration}.html'"></button></td>
							           
	            						</tr>
	        
	        						</c:forEach>

								</table>
								
							</div>
						
						</div>
						
				</div>
	
		</body>
<t:barrainferior>
</t:barrainferior>
</html>