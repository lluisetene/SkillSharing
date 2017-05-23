<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>  

<%@ page import = "es.uji.ei1027.skillsharing.dao.OfferDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Offer" %> 
<%@ page import = "es.uji.ei1027.skillsharing.dao.DemandDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Demand" %> 
<%@ page import = "es.uji.ei1027.skillsharing.dao.SkillDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Skill" %> 
<%@ page import = "java.util.List"%> 


<t:paginaBasica title="Skill Sharing">

	<jsp:body>

	
	    <div id="wrapper">
	    
	        <div id="page-wrapper">
	        
	        <!-- Primera fila -->
	            <div class="row" style="background-image:url(imagenes/Comparte.png); margin-left: -50px; margin-right:-50px">
	                <div class="col-lg-12" align="center" style="top:100">
	                	
	  					<h1 style="color:#FFFFFF"><b>COMPARTE TUS HABILIDADES</b></h1>
	  					<p style="color:#FFFFFF; margin-left:150px; margin-right:150px">
							
						¡Bienvenido a SkillSharing! la web de intercambio de habilidades de tendencia en españa. En este
						porta web tendrás la posibilidad de ofrecer ayuda a otros estudiantes sobre cualquiera de las habilidades
						existentes, también podrás crear demandas que cubran tus necesidades para que otros estudiantes de la universidad
						puedan prestarte ayuda.	
						
						
						</p>
	  				
					</div>
	            </div>
	           <!-- /Primera fila -->
	           
	            
	            <!-- Segunda fila -->
	            <div class="row">
	                <div class="col-lg-6" align="center">
	  					<h1>¿Cuál es tu habilidad?</h1>
	  					<p><img src="imagenes/Imagen_Pagina_Principal.png" width="500" height="260"></p>
					</div>
					<div class="col-lg-6" align="center">
						<p style="margin-top:100px; margin-left:75px; margin-right:75px; font-size:16px"><b><i>
						Empieza creando nuevas ofertas y demandas para las habilidades disponibles actualmente en la web.
						Visita las secciones de Ofertas y Demandas para seleccionar la que más se adecúe a tus necesiades.
						Establece la nueva colaboración entre el oferente y el demandante para que podáis poneros en contacto.
						
						</i></b></p>
					</div>
	            </div>
	            <!-- /Segunda fila -->
	              </div>
	            
	    </div>
	    
	    </jsp:body>
	            
</t:paginaBasica>
	            
	            <!-- Tercera fila -->
	            <div class="panel panel-default" style="background-color:dddddd;margin-bottom: 0px;">
	                        <div class="panel-body">
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="table-responsive">
	                                    	<h3 align="center" style="color:#073763;"><b>Últimas Ofertas</b></h3>
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
										         	out.println("</tr>");
										         	out.println("</thead>");
										         	out.println("<tbody>");
										         	
										         	
													for (int i=0;i<listaOffers.size() && i < 5;i++){
														
															
														
														ofertasLlenadas += 1; 
														if (i % 2 == 0){
															
															out.println("<tr>"); 
												            out.println("<td>" + listaOffers.get(i).getName() + "</td>");
												            out.println("<td>" + skillDao.getSkill(listaOffers.get(i).getIdSkill()).getName() + "</td>");
												            out.println("<td>" + listaOffers.get(i).getBeginningDate() + "</td>"); 
												            out.println("<td>" + listaOffers.get(i).getEndingDate() + "</td>");
												            out.println("</tr>");
														
														}else{
															
															out.println("<tr style=background-color:597eaa>"); 
												            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getName() + "</FONT></td>");
												            out.println("<td><FONT COLOR=white>" + skillDao.getSkill(listaOffers.get(i).getIdSkill()).getName() + "</FONT></td>");
												            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getBeginningDate() + "</FONT></td>");
												            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getEndingDate() + "</FONT></td>");
															out.println("</tr>");
															
														}
														
														 
													}
													
													for(int i = ofertasLlenadas; i < 5; i++){
														
														if (i % 2 == 0){
													
															out.println("<tr>"); 
												            out.println("<td HEIGHT=35>" + "</td>");
												            out.println("<td>"+"</td>");
												            out.println("<td>"+"</td>"); 
												            out.println("<td>"+"</td>");
															out.println("</tr>");
														
														}else{
														
															out.println("<tr style=background-color:597eaa>"); 
												            out.println("<td HEIGHT=35>" + "</td>");
												            out.println("<td>"+"</td>");
												            out.println("<td>"+"</td>"); 
												            out.println("<td>"+"</td>");
															out.println("</tr>");
															
															
														}
													
													}

												%>
										       </tbody>
										     </table>
					                                    
					                     </div>
	                                </div>
	                                
	                                <div class="col-lg-6">
		                                <div class="table-responsive">
		                                	<h3 align="center" style="color:#073763;"><b>Últimas Demandas</b></h3>
		                               		<table style="border:2px solid black" class="table table-bordered table-hover table-striped" >

										    
										         <%
										         
										         	// ÚLTIMAS DEMANDAS
										         	DemandDAO demandDao = new DemandDAO();
										         	List<Demand> listaDemandas = demandDao.getDemands();
										         	int demandasLlenadas = 0;
										         	
										         	out.println("<thead>"); 
										         	out.println("<tr style = background-color:cccccc>");	
										         	out.println("<th>" + "Nombre" + "</th>");
										         	out.println("<th>" + "Habilidad" + "</th>");
										         	out.println("<th>" + "Fecha Inicio" + "</th>");
										         	out.println("<th>" + "Fecha Final" + "</th>");
										         	out.println("</tr>");
										         	out.println("</thead>");
										         	out.println("<tbody>");
										         	
										         	
													for (int i=0;i<listaDemandas.size() && i < 5;i++){
														
														demandasLlenadas += 1; 
														if (i % 2 == 0){
															
															out.println("<tr>"); 
												            out.println("<td>" + listaDemandas.get(i).getName() + "</td>");
												            out.println("<td>" + skillDao.getSkill(listaDemandas.get(i).getIdSkill()).getName() + "</td>");
												            out.println("<td>" + listaDemandas.get(i).getBeginningDate() + "</td>"); 
												            out.println("<td>" + listaDemandas.get(i).getEndingDate() + "</td>");
												            out.println("</tr>");
														
														}else{
															
															out.println("<tr style=background-color:597eaa>"); 
												            out.println("<td><FONT COLOR=white>" + listaDemandas.get(i).getName() + "</FONT></td>");
												            out.println("<td><FONT COLOR=white>" + skillDao.getSkill(listaDemandas.get(i).getIdSkill()).getName() + "</FONT></td>");
												            out.println("<td><FONT COLOR=white>" + listaDemandas.get(i).getBeginningDate() + "</FONT></td>");
												            out.println("<td><FONT COLOR=white>" + listaDemandas.get(i).getEndingDate() + "</FONT></td>");
															out.println("</tr>");
															
														}
														
														 
													}
													
													for(int i = demandasLlenadas; i < 5; i++){
														
														if (i % 2 == 0){
													
															out.println("<tr>"); 
												            out.println("<td HEIGHT=39>" + "</td>");
												            out.println("<td>"+"</td>");
												            out.println("<td>"+"</td>"); 
												            out.println("<td>"+"</td>");
															out.println("</tr>");
														
														}else{
														
															out.println("<tr style=background-color:597eaa>"); 
												            out.println("<td HEIGHT=39>" + "</td>");
												            out.println("<td>"+"</td>");
												            out.println("<td>"+"</td>"); 
												            out.println("<td>"+"</td>");
															out.println("</tr>");
															
															
														}
													
													}

												%>
										       </tbody>
										     </table>
		                               
		                                </div>
		                            </div>
	                                    
	                             </div>
	                           </div>
	              </div>
	              <!-- Tercera fila -->
	     <t:barrainferior>
	    </t:barrainferior>
