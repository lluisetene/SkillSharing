<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:paginaBasica title="Login">

	<jsp:body>
	
   	<h2>Autenticación</h2>

	<form:form method="post" modelAttribute="login" action="${pageContext.request.contextPath}/login.html">

        	<p>

        	    <form:label path="username">Nombre usuario</form:label>

    	        <form:input path="username" />

	            <form:errors path="username" cssClass="error" />

        	</p>

        	<p>

            	<form:label path="password">Contraseña</form:label>

            	<form:password path="password" />

            	<form:errors path="password" cssClass="error" />

        	</p>
        	
        	<p>¿No estás registrado? Registrate <a href="${pageContext.request.contextPath}/student/registrarse.html">aquí</a></p>
        	
        	<input type="submit" value="Log in" />

        	<input type = "button" onclick = "location='${pageContext.request.contextPath}/index.jsp'" name = "cancel" value = "Cancelar">
        
    </form:form>
    
    </jsp:body>

</t:paginaBasica>