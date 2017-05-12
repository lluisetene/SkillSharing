<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="user" scope="request" value='${session.getAttribute("userlogin")}'/>

<p class="userlogin">

<c:choose>

<c:when test='${user == null}'>

	No autenticat <a href="${pageContext.request.contextPath}/login.html">Entrar</a> </c:when>

	<c:otherwise>
	
		Autenticat com ${user.username}
		
	<a href="${pageContext.request.contextPath}/logout.html">Eixir</a> </c:otherwise>
	
	</c:choose>
</p>