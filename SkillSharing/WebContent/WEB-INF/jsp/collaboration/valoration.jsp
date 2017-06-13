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

<t:paginaBasica title="Colaboración"/>
<t:paginaBasicaStudent/>
	
	<div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
    	<div class="panel-body" style="background-color:073763">
			<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
            	<div class="table-responsive">
					<h1 style = "color:black; margin:0; padding-left:40px; padding-top:10px	">Modificar Colaboración</h1>
    				<div style = "height:2px; width:50%; background-color:black"></div>
                    
                  
	
   	
    <form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="collaboration">
	       
		<table>
        	
        	<tr>
                <td>
                	<form:label path="idCollaboration">IdColaboración</form:label>
                	<b style="padding-left:59px"></b>
                	<form:input type = "text" maxlength = "5" path="idCollaboration" readonly = "true" disabled = "true"/>
                </td>
            </tr>
            
            <tr>
                <td>
	                <form:label path="idOffer">Nombre de la Oferta</form:label><b style="padding-left:27px"></b>
	         		<form:input style = "width:563px; border:1px solid black; background-color:white;" id = "idOffer" name = "idOffer" path="idOffer" disabled="true" />
				</td>
            </tr>
            
            <tr>
                <td>
	                <form:label path="idDemand">Nombre de la Demanda</form:label>
	         		<form:input style = "width:563px; border:1px solid black; background-color:white;" id = "idDemand" name = "idDemand" path="idDemand" disabled="true" />
				</td>
            </tr>
            
                        
            <tr>
               <td>
               	<form:label path="hours">Duración</form:label>
               		
               		<b style="padding-left:108px"></b>
               		
              		<select style = "width:15%; border:1px solid black; color:black"  Class="form-control" id="hours" name="hours">
						<option value="---" selected="selected">---</option>
						<option value="00:00">00:00</option>
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
					</select>
					
					<form:input style = "width:80px; border:1px solid black; background-color:white;" id = "hours" name = "hours" path="hours" disabled="true" />
					
					<b style="padding-left:336px"></b>
					
                	<form:label path="rate">Puntuación</form:label>
					
					<select style = "width:15%; border:1px solid black; color:black"  Class="form-control" id="rate" name="rate">
						<option value="---" selected="selected">---</option>
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
              		
				</td>
            </tr>
            
            <tr>
  	            <td>
  	            	<form:label path="beginningDate" style="padding-left:150px">Fecha inicio</form:label>
                	<form:label path="endingDate" style="padding-left:150px">Fecha fin</form:label>
                <td>
            </tr>
            
            <tr>
                <td style="padding-left:140px">
                	<form:input type="text" path="beginningDate" name="beginningdate" id="from" size="10" readonly="true"/>
                	<b style="padding-left:100px"></b>
                	<form:input type="text" path="endingDate" name="endingdate" id="to" size="10" readonly="true" />
                <td>
            </tr>

            
        </table>
	        <input type = "submit" name = "submit" value = "Aceptar" onclick = "document.getElementById('idCollaboration').disabled=false, 
	        																   document.getElementById('idOffer').disabled=false,
	        																   document.getElementById('idDemand').disabled=false,
	        																   document.getElementById('hours').disabled=false,
	        																   document.getElementById('rate').disabled=false;">
	        																  
	         <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
        
        
        <!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
	    	<div class="modal-dialog">
	    
		      	<!-- Modal content-->
		      	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 style = "color:black" class="modal-title">Modificar Colaboración</h4>
		        	</div>
		        	<div class="modal-body">
		          		<p><i>¿Seguro que desea Modificar esta colaboración?</i></p>
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
    	
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script> 
	$(document).ready(function() {
		$("#from").datepicker({
			changeMonth:true,
			changeYear:true,
			showOn: "button",
	           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	           buttonImageOnly: true,
	           dateFormat:"dd/mm/yy",
	           minDate:0,
			onClose: function todate(selectedDate) {
				$("#to").datepicker("option", "minDate", selectedDate);
			}
		}).datepicker("setDate", new Date());
		$("#to").datepicker({				
			changeMonth:true,
			changeYear:true,
			showOn: "button",
	           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	           buttonImageOnly: true,
	           dateFormat:"dd/mm/yy",
	           minDate:0,
			onClose: function fromdate(selectedDate) {
			$("#from").datepicker("option", "maxDate", selectedDate);
			}
		}).datepicker("setDate", new Date());
	
	  });
</script>
<t:barrainferior/>