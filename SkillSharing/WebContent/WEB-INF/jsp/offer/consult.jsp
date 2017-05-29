<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>

	<style>
	
		.bordesRedondeados{
	
			-khtml-border-radius: 20px;
			-moz-border-radius: 20px;
			-webkit-border-radius: 20px;
			border-radius: 20px;
	
		}
	
	</style>

</head>

<t:paginaBasica title="Oferta">
</t:paginaBasica>
	<body>
	
		<div class = "panel-body bordesRedondeados" style="height:76.3%; padding-top:0px;background-color:eeeeee">
		
			<div style = "padding-bottom:5px; display:inline-block;width:55%;background-color:eeeeee"><h1 style="padding-left:200px; color:black"><i><b>Ofertas Disponibles</b></i></h1></div>
			<div style = "border:2px solid black; display:inline-block;width:43%;background-color:597eaa">
			
				<h4 style="color:black; padding-left:10px; padding-right:100px; display:inline-block">Habilidad</h4>
				
				<form:form method="post" modelAttribute="offer">
				
					<a href="${idSkill}.html"><i class = "glyphicon glyphicon-search" style = "color:black"></i></a>
				
					<select style="width:325px" id="idSkill" name="idSkill">
					
						<c:forEach items="${skills}" var="skill">
		
								<option value="${skill.name}">${skill.name}</option>
							
							
					</c:forEach>
					</select>
			
				</form:form>
			</div>
		
			<div class = "pre-scrollable panel-body" style = "max-height: 400px;border:2px solid black; background-color:597eaa">
		
			        <c:forEach items="${offers}" var="offer">
			      
			      		<div style = "padding:8px;border:2px solid black; background-color:white">
			      		
				      		 <div class = "panel-body" style = "width:37%; display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-book" style="color:black"><b> ${offer.name} </b></i></div>	
				             <div class = "panel-body" style = "width:25%;display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-bookmark" style="color:black"><b> ${offer.idSkill} </b></i></div>
				             <div class = "panel-body" style = "display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-calendar"style="color:black"><b> ${offer.beginningDate} </b></i></div>
				             <div class = "panel-body" style = "display:inline-block; border: 2px solid black; background-color:white"><i class="glyphicon glyphicon-calendar"style="color:black"><b> ${offer.endingDate} </b></i></div>
							 <div class = "panel-body" style = "width:120px;display:inline-block"><input class="btn"  style="text-align:left;font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:30%; width:80px; height:35px" type = "submit" name = "submit" value = "Aceptar"></div>
							 <div class = "panel-body" style = "display:inline-block"><button type="button" class="btn" style = "background-color:white; border: 2px solid; height:35px"><span class="glyphicon glyphicon-chevron-down"></span></button></div>
			      		</div>
			      		<div style = "padding:5px;background-color:597eaa"></div>
  
			        </c:forEach>  
  	  	
  	  		</div>
  	  	
  	  	</div>
    	
    <body>
	

<t:barrainferior>
</t:barrainferior>