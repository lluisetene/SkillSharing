<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Student" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Demand" %>
<%@ page import = "es.uji.ei1027.skillsharing.model.Offer" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.DemandDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.OfferDAO" %>
<%@ page import = "es.uji.ei1027.skillsharing.dao.SkillDAO" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "java.util.List"%> 


<t:paginaBasica title="Página Personal"/>



    <div id="wrapper" class="in">

        <%
        Student student = new Student();
        HttpSession sesion = request.getSession();
        student = (Student)sesion.getAttribute("studentLogin");
        %>

        <div id="page-wrapper" style="min-height: 488px;">
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary"> <!-- quitar color: borrar panel-* (en los 3 casos) -->
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-check-circle-o fa-5x"> </i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26H</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-times-circle-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12H</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-clock-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13H</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            
            
            
            <div class="row">
	            <!-- PANEL IZQUIERDO -->
                <div class="col-lg-4">
                    <div class="panel" style="background-color:597eaa">
                        <div class="panel-body">
                        	<div class="panel col-md-4" style="background-color:597eaa">
                        		<i class="fa fa-user fa-4x" style="color:#fff"></i>
                        	</div>
                        	<div class="panel col-md-8" style="background-color:597eaa">
	                        	<h2 style="color:ffffff">
	                        	<%out.print(student.getName()); %>
	                        	<br>
	                        	<br>
	                        	DNI <%out.print(student.getNid()); %>
	                        	</h2>
                        	</div>
                        	
			             </div>
			             <div class="panel panel-default">
                        	<div class="panel-body">
                        	<svg height="357" version="1.1" width="600" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; left: -0.766663px; top: -0.75px;">
                        		<defs></defs>
                        		<text style="text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="36.5" y="300" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal"><tspan dy="0">0</tspan></text>
                        		<path style="" fill="none" stroke="#aaaaaa" d="M49,300H644.5499877929688" stroke-width="0.5"></path>
                        		<text style="text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="36.5" y="250" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal"><tspan dy="4">4</tspan></text>
                        		<path style="" fill="none" stroke="#aaaaaa" d="M49,250.5H644.5499877929688" stroke-width="0.5"></path>
                        		<text style="text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="36.5" y="200" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal"><tspan dy="8">8</tspan></text>
                        		<path style="" fill="none" stroke="#aaaaaa" d="M49,200H644.5499877929688" stroke-width="0.5"></path>
                        		<text style="text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="36.5" y="150" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal"><tspan dy="12">12</tspan></text>
                        		<path style="" fill="none" stroke="#aaaaaa" d="M49,150.5H644.5499877929688" stroke-width="0.5"></path>
                        		<text style="text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="36.5" y="100" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal"><tspan dy="16">16</tspan></text>
                        		<path style="" fill="none" stroke="#aaaaaa" d="M49,100H644.5499877929688" stroke-width="0.5"></path>
                        		<text style="text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="36.5" y="50"  text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal"><tspan dy="20">20</tspan></text>
                        		<path style="" fill="none" stroke="#aaaaaa" d="M49,50	H644.5499877929688" stroke-width="0.5"></path>
                        		<text style="text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="602.0107029506138" y="335.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4">2012</tspan></text>
                        		<text style="text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="516.932133265904" y="335.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4">2011</tspan></text>
                        		<text style="text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="431.8535635811942" y="335.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4">2010</tspan></text>
                        		<text style="text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="346.7749938964844" y="335.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4">2009</tspan></text>
                        		<text style="text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="261.69642421177457" y="335.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4">2008</tspan></text>
                        		<text style="text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="176.61785452706474" y="335.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4">2007</tspan></text>
                        		<text style="text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" x="91.5392848423549" y="335.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="4">2006</tspan></text>
                        		<rect x="59.634821210588726" y="25" width="30.404463631766184" height="298" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect><rect x="93.0392848423549" y="54.80000000000001" width="30.404463631766184" height="268.2" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect>
                        		<rect x="144.71339089529852" y="99.5" width="30.404463631766184" height="223.5" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect><rect x="178.1178545270647" y="129.3" width="30.404463631766184" height="193.7" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect>
                        		<rect x="229.79196058000838" y="174" width="30.404463631766184" height="149" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect><rect x="263.19642421177457" y="203.8" width="30.404463631766184" height="119.19999999999999" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect>
                        		<rect x="314.8705302647182" y="99.5" width="30.404463631766184" height="223.5" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect><rect x="348.2749938964844" y="129.3" width="30.404463631766184" height="193.7" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect>
                        		<rect x="399.949099949428" y="174" width="30.404463631766184" height="149" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect><rect x="433.3535635811942" y="203.8" width="30.404463631766184" height="119.19999999999999" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect>
                        		<rect x="485.0276696341378" y="99.5" width="30.404463631766184" height="223.5" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect><rect x="518.432133265904" y="129.3" width="30.404463631766184" height="193.7" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect>
                        		<rect x="570.1062393188477" y="25" width="30.404463631766184" height="298" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect><rect x="603.5107029506138" y="54.80000000000001" width="30.404463631766184" height="268.2" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"></rect>
                        		</svg>
                        		<div class="morris-hover morris-default-style" style="left: 135.118px; top: 135px; display: none;"><div class="morris-hover-row-label">2007</div><div class="morris-hover-point" style="color: #0b62a4">
  Series A:
  75
</div><div class="morris-hover-point" style="color: #7a92a3">
  Series B:
  65
</div></div>
                        	</div>
                        </div>
                   </div>
               </div>
           		<!--  -->
           		
             	<div>
                </div>
                
                
                
                <!-- /.col-lg-8 -->
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                	<h3 align="left" style="color:#073763;"><b>Ofertas Creadas</b></h3>
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
							         	
							         	
										for (int i=0;i<listaOffers.size() && i < 5;i++){
											
												
											
											ofertasLlenadas += 1; 
											if (i % 2 == 0){
												
												out.println("<tr>"); 
									            out.println("<td>" + listaOffers.get(i).getName() + "</td>");
									            out.println("<td>" + skillDao.getSkill(listaOffers.get(i).getIdSkill().split("/")[0]).getName() + "</td>");
									            out.println("<td>" + listaOffers.get(i).getBeginningDate() + "</td>"); 
									            out.println("<td>" + listaOffers.get(i).getEndingDate() + "</td>");
									            out.println("<td><a href='update/${student.nid}.html'>Modificar</a></td>");
									            out.println("<td><a href='delete/${student.nid}.html'>Eliminar</a>");
									            out.println("</tr>");
											
											}else{
												
												out.println("<tr style=background-color:597eaa>"); 
									            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getName() + "</FONT></td>");
									            out.println("<td><FONT COLOR=white>" + skillDao.getSkill(listaOffers.get(i).getIdSkill().split("/")[0]).getName() + "</FONT></td>");
									            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getBeginningDate() + "</FONT></td>");
									            out.println("<td><FONT COLOR=white>" + listaOffers.get(i).getEndingDate() + "</FONT></td>");
									            out.println("<td><a style='color:white' href='update/${student.nid}.html'>Modificar</a></td>");
									            out.println("<td><a style='color:white' href='delete/${student.nid}.html'>Eliminar</a>");
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
	                                
	                                
	                                
	                                
	                             <div class="col-lg-12">
                                <div class="table-responsive">
                                	<h3 align="left" style="color:#073763;"><b>Demandas Creadas</b></h3>
                                    <table style="border:2px solid black" class="table table-bordered table-hover table-striped" style="border-style:outset">

					    
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
										         	out.println("<th></th>");
										         	out.println("<th></th>");
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
                <!-- /.col-lg-4 -->
            <!-- /.row -->
        </div>
	</div>
    </div>
