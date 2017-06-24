<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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