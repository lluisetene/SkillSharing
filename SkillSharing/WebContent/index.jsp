<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>  

<t:paginaBasica title="Skill Sharing">

	<jsp:body>
	
	    <div id="wrapper">
	    
	        <div id="page-wrapper">
	        
	        <!-- Primera fila -->
	        
	            <div class="row" style="background-image:url(imagenes/Comparte.png); width=100%; margin-left: -32px; margin-right:-30px">
	            
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
						<p style="margin-top:30px; margin-left:75px; margin-right:75px; font-size:16px"><b><i>
						
						Empieza creando nuevas ofertas y demandas para las habilidades disponibles actualmente en la web.
						Visita las secciones de Ofertas y Demandas para seleccionar la que más se adecúe a tus necesiades.
						Establece la nueva colaboración entre el oferente y el demandante para que podáis poneros en contacto.
						
						</i></b></p>
						
						<p style="margin-top:40px; margin-left:50px; margin-right:75px; font-size:16px;"><b><i>
						
						Si quieres acceder a sus contenidos  
						<input style="font-weight:bold; background-color:white; border: 2px solid; color:black; width:130px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/login.html'" name = "cancel" value = "Acceder">
						
						
						</i></b></p>
						
						
						
						
					</div>
	            </div>
	            <!-- /Segunda fila -->
	              </div>
	            
	    </div>
	    
	    </jsp:body>
	            
</t:paginaBasica>
	            
	    
	     <t:barrainferior>
	    </t:barrainferior>
