<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
  $(".flip").click(function(){
    $(this).next(".panel").slideToggle("slow");
  });
});
</script>

<style> 
.panel, .flip {

    background-color: white;
  	padding-top:20; 
  	padding-bottom:20;
  	padding-left:40;
}

.panel {
    padding: 70px;
    display: none;
 padding-top:10; padding-left:40
}

.bordesRedondeados{

-khtml-border-radius: 20px;
-moz-border-radius: 20px;
-webkit-border-radius: 20px;
border-radius: 20px;

}

td{

width:300px;

}

</style>
	

</head>

<t:paginaBasica title="Demanda">
</t:paginaBasica>

	<body>

		<div class = "panel-body bordesRedondeados" style="height:76.3%; padding-top:0px;background-color:eeeeee">
		
			<div style = "padding-bottom:5px; display:inline-block;width:63.2%;background-color:eeeeee"><h1 style="padding-left:220px; color:black"><i><b>Demandas Disponibles</b></i></h1></div>
			<div style = "border:2px solid black; display:inline-block;width:35%;background-color:597eaa">
			
				<h4 style="color:black; padding-left:10px; padding-right:30px; display:inline-block">Habilidad</h4>
				
				<form:form style = "margin: 0; display:inline-block" method="post" modelAttribute="demand">
				
					<button style = "background-color:597eaa;  border:none" type="submit"><span style = "color: black; background-color:597eaa" class="glyphicon glyphicon-search"></span></button>
				
					<select style="width:300px" id="idSkill" name="idSkill">
					
						<option value="Todas" >Todas</option>	
						
						<c:forEach items="${skills}" var="skill">
		
							<option value="${skill.idSkill}">${skill.name}</option>

						</c:forEach>
						
					</select>
			
				</form:form>
			</div>
		<div class = "pre-scrollable panel-body" style = "max-height: 400px; height: 400px;border:2px solid black; background-color:597eaa">
		
			        <c:forEach items="${demands}" var= "demand">
			      		
			      		
			      		
			      		<div style = "padding-left:8px;border:2px solid black; background-color:white">
			      		
			      		
				      		 <div class = "panel-body" style = "width:37%; display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-book" style="color:black"></i><b style = "color:black"> ${demand.name} </b></div>	
				             <div class = "panel-body" style = "width:25%;display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-bookmark" style="color:black"></i><b style = "color:black"> ${demand.idSkill.split("/")[1]} </b></div>
				             <div class = "panel-body" style = "display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-calendar"style="color:black"></i><b style = "color:black"> ${demand.beginningDate} </b></div>
				             <div class = "panel-body" style = "display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-calendar"style="color:black"></i><b style = "color:black"> ${demand.endingDate} </b></div>
							 <c:choose>

								<c:when test='${adminLogin == null && studentLogin == null}'>
							 
									 <div class = "panel-body" style = "width:120px;display:inline-block"><input class="btn"  style="text-align:left;font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:30%; width:80px; height:35px" type = "submit" name = "submit" value = "Aceptar" onclick = "location='${pageContext.request.contextPath}/login.html'"></div>
							
								</c:when>
								<c:when test="${studentLogin != null}"> 
	
									<div class = "panel-body" style = "width:120px;display:inline-block"><input class="btn"  style="text-align:left;font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:30%; width:80px; height:35px" type = "submit" name = "submit" value = "Aceptar" onclick = "location='${pageContext.request.contextPath}/collaboration/add.html'"></div>
		
								</c:when>
								
							
							</c:choose>
							
							 <div class = "flip" style = "padding:0px; margin-left:2%; display:inline-block"><button type="button" class="btn" style = "background-color:white; border: 2px solid black; height:35px"><span class="glyphicon glyphicon-chevron-down"></span></button></div>
			      			 <div class="panel" style = "border-top: thick double black;background-color:white; padding: 10px 25px 10px 50px;margin:0; padding-right:25px">
								
								<table style = "display:inline-block">
								
									<tr>
									
										<td><h6>Demanda: ${demand.name}</h6></td>
									
									</tr>
									<tr>
									
										<td><h6>Habilidad: ${demand.idSkill.split("/")[1]}</h6></td>
										<td><h6 style = "padding-left:15%">Nivel: ${demand.idSkill.split("/")[2]}</h6></td>
									
									</tr>
									<tr>
									
										<td><h6>Fecha de Inicio: ${demand.beginningDate}</h6></td>
										<td><h6 style = "padding-left:15%">Fecha de Fin: ${demand.endingDate}</h6></td>
									
									</tr>
								
								</table>
								
							
								<textarea style="border: 1px solid black; resize:none; width:46%" rows="4" id="comment" readonly>${demand.description}</textarea>

							</div>
			      		</div>
			      		<div style = "padding:5px;background-color:597eaa"></div>
  
			        </c:forEach>  
  	  		</div>
  	  	
  	  	</div>
    	
    <body>
	

<t:barrainferior>
</t:barrainferior>