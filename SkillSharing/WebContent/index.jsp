<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>  

<t:paginaBasica title="Skill Sharing">
		
	<jsp:body>
	
	    <div id="wrapper">
	    
	        <div id="page-wrapper">
	        
	        <!-- Primera fila -->
	            <div class="row" style="background-color:#073763">
	                <div class="col-lg-12" align="center" >
	  					<h1 style="color:#FFFFFF">COMPARTE TUS HABILIDADES</h1>
	  					<p style="color:#FFFFFF">Aquí irá el texto que queramos poner</p>
	  				
					</div>
	            </div>
	           <!-- /Primera fila -->
	           
	            
	            <!-- Segunda fila -->
	            <div class="row">
	                <div class="col-lg-6" align="center">
	  					<h1>¿Cuál es tu habilidad?</h1>
	  					<p><img src="imagenes/Imagen_Pagina_Principal.png" width="800" height="260"></p>
					</div>
					<div class="col-lg-6" align="center">
						<p>TEXTO</p>
					</div>
	            </div>
	            <!-- /Segunda fila -->
	            
	            
	            <!-- Tercera fila -->
	            <div class="panel panel-default" style="background-color:B5B9C9">
	                        <div class="panel-body">
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="table-responsive">
	                                    	<h3 align="center">Últimas Ofertas</h3>
	                                        <t:tablapaginaprincipal />
	                                    </div>
	                                </div>
	                                
	                                <div class="col-lg-6">
		                                <div class="table-responsive">
		                                	<h3 align="center">Últimas Demandas</h3>
		                                    <t:tablapaginaprincipal/>
		                                </div>
		                            </div>
	                                    
	                             </div>
	                           </div>
	              </div>
	              <!-- Tercera fila -->
	       </div>
	            
	    </div>
	    
	    </jsp:body>
	    
</t:paginaBasica>