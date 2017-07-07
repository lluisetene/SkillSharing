<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<c:set var="studentLogin" scope="request" value='${session.getAttribute("studentLogin")}'/>


<t:paginaBasica title="Página Personal"/>

	<c:set var="nid" value='${studentLogin.getNid()}'/>

    <div id="wrapper" class="in">
        <div id="page-wrapper" style="min-height: 488px;">
            
            <div class="panel-body">
            
			<t:paginaBasicaStudent/>
            

		<!-- TABLAS -->
		
        <div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
                <div class="panel-body" style="background-color:073763">
                
                <!-- TABLA OFERTAS -->
                    <div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
                        <div class="table-responsive">
                        	 <div class="col-xs-4 text-left">
                            	<div class="huge">Mis Ofertas</div>
                        	</div>
                        	<div class="col-xs-8 text-right">
                           	 	<div class="huge">Añadir
                           	 	 	<button style = "border:none" type="button" onClick="location='${pageContext.request.contextPath}/offer/add.html'"><span style = "color: black; background-color:eeeeee" class="fa fa-plus-circle"></span></button>
                           	 	</div>
                        	</div>
                        	
                        	<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black; margin-bottom:15px;">
	                            <table style="overflow-y:scroll;" class="table table-bordered table-hover table-striped" style="border-style:outset">
	 
						         	<tr style = "color:black; background-color:cccccc;font-size:12px">
											
										<th>Nombre</th>
										<th>Habilidad</th>
										<th>Fecha Inicio</th>
										<th>Fecha Fin</th>
										<th></th>
										<th></th>
									
									</tr>
										
									<c:forEach items="${statistics.getOfertasEstudiante(nid)}" var="offer">
	          						 	<tr>
						          		<td>${offer.name}</td>
						                <td>${skills.getSkill(offer.getIdSkill()).getName()}</td>
						           		<td>${offer.beginningDate}</td>
						           		<td>${offer.endingDate}</td>
						           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" onClick="location='${pageContext.request.contextPath}/offer/update/${offer.idOffer}.html'" type = "submit" name = "submit"></button></td>
					               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" onClick="location='${pageContext.request.contextPath}/offer/delete/${offer.idOffer}.html'" type = "submit" name = "submit"></button></td>
		           						</tr>
		       
		       						</c:forEach> 
	
					     	</table>
					     	
					     </div>
                                 
                  	</div>
                  	<div class="col-xs-4"></div>
                  </div>
                  <!-- FIN TABLA OFERTAS -->            
                  
				<!---------------------------------------------------------------------------------------->
				
				<div class="col-lg-12" style="background-color:073763; padding-top:15px;"></div>          
				
				<!---------------------------------------------------------------------------------------->
				                                         
                  <!-- TABLA DEMANDAS -->            
                  <div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
                    <div class="table-responsive">
                    	<div class="col-xs-5 text-left">
                        	<div class="huge">Mis Demandas</div>
                    	</div>
                    	<div class="col-xs-7 text-right">
                       	 	<div class="huge">Añadir
                       	 		<button style = "border:none" type="button" onClick="location='${pageContext.request.contextPath}/demand/add.html'"><span style = "color: black; background-color:eeeeee" class="fa fa-plus-circle"></span></button>
                       	 	</div>
                    	</div>
                    	
                    	<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black; margin-bottom:15px">
	                       <table style="overflow-y:scroll;" class="table table-bordered table-hover table-striped" style="border-style:outset">
	
		   						<tr style = "color:black; background-color:cccccc;font-size:12px">
		   						
									<th>Nombre</th>
									<th>Habilidad</th>
									<th>Fecha Inicio</th>
									<th>Fecha Fin</th>
									<th></th>
									<th></th>
								
								</tr>	
								<c:forEach items="${statistics.getDemandasEstudiante(nid)}" var="demand">
								
	         						<tr>
					          		<td>${demand.name}</td>
					                <td>${skills.getSkill(demand.getIdSkill()).getName()}</td>
					           		<td>${demand.beginningDate}</td>
					           		<td>${demand.endingDate}</td>
					           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" onClick="location='${pageContext.request.contextPath}/demand/update/${demand.idDemand}.html'" type = "submit" name = "submit"></button></td>
				               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" onClick="location='${pageContext.request.contextPath}/demand/delete/${demand.idDemand}.html'" type = "submit" name = "submit"></button></td>
	          						</tr>
	          						
		      					</c:forEach> 
	
							</table>
							
						</div>
                                 
                	 </div>
                	 <div class="col-xs-4"></div>
                	</div>   
                  <!-- FIN TABLA DEMANDAS -->   
				<!---------------------------------------------------------------------------------------->
				
				<div class="col-lg-12" style="background-color:073763; padding-top:15px;"></div>          
				
				<!---------------------------------------------------------------------------------------->
                              
                  <!-- TABLA COLABORACIONES -->        
                  <div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
                        <div class="table-responsive">
                        	 <div class="col-xs-7 text-left">
                            	<div class="huge">Mis Colaboraciones</div>
                        	</div>
   	                    	<div class="col-xs-5 text-right">
                       	 		
                       	 		</div>
                    		</div>
                    		<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black; margin-bottom:15px">
	                            <table style="overflow-y:scroll;" class="table table-bordered table-hover table-striped" style="border-style:outset">
	                            	
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
							           				<td style = "width:10;text-align:center"><button class="btn fa fa-check-square" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/valoration/${collaboration.idCollaboration}.html'"></button></td>	
							           				<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/update/${collaboration.idCollaboration}.html'"></button></td>
							           				<td style = "width:10;text-align:center"><button class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/delete/${collaboration.idCollaboration}.html'"></button></td>
							           			
							           			</c:when>
							           			<c:otherwise>
							           			
							           				
							           				<td style = " width:1%;text-align:center"><i class="fa fa-lock" style = "font-size:25px" ></i></td>
							           				<td style = "width:10;text-align:center"><button disabled class="btn fa fa-check-square" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/valoration/${collaboration.idCollaboration}.html'"></button></td>	
							           				<td style = "width:10;text-align:center"><button disabled class="btn fa fa-pencil" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/update/${collaboration.idCollaboration}.html'"></button></td>
							           				<td style = "width:10;text-align:center"><button disabled class="btn fa fa-times" type = "submit" onclick = "location='http:${pageContext.request.contextPath}/collaboration/delete/${collaboration.idCollaboration}.html'"></button></td>
							           			
							           			</c:otherwise>
							           		
							           		</c:choose>
							           		
						               		
							           		
							           			
							           	
	            						</tr>
		          						
			      					</c:forEach> 
	                            	
					      
					     		</table>
					     	</div>
					                                 		
                  	</div>
                  	<div class="col-xs-4"></div>
                  </div>
                  <!-- FIN TABLA COLABORACIONES -->
                   
           		</div>                   
                              
               </div>         
                              
            </div>
       </div>

<t:barrainferior/>