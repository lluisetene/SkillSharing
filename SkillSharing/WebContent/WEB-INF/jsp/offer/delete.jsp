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
	
	<div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
    	<div class="panel-body" style="background-color:073763">
			<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
            	<div class="table-responsive">
					<h1 style = "color:black; margin:0; padding-left:40px; padding-top:10px	">Eliminar Oferta</h1>
    				<div style = "height:2px; width:40%; background-color:black"></div>
                    
                  
   	
    <form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="offer">
	       
		<table>
        	
        	<tr>
                <td>
                	<form:label path="idOffer">IdOferta</form:label>
                	<form:input style = "border:1px solid black; color:black" cssClass="form-control" type = "text" maxlength = "30" path="idOffer" disabled="true" readonly="true"/><form:errors path="idOffer" cssClass="error" />
                </td>
            </tr>
            
            <tr>
                <td>
                	<form:label path="name">Nombre de la Oferta</form:label>
                	<form:input style = "width:485px; border:1px solid black; color:black" cssClass="form-control" type = "text" maxlength = "30" path="name" disabled="true" readonly="true"/><form:errors path="name" cssClass="error" />
            	</td>
            </tr>
            
            <tr>
                <td>
               		<form:label path="idSkill">Habilidad</form:label>
         			<form:input style = "widt:337px; border:1px solid black; color:black" cssClass="form-control" type = "text" maxlength = "30" path="idSkill" disabled="true" readonly="true"/><form:errors path="idSkill" cssClass="error" />
				</td>
            </tr>
            
            <tr>
                <td><form:label path="description">Descripcion<FONT SIZE=2>(máximo 300 caracteres)</FONT></form:label></td>
            </tr>
            
            <tr>
                <td>
                	<textarea maxlength="300" rows="4" cols="68" name="description" style="resize:none; border:1px solid black; color:black" disabled readonly>
                		${offer.getDescription()}
                	</textarea><form:errors path="description" cssClass="error" />
                	
            	</td>
            
            <tr>
  	            <td>
  	            	<form:label path="beginningDate" style="padding-left:150px">Fecha inicio</form:label>
                	<form:label path="endingDate" style="padding-left:150px">Fecha fin</form:label>
                <td>
                <td><form:errors path="beginningDate" cssClass="error" /></td>
            </tr>
            
            <tr>
                <td style="padding-left:140px">
                	<form:input type="text" path="beginningDate" name="beginningdate" id="from" size="10" readonly="true"/>
                	<b style="padding-left:100px"></b>
                	<form:input type="text" path="endingDate" name="endingdate" id="to" size="10" readonly="true" />
                <td>
                <td><form:errors path="endingDate" cssClass="error" /></td>
            </tr>
            
            <tr>
                <td><form:input type = "hidden" maxlength = "9" path="nid" value='${studentLogin.getNid()}' readonly = "true" disabled = "true"/></td>
            	<td><form:errors path="nid" cssClass="error"/></td>
            </tr>
            
        </table>
        
        <div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
		<input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%;margin-top:5%; width:100px; height:35px" class = "btn" value = "Aceptar" data-toggle="modal" data-target="#myModal" onClick = "document.getElementById('idOffer').disabled=false, 
	        																	   																																							document.getElementById('nid').disabled=false;">
        <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
        
        
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
		          		<p><i>¿Seguro que desea Eliminar esta oferta?</i></p>
		        	</div>
		        	<div  class="modal-footer" style = "background-color:eeeeee">
		         		<input type="submit" name = "submit" class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black;width:100px; height:35px" value = "Aceptar">
		        	</div>
		      	</div>
	      
	    	</div>
	  </div>
       	
       	
       	
    </form:form>
    </div>
    </div>
    </div>
    </div>
    
</html>