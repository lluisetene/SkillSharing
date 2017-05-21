<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
   
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color:white;">
    <div class="navbar-header">
        <img src="imagenes/Skill_Sharing_Logo.png" width="500" height="100"/><a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"></a>
    </div>

	<!--  BARRA SUPERIOR/ENLACES -->
      <ul class="nav navbar-top-links navbar-right">
          <li class="dropdown">
          <li><a href = "${pageContext.request.contextPath}/index.jsp">Página Principal</a>
		  <li><a href = "${pageContext.request.contextPath}/offer/list.html">Ofertas</a></li>
		  <li><a href = "${pageContext.request.contextPath}/demand/list.html">Demandas</a></li>
                 
	      <!-- LOGIN -->
	      <li class="dropdown">
	      
	      		<!--  ICONO  -->
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	              <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
	          </a>
	          <!--  /ICONO  -->
	          
	          <ul class="dropdown-menu dropdown-user">
	              <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Login</a>
	          </ul>
	      </li>
      <!--  /LOGIN  -->

      </ul>
</nav>

<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="vendor/raphael/raphael.min.js"></script>
<script src="vendor/morrisjs/morris.min.js"></script>
<script src="data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>