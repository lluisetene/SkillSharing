<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>

	<style>
	
		tr {
		
			height:50px;
		
		}
	
	</style>

</head>

<t:paginaBasica title="Oferta"/>
<t:paginaBasicaStudent/>

<body>


	   	<script>
     
	   		function popUp(){
         
	   			$("#mostrarmodal").modal("show");
      		};
    
    	</script>

   		<div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      
      		<div class="modal-dialog">
        
        		<div class="modal-content">
           
           			<div class="modal-header">
          
          				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              
              			<h3>Eliminar Oferta</h3>
           
           			</div>
           
           			<div class="modal-body">
              
              				<h4 style = "color:red"><b>No ha sido posible eliminar la oferta</b></h4>
	              			<i>Esta oferta no se puede borrar porque forma parte de colaboraciones.</i>    
       
       				</div>
           
           			<div class="modal-footer">
          
          				<a href="#" data-dismiss="modal">Cerrar</a>
           
           			</div>
      
      			</div>
   	
   			</div>
	
		</div>
		
		<c:choose>
		
			<c:when test = "${Error == true}">
				<script type="text/javascript">
					
					 popUp();

				</script>
			
			</c:when>
		
		</c:choose>
	
	<div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
    	<div class="panel-body" style="background-color:073763">
			<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
            	<div class="table-responsive">
					<h1 style = "color:black; margin:0; padding-left:40px; padding-top:10px	">Eliminar Oferta</h1>
    				<div style = "height:2px; width:40%; background-color:black"></div>
                    
                  
   	
    <form:form method="post" style = "padding-top:10; padding-left:25; padding-right:25" modelAttribute="offer">
	       
		<table>
		        	
	    	<tr style = "height:50px; display:none">
	            
	            <td style = "width:225px"><form:label path="idOffer">IdOferta</form:label></td>
	            <td><form:input cssClass="form-control" style = "color:black;width:75px;border:1px solid black" type = "text" maxlength = "5" path="idOffer" disabled = "true" readonly="true"/><form:errors path="idOffer" cssClass="error"/></td>
	        	
	        </tr>
	        
	        <tr style = "height:50px; display:none">
	        
	            <td><form:label path="nid">DNI</form:label></td>
	            <td><form:input cssClass="form-control" style = "color:black;width:150px;border:1px solid black" type = "text" maxlength = "9" path="nid" disabled = "true" readonly="true"/><form:errors path="nid" cssClass="error"/></td>
	    
	        </tr>
	        
	        <tr style = "height:50px">
	        
	            <td><form:label path="name">Nombre</form:label></td>
	            <td style="padding-left:2%"><form:input cssClass="form-control" style = "color:black;width:675px;border:1px solid black" type = "text" maxlength = "100" path="name" disabled = "true" readonly="true"/><form:errors path="name" cssClass="error" /></td>
	
	        </tr>
	        
	        <tr style = "height:50px">
	            
	            <td><form:label path="idSkill">Habilidad</form:label></td>
	            <td style = "padding-left:2%; width:150px"><select Class="form-control" style = "color:black;width:250px; border:1px solid black" id="idSkill" name="idSkill" disabled>
		
		<option value = "${Skill.idSkill}">(Actual) ${Skill.name}  (${Skill.level}) </option>
		
		<c:forEach items="${skillsSelect}" var="skill">
	
			<option value="${skill.idSkill}">${skill.name} (${skill.level})</option>
	
		</c:forEach>											
	
		</select>		
	        </tr>
	        
	         <tr style = "height:50px">
	       
	           	<td colspan="2"><form:label path="description">Descripci�n <h6 style = "display:inline-block">(300 Caracteres)</h6></form:label></td>
	           
	       	</tr>
	       
	      		<tr>
	       
	       		<td colspan="4"><form:textarea  style = "resize:none; border:1px solid black; color:black" maxlength = "300" rows = "5" cols = "59" cssClass = "form-control" path="description" disabled = "true" readonly="true"/>
	       	
	       	
	       	</tr>
	       	
	       	</table>
	       	<table>
	        
	         <tr style = "height:100px">
	         
	             <td style = "width:200px"><form:label path="beginningDate">Fecha inicio</form:label></td>
	             <td><form:input cssClass="form-control" style = "background-color:eeeeee;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="beginningDate" id="from" name="datepicker"  size="10" value="${offer.beginningDate }" disabled = "true" readonly="true"/><form:errors path="beginningDate" cssClass="error" /></td>
	     
	       		<td style = "padding-left:340px;width:180px"><form:label path="endingDate">Fecha fin</form:label></td>
	           		<td><form:input cssClass="form-control" style = "background-color:eeeeee;display:inline-block;color:black;width:100px;border:1px solid black" type="text" path="endingDate" id = "to" name="datepicker" size="10" value = "${offer.endingDate }" disabled = "true" readonly="true"/><form:errors path="endingDate" cssClass="error" /><td>
	       		
	         </tr>
	         
	      		
	      
						</table>
        
        <div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
        <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
		<input type = "button" style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%;margin-top:5%; width:100px; height:35px" class = "btn" value = "Aceptar" data-toggle="modal" data-target="#myModal">
        
        
        <!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
	    	<div class="modal-dialog">
	    
		      	<!-- Modal content-->
		      	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 style = "color:black" class="modal-title">Eliminar Oferta</h4>
		        	</div>
		        	<div class="modal-body">
		          		<p><i>�Seguro que desea Eliminar esta oferta?</i></p>
		        	</div>
		        	<div  class="modal-footer" style = "background-color:eeeeee">
		         		<input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar" onClick = "document.getElementById('idOffer').disabled=false, 
	        																	   																																document.getElementById('nid').disabled=false;">
		        	</div>
		      	</div>
	      
	    	</div>
	  </div>
       	
       	
       	
    </form:form>
    </div>
    </div>
    </div>
    </div>
    </body>
</html>