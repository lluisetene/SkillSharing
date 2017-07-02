<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<t:paginaBasica title="Login"/>

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
              
              			<h3>Login</h3>
           
           			</div>
           
           			<div class="modal-body">
              
              				<h4 style = "color:red"><b>No ha sido posible el logueo con este usuario</b></h4>
	              			<i>Este usuario ha sido baneado por un admnistrador por incumplir las normas de la plataforma.</i>    
       
       				</div>
           
           			<div class="modal-footer">
          
          				<a href="#" data-dismiss="modal">Cerrar</a>
           
           			</div>
      
      			</div>
   	
   			</div>
	
		</div>
		
		<c:choose>
		
			<c:when test = "${banned == true}">
				<script type="text/javascript">
					
					 popUp();

				</script>
			
			</c:when>
		
		</c:choose>
   		
   		<div class="panel-body" style="padding-top:68; padding-bottom:69">
   		
	   		<div class="col-lg-4 bordesRedondeados" style="background-color:cccccc; width:400px; height:350px;margin-left:33%">
	   		
	   			<h2 style="color:073763" align="center"><b><i>Skill Sharing</i></b></h2>
   				<h6 style="color:black" align="center"><b><i>Entrar en tu cuenta</i></b></h6>
   		
   					<form:form   style="padding-top:20" method="post" modelAttribute="login">
   					
   						<table style="border-collapse: separate; border-spacing:  12px; width:100%">
   						
   							<tr>
   							
   								<td ><form:input cssClass="form-control" style=" display:inline;margin-left:14%; width:250px; border:2px solid black" path="username" placeholder="Nombre Usuario"/><br><form:errors style="padding-left:50px" path="username" cssClass="error" /></td>
   						
   							</tr>
   							
   							<tr>
   							
   								<td><form:password cssClass="form-control" style="display:inline;margin-left:14%; width:250px; border:2px solid black" path="password" placeholder="Contraseña"/><br><form:errors style="padding-left:50px" path="password" cssClass="error" /></td>
   							
   							</tr>
   								
   						</table>
   						  						
   						<br>
   						
   						<input class="btn"  style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:21%; width:100px; height:35px" type = "button" onclick = "location='${pageContext.request.contextPath}/index.jsp'" name = "cancel" value = "Cancelar">
				        <input class = "btn" style="font-weight:bold; background-color:white; border: 2px solid; color:black; margin-left:2%;width:100px; height:35px" type = "submit" name = "submit" value = "Log in">

   						<p style="font-size:10px; padding-left:25%; padding-top:10%">¿No estás registrado? <b>Registrate <a href = "${pageContext.request.contextPath}/student/registrarse.html">aquí</a></b></p>
   					
   					</form:form>
   		
   			</div>
   			
   		</div>

	<body>


<t:barrainferior/>