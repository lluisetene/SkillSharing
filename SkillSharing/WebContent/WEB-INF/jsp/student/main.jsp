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


<t:paginaBasica title="Página Personal"/>

        <%
        Student student = new Student();
        HttpSession sesion = request.getSession();
        student = (Student)sesion.getAttribute("studentLogin");
        
        String horas[] = student.getOfferHours().split(":");
        int horasOfertas = Integer.parseInt(horas[0]);
        
        horas = student.getDemandHours().split(":");
        int horasDemandas = Integer.parseInt(horas[0]);
        
        Offer oferta = new Offer();
        %>


    <div id="wrapper" class="in">
        <div id="page-wrapper" style="min-height: 488px;">
            
            <div class="panel-body">
            
             <!--------------------------------------------------------------------------------------->
                
                    <div class="panel-body" style="background-color:597eaa; border-radius:10px 10px 10px 10px;">
                    
	                	<div class="panel-body" style="width:20%;display:inline-block; background-color:white; margin-left:0.5%; height:60px; border-radius:15px 15px 15px 15px;">
	                		<i class="fa fa-thumbs-o-up fa-2x" style="color:black"></i>
	                		<b style="color:black"><FONT SIZE=4>Horas Ofertas: <%out.print(horasOfertas);%></FONT></b>
	                	</div>
                       
	                	<div class="panel-body" style="width:20%;display:inline-block; background-color:white; margin-left:19.5%; height:60px; border-radius:15px 15px 15px 15px;">
	                		<i class="fa fa-thumbs-o-down fa-2x" style="color:black"></i>
	                		<b style="color:black"><FONT SIZE=4>Horas Demandas: <%out.print(horasDemandas);%></FONT></b>
	                	</div>
                       
                       	<div class="panel-body" style="width:20%;display:inline-block; background-color:white; margin-left:19%; height:60px; border-radius:15px 15px 15px 15px;">
	                		<i class="fa fa-clock-o fa-2x" style="color:black"></i>
	                		<b style="color:black"><FONT SIZE=4>Saldo Disponible: <%out.print(horasOfertas - horasDemandas); %></FONT></b>
	                	</div>
                       
                    </div>
                    
                    
            <!--------------------------------------------------------------------------------------->
                
            <div style="padding:25px;"></div>

            <!--------------------------------------------------------------------------------------->
            
            
            <div class="row">
            
            <!-- PANEL IZQUIERDO -->
                <div class="col-lg-4">
                    <div class="panel-body" style="background-color:white; padding-top:1px; padding-left:1px">
                    
                    <!-- PANEL DATOS USUARIO -->
                        <div class="panel-body" style="background-color:597eaa; border-radius:10px 10px 10px 10px;">
                        	<div class="panel-body" style="background-color:597eaa">
                        		<i class="fa fa-user fa-4x" style="color:#fff; height:10%"></i>
	                        	<FONT SIZE=6 style="padding-left:50px; color:white"><%out.print(student.getName()); %></FONT>
	                        	<FONT SIZE=6 style=" color:white">DNI <%out.print(student.getNid()); %></FONT>
                        	</div>
			             </div>
			             
			             <div style="padding:5px;background-color:white"></div>
			             
			             
			        <!-- ESTADÍSTICAS COLABORACIONES -->
			             <div class="panel-body" style="background-color:597eaa; border-radius:10px 10px 10px 10px; padding-top:10px">
                        	<div class="panel-body" style="background-color:597eaa">
                        	<h2 style="text-align:center; color:ffffff">Colaboraciones</h2>
                        	
                        	<!--  ESTADÍSTICAS  -->
                        	<div class="panel-body" style="background-color:white; padding-left:1px;">
                        		<div id="grafica" style="height: 250px;"></div>
                        	
                        
                        	</div>
                        </div>
                   </div>
               
            <!--------------------------------------------------------------------------------------->
                
            	<div style="padding:5px;"></div>	

            <!--------------------------------------------------------------------------------------->
               
               
               <!-- VALORACION MEDIA -->
	               <div class="panel-body" style="background-color:597eaa; border-radius:10px 10px 10px 10px; padding-top:10px">
	               		<div class="panel-body" style="background-color:white; border-radius:10px 10px 10px 10px">
	               			<h2 style="color:597eaa">Valoración Media: X</h2>
	               			<div class="panel-body" style="background-color:red">
	               				aqui irán las estrellas tan chulas que no se como se ponen
	               			</div>
	               		</div>
	               </div>
            	</div>
         </div>
		<!-- FIN PANEL IZQUIERDO -->    
		<!----------------------------------------------------------------------------------------------->
		
		<!-- TABLAS -->
		
		<c:set var="nid" value="<%= student.getNid() %>"/>
		
        <div class="col-lg-8" style="background-color:597eaa; border-radius:10px 10px 10px 10px;">
                <div class="panel-body" style="background-color:597eaa">
                
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
								<c:forEach items="${offers}" var="offer">
									<c:choose>
		         						<c:when test="${offer.nid == nid}">
		          						 	<tr>
							          		<td>${offer.name}</td>
							                <td>${offer.getIdSkill().split("/")[1]}</td>
							           		<td>${offer.beginningDate}</td>
							           		<td>${offer.endingDate}</td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" onClick="location='${pageContext.request.contextPath}/offer/update/${offer.idOffer}.html'" type = "submit" name = "submit"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" onClick="location='${pageContext.request.contextPath}/offer/delete/${offer.idOffer}.html'" type = "submit" name = "submit"></button></td>
			           						</tr>
		           						</c:when>
	           						</c:choose>
	       
	       						</c:forEach> 
	
					     	</table>
					     </div>
                                 
                  	</div>
                  </div>
                  <!-- FIN TABLA OFERTAS -->            
                  
				<!---------------------------------------------------------------------------------------->
				
				<div class="col-lg-12" style="background-color:597eaa; padding-top:15px;"></div>          
				
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
							<c:forEach items="${demands}" var="demand">
	        					<c:choose>
	        						<c:when test="${demand.nid == nid}">
		         						<tr>
						          		<td>${demand.name}</td>
						                <td>${demand.getIdSkill().split("/")[1]}</td>
						           		<td>${demand.beginningDate}</td>
						           		<td>${demand.endingDate}</td>
						           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" onClick="location='${pageContext.request.contextPath}/demand/update/${demand.idDemand}.html'" type = "submit" name = "submit"></button></td>
					               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" onClick="location='${pageContext.request.contextPath}/demand/delete/${demand.idDemand}.html'" type = "submit" name = "submit"></button></td>
		          						</tr>
	      							</c:when>
	      						</c:choose>
	      					</c:forEach> 
	
							</table>
						</div>
                                 
                	 </div>
                	</div>   
                  <!-- FIN TABLA DEMANDAS -->   
				<!---------------------------------------------------------------------------------------->
				
				<div class="col-lg-12" style="background-color:597eaa; padding-top:15px;"></div>          
				
				<!---------------------------------------------------------------------------------------->
                              
                  <!-- TABLA COLABORACIONES -->        
                  <div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
                        <div class="table-responsive">
                        	 <div class="col-xs-6 text-left">
                            	<div class="huge">Mis Colaboraciones</div>
                        	</div>
                            <table style="border:2px solid black" class="table table-bordered table-hover table-striped" style="border-style:outset">
                            	
                            	<tr style = "color:black; background-color:cccccc;font-size:12px">
									
									<th>Nombre</th>
									<th>Habilidad</th>
									<th>Fecha Inicio</th>
									<th>Fecha Fin</th>
									<th></th>
									<th></th>
							
								</tr>	
								
								<c:forEach items="${collaborations}" var="collaboration">
		        					<c:choose>
		        						<c:when test="${demand.nid == nid}">
			         						<tr>
							          		<td>${demand.name}</td>
							                <td>${demand.getIdSkill().split("/")[1]}</td>
							           		<td>${demand.beginningDate}</td>
							           		<td>${demand.endingDate}</td>
							           		<td style = "width:10;text-align:center"><button class="btn fa fa-pencil" onClick="location='${pageContext.request.contextPath}/demand/update/${demand.idDemand}'" type = "submit" name = "submit"></button></td>
						               		<td style = "width:10;text-align:center"><button class="btn fa fa-times" onClick="location='${pageContext.request.contextPath}/student/main.html'"type = "submit" name = "submit"></button></td>
			          						</tr>
		      							</c:when>
		      						</c:choose>
		      					</c:forEach> 
                            	
				      
				     		</table>
                                 
                  	</div>
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
        { y: 'Enero', a: 15, b: 2 },
        { y: 'Febrero', a: 7,  b: 6 },
        { y: 'Marzo', a: 5,  b: 4 },
        { y: 'Abril', a: 7,  b: 6 },
        { y: 'Mayo', a: 15,  b: 4 },
        { y: 'Junio', a: 2,  b: 10 },
        { y: 'Julio', a: 3,  b: 3 },
        { y: 'Agosto', a: 2,  b: 1 },
        { y: 'Septiembre', a: 11,  b: 5 },
        { y: 'Octubre', a: 13,  b: 4 },
        { y: 'Noviembre', a: 12,  b: 3 },
        { y: 'Diciembre', a: 4, b: 8}
      ],
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Ofertas', 'Demandas']
    });
    </script>
    
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>