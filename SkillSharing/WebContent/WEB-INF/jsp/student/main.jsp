<%@page import="es.uji.ei1027.skillsharing.model.Statistics"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "es.uji.ei1027.skillsharing.model.Student" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Demand" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Offer" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Collaboration" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "java.util.List"%> 

<html>
<t:paginaBasica title="Página Personal"/>

        <%
        Student student = new Student();
        HttpSession sesion = request.getSession();
        student = (Student)sesion.getAttribute("studentLogin");
        %>


	<c:set var="nid" value="<%= student.getNid() %>"/>

    <div id="wrapper" class="in">
        <div id="page-wrapper" style="min-height: 488px;">
            
            <div class="panel-body">
            
             <!--------------------------------------------------------------------------------------->
                
                    <div class="panel-body" style="background-color:073763; border-radius:10px 10px 10px 10px;">
                    
	                	<div class="panel-body" style="width:20%;display:inline-block; background-color:eeeeee; margin-left:0.5%; height:60px; border-radius:10px 10px 10px 10px;">
	                		<i class="fa fa-thumbs-o-up fa-2x" style="color:black"></i>
	                		<b style="color:black"><FONT SIZE=4>Horas Ofertas: <%out.print(student.getOfferHours());%></FONT></b>
	                	</div>
                       
	                	<div class="panel-body" style="width:22%;display:inline-block; background-color:eeeeee; margin-left:18.5%; height:60px; border-radius:10px 10px 10px 10px;">
	                		<i class="fa fa-thumbs-o-down fa-2x" style="color:black"></i>
	                		<b style="color:black"><FONT SIZE=4>Horas Demandas: <%out.print(student.getDemandHours());%></FONT></b>
	                	</div>
                       
                       	<div class="panel-body" style="width:22%;display:inline-block; background-color:eeeeee; margin-left:16%; height:60px; border-radius:10px 10px 10px 10px;">
	                		<i class="fa fa-clock-o fa-2x" style="color:black"></i>
	                		<b style="color:black"><FONT SIZE=4>Saldo Disponible: <%out.print(student.getHorasRestantes()); %></FONT></b>
	                	</div>
                       
                    </div>
                    
                    
            <!--------------------------------------------------------------------------------------->
                
            <div style="padding:25px;"></div>

            <!--------------------------------------------------------------------------------------->
            
            
            <div class="row">
            
            <!-- PANEL IZQUIERDO -->
                <div class="col-lg-4">
                    <div class="panel-body" style="margin-bottom:5%;padding:3%;background-color:white; border:2px solid black;">
                    
                    <!-- PANEL DATOS USUARIO -->
                        <div class="panel-body" style="background-color:073763; height:200px;">
                        	<div class="panel-body" style="background-color:073763">
                        		<i class="fa fa-user fa-4x" style="color:#fff; height:10%">
                        		</i>
                        			<ul style="list-style:none;">
		                        		<li><FONT SIZE=4 style="padding-left:90px; color:eeeeee"><%out.print(student.getName()); %></FONT></li>
		                        		<li><FONT SIZE=4 style="padding-left:90px; color:eeeeee"><%out.print(student.getNid()); %></FONT></li>
		                        	</ul>
                        	</div>
			             </div>
			             
			             <div style="padding:5px;background-color:white"></div>
			             
			             
			        <!-- ESTADÍSTICAS COLABORACIONES -->
			             <div class="panel-body" style="background-color:073763; padding-top:10px">
                        	<div class="panel-body" style="background-color:073763">
                        	<h2 style="text-align:center; color:ffffff">Colaboraciones</h2>
                        	
                        	<!--  ESTADÍSTICAS  -->
                        	<div class="panel-body" style="background-color:eeeeee; padding-left:1px; border-radius: 10px 10px 10px 10px">
                        		<div id="grafica" style="height: 250px;"></div>
                        	</div>
                        </div>
                   </div>
               
            <!--------------------------------------------------------------------------------------->
                
            	<div style="padding:5px;"></div>	

            <!--------------------------------------------------------------------------------------->
               
               
               <!-- VALORACION MEDIA -->
	               <div class="panel-body" style="background-color:073763; padding-top:10px">
	               		<div class="panel-body" style="background-color:eeeeee; border-radius: 10px 10px 10px 10px;">
           					<div style="text-align: center">
							  <FONT SIZE=5>Valoración Media: ${statistics.getValoracionMedia(nid)}</FONT><span class="valoracion val-${statistics.getValoracionMedia(nid)*5}" style="margin-left:110px"></span>
               				</div>
	               		</div>
	               </div>
            	</div>
         </div>
		<!-- FIN PANEL IZQUIERDO -->    
		<!----------------------------------------------------------------------------------------------->
		
		<!-- TABLAS -->
		
        <div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px;">
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
                        	
                        	<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
	                            <table style="border:2px solid black" class="table table-bordered table-hover table-striped" style="border-style:outset">
	 
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
						                <td>${offer.getIdSkill().split("/")[1]}</td>
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
                    	
                    	<div style = "overflow-y:scroll;height:280;margin-top:10px;border:2px solid black">
	                       <table style="border:2px solid black; overflow-y:scroll;" class="table table-bordered table-hover table-striped" style="border-style:outset">
	
	
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
					                <td>${demand.getIdSkill().split("/")[1]}</td>
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
                        	 <div class="col-xs-6 text-left">
                            	<div class="huge">Mis Colaboraciones</div>
                        	</div>
   	                    	<div class="col-xs-6 text-right">
                       	 		<div class="huge">Añadir
                       	 			<button style = "border:none" type="button" onClick="location='${pageContext.request.contextPath}/collaboration/add.html'"><span style = "color: black; background-color:eeeeee" class="fa fa-plus-circle"></span></button>
                       	 		</div>
                    		</div>
                    		
                            <table style="border:2px solid black" class="table table-bordered table-hover table-striped" style="border-style:outset">
                            	
                            	<tr style = "color:black; background-color:cccccc;font-size:12px">
									
									<th>IdColaboracion</th>
									<th>IdOferta</th>
									<th>IdDemanda</th>
									<th>Fecha Inicio</th>
									<th>Fecha Fin</th>
									<th>Horas</th>
									<th>Valoración</th>
									<th>Estado</th>
									<th></th>
									<th></th>
							
								</tr>	
								
								<c:forEach items="${statistics.getColaboracionesEstudiante(nid)}" var="collaboration">
								
	         						<tr>
					          		<td>${collaboration.idCollaboration}</td>
					                <td>${collaboration.idOffer}</td>
					           		<td>${collaboration.idDemand}</td>
					           		<td>${collaboration.beginningDate}</td>
					           		<td>${collaboration.endingDate}</td>
					           		<td>${collaboration.hours}</td>
					           		<td>${collaboration.rate}</td>
					           		<td></td>
					           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" onClick="location='${pageContext.request.contextPath}/demand/update/${demand.idDemand}.html'" type = "submit" name = "submit"></button></td>
				               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" onClick="location='${pageContext.request.contextPath}/demand/delete/${demand.idDemand}.html'" type = "submit" name = "submit"></button></td>
				               		
	          						</tr>
	          						
		      					</c:forEach> 
                            	
				      
				     		</table>
					                                 		
                  	</div>
                  	<div class="col-xs-4"></div>
                  </div>
                  <!-- FIN TABLA COLABORACIONES -->
                   
                   
           </div>                   
                              
                     </div>         
                              
                           </div>
             </div>
       </div>
</div>
    
    <script>
    
    
    Morris.Bar({
      element: 'grafica',
      data: [
    	  { y: 'Enero', a: ${statistics.getOfertasMes(1, nid)}, b: ${statistics.getDemandasMes(1, nid)} },
          { y: 'Febrero', a: ${statistics.getOfertasMes(2, nid)},  b: ${statistics.getDemandasMes(2, nid)} },
          { y: 'Marzo', a: ${statistics.getOfertasMes(3, nid)},  b: ${statistics.getDemandasMes(3, nid)} },
          { y: 'Abril', a: ${statistics.getOfertasMes(4, nid)},  b: ${statistics.getDemandasMes(4, nid)} },
          { y: 'Mayo', a: ${statistics.getOfertasMes(5, nid)},  b: ${statistics.getDemandasMes(5, nid)} },
          { y: 'Junio', a: ${statistics.getOfertasMes(6, nid)},  b: ${statistics.getDemandasMes(6, nid)} },
          { y: 'Julio', a: ${statistics.getOfertasMes(7, nid)},  b: ${statistics.getDemandasMes(7, nid)} },
          { y: 'Agosto', a: ${statistics.getOfertasMes(8, nid)},  b: ${statistics.getDemandasMes(8, nid)} },
          { y: 'Septiembre', a: ${statistics.getOfertasMes(9, nid)},  b: ${statistics.getDemandasMes(9, nid)} },
          { y: 'Octubre', a: ${statistics.getOfertasMes(10, nid)},  b: ${statistics.getDemandasMes(10, nid)} },
          { y: 'Noviembre', a: ${statistics.getOfertasMes(11, nid)},  b: ${statistics.getDemandasMes(11, nid)} },
          { y: 'Diciembre', a: ${statistics.getOfertasMes(12, nid)}, b: ${statistics.getDemandasMes(12, nid)} }
      ],
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Ofertas', 'Demandas']
    });
    </script>
    
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>