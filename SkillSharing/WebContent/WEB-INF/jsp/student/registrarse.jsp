<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>  

<t:paginaBasica title="Registrarse">
		
	<jsp:body>
		
        <div class="row">
			<div class="panel-body">
	            <div class="col-lg-6">
					<p><img src="${pageContext.request.contextPath}/imagenes/Registrarse.png" width="800" height="320"></p>
				</div>
				<div class="col-lg-4" style="background-color:B5B9C9">
					<h3 align="center">Registrarse en Skill Sharing</h3>
					<form:form method="post" modelAttribute="student"> 
				
						<table style="border-collapse: separate; border-spacing:  10px;">
						
							<tr>
				        	
				                <td><form:label path="nid">DNI</form:label></td>
				                <td><form:input type = "text" maxlength = "9" path="nid" /></td>
				                <td><form:errors path="nid" cssClass="error" /></td>
				                
				            </tr>
				            
				            
				            <tr>
				            
				                <td><form:label path="name">Nombre</form:label></td>
				                <td><form:input type = "text" maxlength = "50" path="name" /></td>
				                <td><form:errors path="name" cssClass="error" /></td>
				                
				            </tr>
				            
				            <tr>
				            
				                <td><form:label path="username">Nombre usuario</form:label></td>
				                <td><form:input type = "text" maxlength = "30" path="username" /></td>
				                <td><form:errors path="username" cssClass="error" /></td>
				                
				            </tr>
				            
				            <tr>
				            
				                <td><form:label path="password">Contraseña</form:label></td>
				                <td><form:input type = "password" maxlength = "30" path="password" /></td>
				                <td><form:errors path="password" cssClass="error" /></td>
				                
				            </tr>
				            
				            <tr>
				            
				                <td><form:label path="mail">Correo</form:label></td>
				                <td><form:input type = "email" maxlength = "30" path="mail" /></td>
				                <td><form:errors path="mail" cssClass="error" /></td>
				                
				            </tr>
				            
				           	<tr>
		            
				                <td><form:label path="course">Curso</form:label></td>
				                <td><select id = "course" name = "course">
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
				    
				    	<input type = "submit" name = "submit" value = "Registrarse">
				        <input type = "button" onclick = "location='http://localhost:8080/SkillSharing/student/main.html'" name = "cancel" value = "Cancelar">
				    
				    </form:form>
				    
				  </div>
			</div>
			
        </div>
	
	</jsp:body>
	
</t:paginaBasica>