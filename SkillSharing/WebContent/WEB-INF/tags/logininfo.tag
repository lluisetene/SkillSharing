<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="adminLogin" scope="request" value="${session.getAttribute('adminLogin')}" />
<c:set var="studentLogin" scope="request" value='${session.getAttribute("studentLogin")}'/>


<c:choose>

	<c:when test='${adminLogin == null && studentLogin == null}'>

		<a href="${pageContext.request.contextPath}/login.html">Conectar</a>
	
	</c:when>

	
	<c:when test="${adminLogin != null}"> 
	
		${adminLogin.username} <a href="${pageContext.request.contextPath}/logout.html">Desconectar</a>
		
	</c:when>
		
		
	<c:when test="${studentLogin != null}"> 
	
		${studentLogin.username} <a href="${pageContext.request.contextPath}/logout.html">Desconectar</a>
		
	</c:when>
	
</c:choose>