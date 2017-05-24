<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>  

<head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/errors.css">


<style>

.errorMessages {
    display: none;
    list-style-type: disc;
    margin: 0 10px 15px 10px;
    padding: 8px 35px 8px 30px;
    color: #B94A48;
    background-color: #F2DEDE;
    border: 2px solid #EED3D7;
    border-radius: 4px;
    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
}
.bordesRedondeados{

-khtml-border-radius: 20px;
-moz-border-radius: 20px;
-webkit-border-radius: 20px;
border-radius: 20px;

}

.rotarTexto{

 transform: rotate(-17deg);
 -webkit-transform: rotate(-17deg);
 -moz-transform: rotate(-17deg);
 -o-transform: rotate(-17deg);

}

</style>

</head>

<t:paginaBasica title="Registrarse">
		
	<jsp:body>
		
        <div class="row" style="background-color:eeeeee;margin-right:0px; height:76.3%">
			<div class="panel-body" style="padding-top:35">
	            <div class="col-lg-6">
					<p><img src="${pageContext.request.contextPath}/imagenes/Registrarse.png" width="550" height="375" style="padding-left:100px; padding-bottom:25px"></p>
					<p class = "rotarTexto" style="margin-top:-8%; margin-left:30%; color: 073763; font-size:32px"><i>¡Gracias por unirte!</i></p>
				</div>
				<div class="col-lg-4 bordesRedondeados" style="background-color:cccccc; width:43%;margin-left:75">
					<h2 style="color:073763" align="center"><b><i>Registrarse en Skill Sharing</i></b></h2>
					<form:form style="padding-top:20" method="post" modelAttribute="student"> 
						
						<table style="border-collapse: separate; border-spacing:  12px; width:100%">
						
						
						
							<tr>
								
				                <td><form:label  path="nid" style= "padding-right:100px; color:black">DNI</form:label></td>
				                <td><form:input  type = "text" maxlength = "9" path="nid" style="width:100%; border-style:solid" /><br><form:errors path="nid" cssClass="error"/></td>
				            

				            </tr>
				   
				       
				            
				            <tr>
				            
				                <td><form:label style="color:black"  path="name">Nombre</form:label></td>
				                <td><form:input type = "text" maxlength = "50" path="name" style="width:100%; border-style:solid"/><br><form:errors path="name" cssClass="error"/></td>
				     
				                
				            </tr>
				            
		
				            
				            <tr>
				            
				                <td><form:label style= "color:black" path="username">Nombre usuario</form:label></td>
				                <td><form:input type = "text" maxlength = "30" path="username" style="width:100%; border-style:solid"/><br><form:errors path="username" cssClass="error" /></td>
				          
				                
				            </tr>
				                  
				            
				            <tr>
				            
				                <td><form:label style= "color:black" path="password">Contraseña</form:label></td>
				                <td><form:input type = "password" maxlength = "30" path="password" style="width:100%; border-style:solid"/><br><form:errors path="password" cssClass="error" /></td>
				                
				                
				            </tr>
				            
				            
				            
				            <tr>
				            
				                <td><form:label style= "color:black" path="mail">Correo</form:label></td>
				                <td><form:input type = "email" maxlength = "30" path="mail" style="width:100%; border-style:solid"/><br><form:errors path="mail" cssClass="error" /></td>
				                
				                
				            </tr>
				            
				        
				            
				           	<tr>
		            
				                <td><form:label style="color:black" path="course">Curso</form:label></td>
				                <td><select id = "course" name = "course" style="width:100%; border-style:solid">
			                	<option value="1" selected="selected">Primero</option>
				                	<option value="2">Segundo</option>
				                	<option value="3">Tercero</option>
				                	<option value="2">Cuarto</option>                	
				                	</select>
				                </td>
		                
		          		  	</tr>
		          		  
		          		  	<tr>
	            
				                <td><select id = "offerHours" name = "offerHours" style="display:none">
									<option value="20:00" selected="selected">20 horas (por defecto)</option>
								</select></td>
			          
			            	</tr>
	            
							<tr>
	            
	            
				                <td><select id = "demandHours" name = "demandHours" style="display:none">
									<option value="00:00" selected="selected">00 horas (por defecto)</option>
								</select></td>
	            
	            			</tr>
	            
	            	 		<tr>
	            
	
				                <td><select id="banned" name="banned" style="display:none">
									<option value="falso" selected="selected">falso</option>
									<option value="verdadero">verdadero</option>
								</select></td>
	            
	            			</tr>
		        
				        </table>
				    
				    	<input class="btn"  style="font-weight:bold; background-color:white; border: 1px solid; color:black; margin-left:30%; width:100px; height:35px" type = "submit" name = "submit" value = "Registrarse">
				        <input class = "btn" style="font-weight:bold; background-color:white; border: 1px solid; color:black; margin-left:2%;width:100px; height:35px" type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/main.html'" name = "cancel" value = "Cancelar">
				    
				    </form:form>
				    
				  </div>
			</div>
			
        </div>
	
	</jsp:body>
	
</t:paginaBasica>

  
<t:barrainferior>
</t:barrainferior>