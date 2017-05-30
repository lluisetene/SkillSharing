<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Student" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Demand" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Offer" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Collaboration" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.DemandDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.OfferDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.CollaborationDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.SkillDAO" %>
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
        <div class="col-lg-8" style="background-color:597eaa; border-radius:10px 10px 10px 10px;">
                <div class="panel-body" style="background-color:597eaa">
                
                <!-- TABLA OFERTAS -->
                    <div class="col-lg-12" style="background-color:ffffff; border-radius:10px 10px 10px 10px;">
                        <div class="table-responsive">
                        	 <div class="col-xs-4 text-left">
                            	<div class="huge">Ofertas Creadas</div>
                        	</div>
                        	<div class="col-xs-8 text-right">
                           	 	<div class="huge">Crear Oferta
                           	 	 	<button type="button" class="btn btn-info btn-circle btn-lg" onClick="location='${pageContext.request.contextPath}/offer/add.html'"><i class="fa fa-check"></i></button>
                           	 	</div>
                        	</div>
                            <table style="border:2px solid black" class="table table-bordered table-hover table-striped" style="border-style:outset">
 
				         <%
				         	//HABILIDADES
				         	SkillDAO skillDao = new SkillDAO();
				      
				         	// ÚLTIMAS OFERTAS
				         	OfferDAO offerDao = new OfferDAO();
				         	List<Offer> listaOffers = offerDao.getOffers();
				         	int ofertasLlenadas = 0;
				         	
				         	out.println("<thead>"); 
				         	out.println("<tr style = background-color:cccccc>");	
				         	out.println("<th>" + "Nombre" + "</th>");
				         	out.println("<th>" + "Habilidad" + "</th>");
				         	out.println("<th>" + "Fecha Inicio" + "</th>");
				         	out.println("<th>" + "Fecha Final" + "</th>");
				         	out.println("<th></th>");
				         	out.println("<th></th>");
				         	out.println("</tr>");
				         	out.println("</thead>");
				         	out.println("<tbody>");
				         	
				         	int contador = 0;
							for (int i=0;i<listaOffers.size();i++){
								
								if ( listaOffers.get(i).getNid().equals(student.getNid()) )
									
									if (i % 2 == 0){
										
										contador++;
										
										out.println("<tr>"); 
							            out.println("<td>" + listaOffers.get(i).getName() + "</td>");
							            out.println("<td>" + skillDao.getSkill(listaOffers.get(i).getIdSkill()).getName() + "</td>");
							            out.println("<td>" + listaOffers.get(i).getBeginningDate() + "</td>"); 
							            out.println("<td>" + listaOffers.get(i).getEndingDate() + "</td>");
							            out.println("<td><a href='update/${student.nid}.html'>Modificar</a></td>");
							            out.println("<td><a href='delete/${student.nid}.html'>Eliminar</a>");
							            out.println("</tr>");
									
									}else{
										
										out.println("<tr style=background-color:597eaa>"); 
							            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getName() + "</FONT></td>");
							            out.println("<td><FONT COLOR=white>" + skillDao.getSkill(listaOffers.get(i).getIdSkill()).getName() + "</FONT></td>");
							            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getBeginningDate() + "</FONT></td>");
							            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getEndingDate() + "</FONT></td>");
							            out.println("<td><a style='color:white' href='update/${student.nid}.html'>Modificar</a></td>");
							            out.println("<td><a style='color:white' href='delete/${student.nid}.html'>Eliminar</a>");
										out.println("</tr>");
										
									}
								
									
								}
							
								if ( contador == 0 ) {
									
									out.println("<tr style=background-color:597eaa>"); 
						            out.println("<td></td>");
						            out.println("<td></td>");
						            out.println("<td></td>");
						            out.println("<td></td>");
						            out.println("<td></td>");
						            out.println("<td></td>");
									out.println("</tr>");
									
									 
								
							}
							
							

						%>
				       </tbody>
				     </table>
                                 
                  	</div>
                  </div>
                  <!-- FIN TABLA OFERTAS -->            
                  
				<!---------------------------------------------------------------------------------------->
				
				<div class="col-lg-12" style="background-color:597eaa; padding-top:15px;"></div>          
				
				<!---------------------------------------------------------------------------------------->
				                                         
                  <!-- TABLA DEMANDAS -->            
                  <div class="col-lg-12" style="background-color:ffffff; border-radius:10px 10px 10px 10px;">
                    <div class="table-responsive">
                    	<div class="col-xs-5 text-left">
                        	<div class="huge">Demandas Creadas</div>
                    	</div>
                    	<div class="col-xs-7 text-right">
                       	 	<div class="huge">Crear Demanda
                       	 	<button type="button" class="btn btn-info btn-circle btn-lg"><i class="fa fa-check"></i></button>
                       	 	</div>
                    	</div>
                    	
                        <table style="border:2px solid black" class="table table-bordered table-hover table-striped" style="border-style:outset">

    						<%
       
				         	// ÚLTIMAS DEMANDAS
				         	DemandDAO demandDao = new DemandDAO();
				         	List<Demand> listaDemandas = demandDao.getDemands();
				         	
				         	out.println("<thead>"); 
				         	out.println("<tr style = background-color:cccccc>");	
				         	out.println("<th>" + "Nombre" + "</th>");
				         	out.println("<th>" + "Habilidad" + "</th>");
				         	out.println("<th>" + "Fecha Inicio" + "</th>");
				         	out.println("<th>" + "Fecha Final" + "</th>");
				         	out.println("<th></th>");
				         	out.println("<th></th>");
				         	out.println("</tr>");
				         	out.println("</thead>");
				         	out.println("<tbody>");
				         	
				         	contador = 0;
							for (int i=0;i<listaDemandas.size();i++){
								
								if ( listaDemandas.get(i).getNid().equals(student.getNid()) )
									
									if (i % 2 == 0){
										
										contador++;
										
										out.println("<tr>"); 
							            out.println("<td>" + listaDemandas.get(i).getName() + "</td>");
							            out.println("<td>" + skillDao.getSkill(listaDemandas.get(i).getIdSkill()).getName() + "</td>");
							            out.println("<td>" + listaDemandas.get(i).getBeginningDate() + "</td>"); 
							            out.println("<td>" + listaDemandas.get(i).getEndingDate() + "</td>");
							            out.println("<td><a href='update/${student.nid}.html'>Modificar</a></td>");
							            out.println("<td><a href='delete/${student.nid}.html'>Eliminar</a>");
							            out.println("</tr>");
									
									}else{
										
										out.println("<tr style=background-color:597eaa>"); 
							            out.println("<td><FONT COLOR=white>" + listaDemandas.get(i).getName() + "</FONT></td>");
							            out.println("<td><FONT COLOR=white>" + skillDao.getSkill(listaDemandas.get(i).getIdSkill()).getName() + "</FONT></td>");
							            out.println("<td><FONT COLOR=white>" + listaDemandas.get(i).getBeginningDate() + "</FONT></td>");
							            out.println("<td><FONT COLOR=white>" + listaDemandas.get(i).getEndingDate() + "</FONT></td>");
							            out.println("<td><a style='color:white' href='update/${student.nid}.html'>Modificar</a></td>");
							            out.println("<td><a style='color:white' href='delete/${student.nid}.html'>Eliminar</a>");
										out.println("</tr>");
										
									}
									
								
								 
							}
							
							if ( contador == 0 ) {
								
								out.println("<tr style=background-color:597eaa>"); 
					            out.println("<td></td>");
					            out.println("<td></td>");
					            out.println("<td></td>");
					            out.println("<td></td>");
					            out.println("<td></td>");
					            out.println("<td></td>");
								out.println("</tr>");
								
							}
							

						%>
				       </tbody>
				     </table>
                                 
                	 </div>
                	</div>   
                  <!-- FIN TABLA DEMANDAS -->   
				<!---------------------------------------------------------------------------------------->
				
				<div class="col-lg-12" style="background-color:597eaa; padding-top:15px;"></div>          
				
				<!---------------------------------------------------------------------------------------->
                              
                  <!-- TABLA COLABORACIONES -->        
                  <div class="col-lg-12" style="background-color:ffffff; border-radius:10px 10px 10px 10px;">
                        <div class="table-responsive">
                        	 <div class="col-xs-6 text-left">
                            	<div class="huge">Colaboraciones Creadas</div>
                        	</div>
                            <table style="border:2px solid black" class="table table-bordered table-hover table-striped" style="border-style:outset">
                            
                            <%
                            
                            CollaborationDAO collaborationDao = new CollaborationDAO();
                            /* List<Collaboration> listaColaboraciones = collaborationDao.getCollaborations(); */
                            
 							out.println("<thead>"); 
				         	out.println("<tr style = background-color:cccccc>");	
				         	out.println("<th>" + "Nombre" + "</th>");
				         	out.println("<th>" + "Habilidad" + "</th>");
				         	out.println("<th>" + "Fecha Inicio" + "</th>");
				         	out.println("<th>" + "Fecha Final" + "</th>");
				         	out.println("<th>" + "Estado" + "</th>");
				         	out.println("<th></th>");
				         	out.println("</tr>");
				         	out.println("</thead>");
				         	out.println("<tbody>");
				         	
				         	
							out.println("<tr style=background-color:597eaa>"); 
				            out.println("<td></td>");
				            out.println("<td></td>");
				            out.println("<td></td>");
				            out.println("<td></td>");
				            out.println("<td><i class='fa fa-lock fa-2x' style='color:ffffff;'></i></td>");
				            out.println("<td></td>");
							out.println("</tr>");				         	
							
				         	
				         	 %>
				      
				       </tbody>
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