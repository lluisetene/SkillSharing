<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "es.uji.ei1027.skillsharing.model.Admin" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.SkillDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.StudentDAO" %>
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
	
		<body style = "background-color:eeeeee" onload="load()">
			
				<div class = "col-md-3" style="width:25%; margin-left:0%; margin-top:1%">
				
					<div style = "margin-bottom:5%;padding:3%;background-color:white; border:1px solid black; height:635px">
					
						<div class = "panel-body" style="background-color:073763; border:1px solid black; width:100%; height:21%; margin-left:0%; margin-right:0%; padding:5%">
						
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
						
						<div class = "panel-body" style="background-color:073763; border:1px solid black; width:100%; height:78%; margin-left:0%; margin-right:0%; margin-top:3%;padding:5%">
						
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
							<div style = "font-size:30;width:100%;border:1px solid black;margin-bottom:10;padding:11;background-color:eeeeee;color:black">
							
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
				
				<div class = "bordesRedondeados" style = "width:73%;margin-left:25%;margin-top:1%;padding:0.5%;background-color:073763; border:1px solid black; height:456%; margin-bottom:15px">
		
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:350; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>
									<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="student">
										
										<td style = "font-size:30px;color:black">Usuarios</td>
										<td style = "font-size:15px; padding-top:3px; padding-left:180px;color:black">DNI</td>
										<td style = "padding-left:10px; color:black">

										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="nid" name="nid">
					
											<option value="Todas" >Todas</option>	
											
											<c:forEach items="${studentsSelect}" var="student">
							
												<option value="${student.nid}">${student.nid}</option>
					
											</c:forEach>
											
										</select>
										
										</td>
									
									<td  style = "font-size:25px; padding-left:10px; color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									
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
									<td style = "font-size:15px; padding-top:3px; padding-left:175px;color:black">Usuario</td>
									<td style = "padding-left:10px; color:black">
									
										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="username" name="username">
					
											<option value="Todas" >Todas</option>	
											
											<c:forEach items="${adminsSelect}" var="admin">
							
												<option value="${admin.username}">${admin.username}</option>
					
											</c:forEach>
											
										</select>
										
									</td>
										
									<td style = "font-size:25px; padding-left:10px; color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
										
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
									<td style = "font-size:15px; padding-top:3px; padding-left:105px;color:black">Habilidad</td>
									<td style = "padding-left:10px; color:black">

										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="idSkill" name="idSkill">
					
											<option value= 0 >Todas</option>	
											
											<c:forEach items="${skillsDistinctSelect}" var="skill">
							
												<option value="${skill.idSkill}">${skill.name}</option>
					
											</c:forEach>
											
										</select>
										
										</td>
										
									<td style = "font-size:25px; padding-left:10px; color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
										
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
									<td style = "font-size:15px; padding-top:3px; padding-left:190px;color:black">Grado</td>
									<td style = "padding-left:10px; color:black">
									
										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="idDegree" name="idDegree">
					
											<option value= 0 >Todas</option>	
											
											<c:forEach items="${degreesSelect}" var="degree">
							
												<option value="${degree.idDegree}">${degree.name}</option>
					
											</c:forEach>
											
										</select>
										
										</td>
										
									<td style = "font-size:25px; padding-left:10px; color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
										
									</form:form>
								
								
								</tr>
							
							</table>
							
						<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
							
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre</th>
										<th></th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${degreesList}" var="degree">
	          
	           						 	<tr>
	          
							          		<td>${degree.name}</td>
							          		
							          		<td style = "width:10;text-align:center"><button class="btn fa fa-eye" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/degree/list/${degree.idDegree}.html'"></button></td>
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
									<td style = "font-size:15px; padding-top:3px; padding-left:175px;color:black">Habilidad</td>
									<td style = "padding-left:10px; color:black">

										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="idOffer" name="idOffer">
					
											<option value= 0 >Todas</option>	
											
											<c:forEach items="${skillsDistinctSelect}" var="skill">
							
												<option value="${skill.idSkill}">${skill.name}</option>
					
											</c:forEach>
											
										</select>
										
									</td>
									
									<td style = "font-size:25px; padding-left:10px; color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									
								</form:form>
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
								
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre</th>
										<th>Habilidad</th>
										<th>Nivel</th>
										<th>Fecha Inicio</th>
										<th>Fecha Fin</th>
										<th></th>
										<th></th>
									
									</tr>	
									
									<c:forEach items="${offersList1}" var="offer">
	           						 	<tr>
	          								<c:set var="skillOffer" scope="request" value="${offer.getIdSkill()}" />
							          		
							          		<td>${offer.name}</td>
							          		
							          		<c:forEach items="${skillsSelect}" var="skill">
							          			
							          			<c:choose>
							          					
							          					<c:when test = "${skill.idSkill == skillOffer }">
							          				
											          		<td>${skill.getName()}</td>
											           		<td>${skill.getLevel()}</td>
							           					
							           					</c:when>
							           			
							           			</c:choose>
							           		
							           		</c:forEach>
							           		
							           		<td style = "width:11%">${offer.beginningDate}</td>
							           		<td style = "width:11%">${offer.endingDate}</td>
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
								<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="offer">
									<td style = "font-size:30px;color:black">Demandas</td>
									<td style = "font-size:15px; padding-top:3px; padding-left:130px;color:black">Habilidad</td>
									<td style = "padding-left:10px; color:black">

										<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="idDemand" name="idDemand">
					
											<option value= 0 >Todas</option>	
											
											<c:forEach items="${skillsDistinctSelect}" var="skill">
							
												<option value="${skill.idSkill}">${skill.name}</option>
					
											</c:forEach>
											
										</select>									
									
									</td>
									
								<td style = "font-size:25px; padding-left:10px; color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
								
								</form:form>
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
								
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Nombre</th>
										<th>Habilidad</th>
										<th>Nivel</th>
										<th>Fecha Inicio</th>
										<th>Fecha Fin</th>
										<th></th>
										<th></th>
									
									</tr>	
									
									<c:forEach items="${demandsList1}" var="demand">
	           						 	<tr>
	          								<c:set var="skillDemand" scope="request" value="${demand.getIdSkill()}" />
							          		
							          		<td>${demand.name}</td>
							          		
							          		<c:forEach items="${skillsSelect}" var="skill">
							          			
							          			<c:choose>
							          					
							          					<c:when test = "${skill.idSkill == skillDemand }">
							          				
											          		<td>${skill.getName()}</td>
											           		<td>${skill.getLevel()}</td>
							           					
							           					</c:when>
							           			
							           			</c:choose>
							           		
							           		</c:forEach>
							           		
							           		<td style = "width:11%">${demand.beginningDate}</td>
							           		<td style = "width:11%">${demand.endingDate}</td>
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
									<td style = "font-size:15px; padding-top:3px; padding-left:60px;color:black">Puntuación</td>
									<td style = "padding-left:10px; color:black">
									
									<select class = "form-control" style="border: 1px solid black; color:black;width:200px" id="rate" name="rate">
										
											<option value= 0 >Todas</option>	
											
											<c:forEach items="${collaborationsDistinctSelect}" var="collaboration">
							
												<option value="${collaboration.rate}">${collaboration.rate}</option>
					
											</c:forEach>
											
										</select>
									
									</td>
									
								<td style = "font-size:25px; padding-left:10px; color:black"><button style = "background-color:eeeeee;  border:none" type="submit"><span style = "color: black; background-color:eeeeee" class="fa fa-search"></span></button></td>
									
								</form:form>
								</tr>
							
							</table>
							
							<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
								
								<table class="table table-bordered table-hover table-striped">
								
									<tr style = "color:black; background-color:cccccc;font-size:12px">
									
										<th>Ofertante</th>
										<th>Demandante</th>
										<th>Fecha Inicio</th>
										<th>Fecha Fin &nbsp;<i class="fa fa-info-circle" style = "font-size:17px;" title = "Se muestran las colaboraciones con fecha final >= al més actual"></i></th>
										<th>Horas</th>
										<th>Puntuación</th>
										<th>Estado</th>
										<th></th>
										<th></th>
									
									</tr>	
									<c:forEach items="${collaborationsList}" var="collaboration">
	          
	           						 	<tr>
	           						 	
	           						 		<c:forEach items="${listaOfertasColab}" var="offer">
	           						 		
	           						 			<c:choose>
	           						 			
	           						 				<c:when test="${collaboration.idOffer == offer.idOffer }">
	           						 				
	           						 					<td>${student.getStudent(offer.nid).username}</td>
	           						 				
	           						 				</c:when>
	           						 			
	           						 			</c:choose>
	           						 	
	          									
	          								
	          								</c:forEach>
	          								<c:forEach items="${listaDemandasColab}" var="demand">
	           						 		
	           						 			<c:choose>
	           						 			
	           						 				<c:when test="${collaboration.idDemand == demand.idDemand }">
	           						 				
	           						 					<td>${student.getStudent(demand.nid).username}</td>
	           						 				
	           						 				</c:when>
	           						 			
	           						 			</c:choose>
	           						 	
	          									
	          								
	          								</c:forEach>
							                <td>${collaboration.beginningDate}</td>
							           		<td>${collaboration.endingDate}</td>	
							           		<td>${collaboration.hours}</td>
							           		
							           		<c:choose>
							           		
							           			<c:when test = "${collaboration.rate != 0.0}">
							           			
							           				<td style = "width:5%">${collaboration.rate}</td>
							           			
							           			</c:when>
							           			<c:otherwise>
							           			
							           				<td></td>
							           			
							           			</c:otherwise>

							           		</c:choose>
							           		
							           		<c:choose>
							           		
							           			<c:when test = "${(collaboration.hours == null || collaboration.hours == '') || (collaboration.rate == 0)}">
							           			
							           				<td style = " width:1%;text-align:center"><i class="fa fa-unlock-alt" style = "font-size:25px" ></i></td>
							           				<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/updateByAdmin/${collaboration.idCollaboration}.html'"></button></td>
							           			
							           			</c:when>
							           			<c:otherwise>
							           			
							           				<td style = " width:1%;text-align:center"><i class="fa fa-lock" style = "font-size:25px" ></i></td>
							           				<td style = "width:10;text-align:center"><button disabled class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/updateByAdmin/${collaboration.idCollaboration}.html'"></button></td>
							           			
							           			</c:otherwise>
							           		
							           		</c:choose>
							           		
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/deleteByAdmin/${collaboration.idCollaboration}.html'"></button></td>
							           
	            						</tr>
	        
	        						</c:forEach>

								</table>
								
							</div>
							
						</div>
						<div class = "bordesRedondeados panel-body" style="background-color:eeeeee; border:1px solid black; width:100%; height:380; margin-left:0%; margin-right:0%; padding:1%; margin-bottom:1%">
						
							<table>
							
								<tr>

									<td style="font-size:30px">Estadísticas</td>
									<td style="padding-left:20px"></td>
									<td><form name="grafica" style="padding-left:130px; padding-top:15px">
	                        				<select class = "form-control" style="border: 1px solid black; color:black;width:270px;" name="selectFecha" id="selectFecha" >
												<option selected id="selectAño">Ofertas/Demandas de este Año</option>
												<option id="selectMes">Ofertas/Demandas de este Mes</option>
											</select>
									</form></td>
								</tr>
							</table>
		                      
							<div id="divAño" style="height:300px;"></div>
							<div id="divMes" style="height:300px;"></div>
						
						</div>
				</div>
				
		</body>						
<t:barrainferior>
</t:barrainferior>


<script type="text/javascript">

function load() {
	var show = document.getElementById('divAño');
	show.style.display="block";
	var hide = document.getElementById('divMes');
	hide.style.display="none";
	var hideColYear = document.getElementById('divColYear');
	hideColYear.style.display="none";
	var hideColMonth = document.getElementById('divColMonth');
	hideColMonth.style.display="none";
}

document.addEventListener('DOMContentLoaded', function() {
    Morris.Bar({
    	element: "divAño",
        data: [
      	  { y: 'Enero', a: ${statistics.getOfertasAñoTodosEstudiantes(1)}, b: ${statistics.getDemandasAñoTodosEstudiantes(1)} },
            { y: 'Febrero', a: ${statistics.getOfertasAñoTodosEstudiantes(2)},  b: ${statistics.getDemandasAñoTodosEstudiantes(2)} },
            { y: 'Marzo', a: ${statistics.getOfertasAñoTodosEstudiantes(3)},  b: ${statistics.getDemandasAñoTodosEstudiantes(3)} },
            { y: 'Abril', a: ${statistics.getOfertasAñoTodosEstudiantes(4)},  b: ${statistics.getDemandasAñoTodosEstudiantes(4)} },
            { y: 'Mayo', a: ${statistics.getOfertasAñoTodosEstudiantes(5)},  b: ${statistics.getDemandasAñoTodosEstudiantes(5)} },
            { y: 'Junio', a: ${statistics.getOfertasAñoTodosEstudiantes(6)},  b: ${statistics.getDemandasAñoTodosEstudiantes(6)} },
            { y: 'Julio', a: ${statistics.getOfertasAñoTodosEstudiantes(7)},  b: ${statistics.getDemandasAñoTodosEstudiantes(7)} },
            { y: 'Agosto', a: ${statistics.getOfertasAñoTodosEstudiantes(8)},  b: ${statistics.getDemandasAñoTodosEstudiantes(8)} },
            { y: 'Septiembre', a: ${statistics.getOfertasAñoTodosEstudiantes(9)},  b: ${statistics.getDemandasAñoTodosEstudiantes(9)} },
            { y: 'Octubre', a: ${statistics.getOfertasAñoTodosEstudiantes(10)},  b: ${statistics.getDemandasAñoTodosEstudiantes(10)} },
            { y: 'Noviembre', a: ${statistics.getOfertasAñoTodosEstudiantes(11)},  b: ${statistics.getDemandasAñoTodosEstudiantes(11)} },
            { y: 'Diciembre', a: ${statistics.getOfertasAñoTodosEstudiantes(12)}, b: ${statistics.getDemandasAñoTodosEstudiantes(12)} }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Oferta', 'Demanda'],
    });
     
    Morris.Bar({
      element: "divMes",
      data: [
    	  { y: 'Día 1', a: ${statistics.getOfertasFecha(1, 7)},  b: ${statistics.getDemandasFecha(1, 7)} },
          { y: 'Día 2', a: ${statistics.getOfertasFecha(2, 7)},  b: ${statistics.getDemandasFecha(2, 7)} },
          { y: 'Día 3', a: ${statistics.getOfertasFecha(3, 7)},  b: ${statistics.getDemandasFecha(3, 7)} },
          { y: 'Día 4', a: ${statistics.getOfertasFecha(4, 7)},  b: ${statistics.getDemandasFecha(4, 7)} },
          { y: 'Día 5', a: ${statistics.getOfertasFecha(5, 7)},  b: ${statistics.getDemandasFecha(5, 7)} },
          { y: 'Día 6', a: ${statistics.getOfertasFecha(6, 7)},  b: ${statistics.getDemandasFecha(6, 7)} },
          { y: 'Día 7', a: ${statistics.getOfertasFecha(7, 7)},  b: ${statistics.getDemandasFecha(7, 7)} },
          { y: 'Día 8', a: ${statistics.getOfertasFecha(8, 7)},  b: ${statistics.getDemandasFecha(8, 7)} },
    	  { y: 'Día 9', a: ${statistics.getOfertasFecha(9, 7)},  b: ${statistics.getDemandasFecha(9, 7)} },
          { y: 'Día 10', a: ${statistics.getOfertasFecha(10, 7)},  b: ${statistics.getDemandasFecha(10, 7)} },
          { y: 'Día 11', a: ${statistics.getOfertasFecha(11, 7)},  b: ${statistics.getDemandasFecha(11, 7)} },
          { y: 'Día 12', a: ${statistics.getOfertasFecha(12, 7)},  b: ${statistics.getDemandasFecha(12, 7)} },
          { y: 'Día 13', a: ${statistics.getOfertasFecha(13, 7)},  b: ${statistics.getDemandasFecha(13, 7)} },
          { y: 'Día 14', a: ${statistics.getOfertasFecha(14, 7)},  b: ${statistics.getDemandasFecha(14, 7)} },
          { y: 'Día 15', a: ${statistics.getOfertasFecha(15, 7)},  b: ${statistics.getDemandasFecha(15, 7)} },
          { y: 'Día 16', a: ${statistics.getOfertasFecha(16, 7)},  b: ${statistics.getDemandasFecha(16, 7)} },
    	  { y: 'Día 17', a: ${statistics.getOfertasFecha(17, 7)}, b: ${statistics.getDemandasFecha(17, 7)} },
          { y: 'Día 18', a: ${statistics.getOfertasFecha(18, 7)},  b: ${statistics.getDemandasFecha(18, 7)} },
          { y: 'Día 19', a: ${statistics.getOfertasFecha(19, 7)},  b: ${statistics.getDemandasFecha(19, 7)} },
          { y: 'Día 20', a: ${statistics.getOfertasFecha(20, 7)},  b: ${statistics.getDemandasFecha(20, 7)} },
          { y: 'Día 21', a: ${statistics.getOfertasFecha(21, 7)},  b: ${statistics.getDemandasFecha(21, 7)} },
          { y: 'Día 22', a: ${statistics.getOfertasFecha(22, 7)},  b: ${statistics.getDemandasFecha(22, 7)} },
          { y: 'Día 23', a: ${statistics.getOfertasFecha(23, 7)},  b: ${statistics.getDemandasFecha(23, 7)} },
          { y: 'Día 24', a: ${statistics.getOfertasFecha(24, 7)},  b: ${statistics.getDemandasFecha(24, 7)} },
    	  { y: 'Día 25', a: ${statistics.getOfertasFecha(25, 7)}, b: ${statistics.getDemandasFecha(25, 7)} },
          { y: 'Día 26', a: ${statistics.getOfertasFecha(26, 7)},  b: ${statistics.getDemandasFecha(26, 7)} },
          { y: 'Día 27', a: ${statistics.getOfertasFecha(27, 7)},  b: ${statistics.getDemandasFecha(27, 7)} },
          { y: 'Día 28', a: ${statistics.getOfertasFecha(28, 7)},  b: ${statistics.getDemandasFecha(28, 7)} },
          { y: 'Día 29', a: ${statistics.getOfertasFecha(29, 7)},  b: ${statistics.getDemandasFecha(29, 7)} },
          { y: 'Día 30', a: ${statistics.getOfertasFecha(30, 7)},  b: ${statistics.getDemandasFecha(30, 7)} },
          { y: 'Día 31', a: ${statistics.getOfertasFecha(31, 7)},  b: ${statistics.getDemandasFecha(31, 7)} },
      ],
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Ofertas', 'Demandas']
    });
    
    
    document.getElementById("selectFecha").addEventListener('change', function() {
 		if ( document.getElementById('selectAño').selected == true ) {
		    document.getElementById('divMes').style.display='none';
		    document.getElementById('divAño').style.display='block';
		} else {
		    document.getElementById('divAño').style.display='none';
		    document.getElementById('divMes').style.display='block';
		} 
		
	}); 
		

});

</script>

    
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>

</html>