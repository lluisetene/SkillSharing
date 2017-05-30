<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="adminLogin" scope="request" value="${session.getAttribute('adminLogin')}" />
<c:set var="studentLogin" scope="request" value='${session.getAttribute("studentLogin")}'/>
   
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color:white;">
    <div class="navbar-header">
    	<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/imagenes/Skill_Sharing_Logo.png" width="500" height="100"></a> 
    </div>

	<!--  BARRA SUPERIOR/ENLACES -->
      <ul class="nav navbar-top-links navbar-right" style="margin-top:25px">
         
	      
	      <c:choose>
	      
				<c:when test='${adminLogin == null && studentLogin == null}'>
				 <li class="dropdown">
		         <li><a href ="${pageContext.request.contextPath}/index.jsp"><b>Página Principal</b></a>
				 <li><a href = "${pageContext.request.contextPath}/offer/list.html"><b>Ofertas</b></a></li>
				 <li><a href = "${pageContext.request.contextPath}/demand/list.html"><b>Demandas</b></a></li>
		                 
			     <!-- LOGIN -->
			     <li class="dropdown">
		         <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		             <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
		         </a>
		          <ul class="dropdown-menu dropdown-user">
		              <li><a href="${pageContext.request.contextPath}/login.html"><i class="fa fa-sign-in fa-fw"></i> Login</a>
		          </ul>
				</c:when>
				
				<c:when test="${adminLogin != null}"> 
					<li class="dropdown">
		        	<li><a href ="${pageContext.request.contextPath}/index.jsp"><b>Página Principal</b></a>
					 <!-- LOGIN -->
			    <li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		              <i class="fa fa-user fa-fw"></i><b>${adminLogin.username}</b><i class="fa fa-caret-down"></i>
		          	</a>
	  		        <ul class="dropdown-menu dropdown-user">
	  		          <li><a href="${pageContext.request.contextPath}/admin/main.html"><i class="fa fa-home fa-fw"></i>Mi Página</a>
		              <li><a href="${pageContext.request.contextPath}/admin/update.jsp"><i class="fa fa-gear fa-fw"></i>Configurar Perfil</a>
		              <li><a href="${pageContext.request.contextPath}/logout.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
		          	</ul>
				</c:when>
				
				<c:when test="${studentLogin != null}"> 
				<li class="dropdown">
		        <li><a href ="${pageContext.request.contextPath}/index.jsp"><b>Página Principal</b></a>
				<li><a href = "${pageContext.request.contextPath}/offer/list.html"><b>Ofertas</b></a></li>
				<li><a href = "${pageContext.request.contextPath}/demand/list.html"><b>Demandas</b></a></li>
                 
			    <!-- LOGIN -->
			    <li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		              <i class="fa fa-user fa-fw"></i><b>${studentLogin.username}</b><i class="fa fa-caret-down"></i>
		          	</a>
	  		        <ul class="dropdown-menu dropdown-user">
	  		          <li><a href="${pageContext.request.contextPath}/student/main.html"><i class="fa fa-home fa-fw"></i>Mi Página</a>
		              <li><a href="${pageContext.request.contextPath}/student/update/${studentLogin.nid}.html"><i class="fa fa-gear fa-fw"></i>Configurar Perfil</a>
		              <li><a href="${pageContext.request.contextPath}/logout.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
		          	</ul>
		      	</li>
				</c:when>
			
			</c:choose>
		
	      <!-- /LOGIN -->
	      
      </ul>
      
      
      
</nav>