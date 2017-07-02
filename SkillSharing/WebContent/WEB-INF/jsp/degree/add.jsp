<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<t:paginaBasica/>
<c:set var="studentLogin" scope="request" value='${session.getAttribute("student")}'/>
<c:set var="nid" value='${studentLogin.getNid()}'/>

<div class="panel-body" style="background-color:073763; border-radius:10px 10px 10px 10px;">
      
   	<div class="panel-body" style="width:20%;display:inline-block; background-color:eeeeee; margin-left:0.5%; height:60px; border-radius:10px 10px 10px 10px;">
   		<i class="fa fa-hourglass-start fa-2x" style="color:black"></i>
   		<b style="color:black"><FONT SIZE=4>Horas Ofertas: ${studentLogin.getOfferHours()}</FONT></b>
   	</div>
         
   	<div class="panel-body" style="width:22%;display:inline-block; background-color:eeeeee; margin-left:18.5%; height:60px; border-radius:10px 10px 10px 10px;">
   		<i class="fa fa-hourglass-end fa-2x" style="color:black"></i>
   		<b style="color:black"><FONT SIZE=4>Horas Demandas: ${studentLogin.getDemandHours()}</FONT></b>
   	</div>
         
    <div class="panel-body" style="width:22%;display:inline-block; background-color:eeeeee; margin-left:16%; height:60px; border-radius:10px 10px 10px 10px;">
   		<i class="fa fa-clock-o fa-2x" style="color:black"></i>
   		<b style="color:black"><FONT SIZE=4>Saldo Disponible: ${studentLogin.getHorasRestantes()}</FONT></b>
   	</div>
         
</div>
      
<!--------------------------------------------------------------------------------------->
                
<div style="padding:25px;"></div>

<!--------------------------------------------------------------------------------------->

            
            <!-- PANEL IZQUIERDO -->
                <div class="col-lg-4">
                    <div class="panel-body" style="margin-bottom:5%;padding:3%;background-color:white; border:2px solid black;">
                    
                    <!-- PANEL DATOS USUARIO -->
                        <div class="panel-body" style="background-color:073763; height:200px;">
                        	<div class="panel-body" style="background-color:073763">
                        		<i class="fa fa-user fa-4x" style="color:#fff; height:10%">
                        		</i>
                        			<ul style="list-style:none;">
		                        		<li><FONT SIZE=4 style="padding-left:90px; color:eeeeee">${studentLogin.getName()}</FONT></li>
		                        		<li><FONT SIZE=4 style="padding-left:90px; color:eeeeee">${studentLogin.getNid()}</FONT></li>
		                        	</ul>
                        	</div>
			             </div>
			             
			             <div style="padding:5px;background-color:white"></div>
			             
			             
			        <!-- ESTADÍSTICAS COLABORACIONES -->
			             <div class="panel-body" style="background-color:073763; padding-top:10px">
                        	<div class="panel-body" style="background-color:073763">
                        	<h2 style="text-align:center; color:ffffff">Colaboraciones</h2>
                        	
                        	<!--  ESTADÍSTICAS  -->
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

<div class = "col-lg-8 panel-body" style = "margin-top:10px;background-color:073763; border-radius:10px 10px 10px 10px;">

	<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
	
		<h1 style = "color:black;margin:0; padding-top:10px; padding-left:20px">Apuntarme en grado</h1>
    					
    	<div style = "height:2px; width:50%; background-color:black"></div>
   
		<form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="degree">
				      
						<table>
			
				        	<tr style = "display:none;height:50px">
				        	
				                <td style = width:25%><form:label style = "padding-right: 50px" path="idDegree">ID Grado</form:label></td>
				                <td><form:input style = "width:10%; border:1px solid black; color:black"  cssClass="form-control" type = "text" maxlength = "5" path="idDegree" disabled = "true" readonly = "true"/><form:errors path = "idDegree" cssClass = "error" /></td>
				               				                
				            </tr>
				            
				            <tr style = "height:50px">
				            
				               <td style = width:25%><form:label style = "padding-right: 50px" path="name" id ="nombreGradoLabel">Nombre del Grado</form:label></td>
				               <td><select style = "width:100%; border:1px solid black; color:black"  Class="form-control" id="nombreGradoSelect" name="name">
									
									<c:choose>
									
										<c:when test = "${degreesStudent.size()==0}">
										
											<option value = ""> No hay grados para elegir</option>
										
										</c:when>
									
									</c:choose>
									
									<c:forEach items="${degreesStudent}" var="degree">
							
										<option value="${degree.name}">${degree.name}</option>
					
									</c:forEach>
		
								</select></td>
								
								<td><input style="font-weight:bold; background-color:white; border: 2px solid; margin-left:10px;color:black; width:50px; height:35px" class = "btn" id ="boton" type = "button" value = "+" onclick = "document.getElementById('nombreGradoNuevoSelect').disabled=false,
																								document.getElementById('nombreGradoSelect').disabled = true;">
				                
				            </tr>
				            
				            
				            <tr>
				            
				            	<td><form:label path = "name" id = "nombreGradoNuevoLabel">Nuevo Grado</form:label>
				            	<td><form:input class = "form-control" type = "text" id = "nombreGradoNuevoSelect" style = "width:100%; border:1px solid black; color:black" path = "name" disabled = "true"/><form:errors path = "name" cssClass = "error" /></td>
				            
				            </tr>
				            
				            <tr style = "height:50px">
				            
				                <td style = width:25%><form:label style = "padding-right: 50px" path="nid">DNI Estudiante</form:label></td>
								<td><form:input style = "background-color:eeeeee;width:25%; border:1px solid black; color:black"  cssClass="form-control" type = "text" maxlength = "9" path="nid" value = "${studentLogin.nid }" disabled = "true"/><form:errors path = "nid" cssClass = "error" /></td>
				                
				            </tr>
				       	</table>
				       	
						<div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>

				       	<input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/update/${studentLogin.nid }.html'" name = "cancel" value = "Cancelar">
					   		<input type = "button" style=  "font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%;margin-top:5%; width:100px; height:35px" data-toggle="modal" data-target="#myModal" class = "btn" value = "Aceptar"  />
		

<!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 style = "color:black" class="modal-title">Modificar Usuario</h4>
				        </div>
				        <div class="modal-body">
				          <p><i>¿Seguro que desea apuntarse a este grado?</i></p>
				        </div>
				        <div  class="modal-footer" style = "background-color:eeeeee">
				         <input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar" onclick = "document.getElementById('nid').disabled=false,
																																																		       		document.getElementById('idDegree').disabled=false;">
				        </div>
				      </div>
				      
				    </div>
				  </div> 
</form:form>
	</div>
	
</div>
		   
   		

