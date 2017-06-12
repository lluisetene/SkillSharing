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

<t:paginaBasica title="Demanda"/>
<t:paginaBasicaStudent/>
	
	<div class="col-lg-8" style="background-color:073763; border-radius:10px 10px 10px 10px; margin-top:-350px">
    	<div class="panel-body" style="background-color:073763">
			<div class="col-lg-12" style="background-color:eeeeee; border-radius:10px 10px 10px 10px;">
            	<div class="table-responsive">
					<h1 style = "color:black; margin:0; padding-left:40px; padding-top:10px	">Añadir Demanda</h1>
    				<div style = "height:2px; width:44%; background-color:black"></div>
                    
                  
	
   	
    <form:form method="post" style = "padding-top:10; padding-left:25" modelAttribute="demand">
	       
		<table>
        	
        	<tr>
                <td>
                	<form:label path="idDemand">IdDemanda</form:label>
                	<form:input type = "text" maxlength = "5" path="idDemand" readonly = "true" disabled = "true"/>
                </td>
            </tr>
            
            <tr>
                <td>
                	<form:label path="name">Nombre de la Demanda</form:label>
                	<form:input type = "text" style="width:485px" maxlength = "100" path="name"  />
            		<form:errors path="name" cssClass="error" />
            	</td>
            </tr>
            
            <tr>
                <td>
                <form:label path="idSkill">Habilidad</form:label>
         		<select style = "width:563px; border:1px solid black; background-color:white;" id = "idSkill" name = "idSkill">
					<option value="---">---</option>	
					<c:forEach items="${skills}" var="skill">
						<option value="${skill.getIdSkill()}">${skill.getName()} (${skill.getLevel()})</option>
					</c:forEach>
				</select>
				</td>
            </tr>
            
            <tr>
                <td><form:label path="description">Descripcion<FONT SIZE=2>(máximo 300 caracteres)</FONT></form:label></td>
            </tr>
            
            <tr>
                <td><textarea maxlength="300" rows="4" cols="68" style="resize:none;" name="description"></textarea>
            </td>
            
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
            
            <tr>
                <td><form:input type = "hidden" maxlength = "9" path="nid" value='${studentLogin.getNid()}' readonly = "true" disabled = "true"/></td>
            	<td><form:errors path="nid" cssClass="error"/></td>
            </tr>
            
        </table>
        
        <div style = "margin-top:25px; height:2px; width:97%; background-color:black"></div>
		<input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:35%;margin-top:5%; width:100px; height:35px" class = "btn" value = "Aceptar" data-toggle="modal" data-target="#myModal" onClick = "document.getElementById('idDemand').disabled=false, 
	        																	   																																							document.getElementById('nid').disabled=false;">
        <input style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:3%; margin-top:5%;width:100px; height:35px" class = "btn" type = "button" onclick = "location='${pageContext.request.contextPath}/student/main.html'" name = "cancel" value = "Cancelar">
        
        
        <!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
	    	<div class="modal-dialog">
	    
		      	<!-- Modal content-->
		      	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 style = "color:black" class="modal-title">Añadir Demanda</h4>
		        	</div>
		        	<div class="modal-body">
		          		<p><i>¿Seguro que desea Añadir esta demanda?</i></p>
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