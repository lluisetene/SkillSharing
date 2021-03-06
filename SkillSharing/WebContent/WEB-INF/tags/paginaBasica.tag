<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<html lang="es-ES">

	<head>
	
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>${title}</title>

		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		
		<!-- Estilos propios -->
		<link href="${pageContext.request.contextPath}/css/errors.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/estrellas.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/calendar.css">
		
		<!------------ Bootstrap ------------>
	    <!-- Bootstrap Core CSS -->
	    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- MetisMenu CSS -->
	    <link href="${pageContext.request.contextPath}/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	
	    <!-- Custom CSS -->
	    <link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css" rel="stylesheet">
	
	    <!-- Morris Charts CSS -->
	    <link href="${pageContext.request.contextPath}/vendor/morrisjs/morris.css" rel="stylesheet">
	
	    <!-- Custom Fonts -->
	    <link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
		
	</head>
	
	<body>
		
	
		<t:barrasuperior/>
		
	   	<jsp:doBody/>
	   
	   
	  	<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
		
		<!-- Bootstrap Core JavaScript -->
		 <script src="${pageContext.request.contextPath}/vendor/jquery/jquery-1.12.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="${pageContext.request.contextPath}/vendor/metisMenu/metisMenu.min.js"></script>
		
		<!-- Morris Charts JavaScript -->
		<script src="${pageContext.request.contextPath}/vendor/raphael/raphael.min.js"></script>
		<script src="${pageContext.request.contextPath}/vendor/morrisjs/morris.min.js"></script>
		<script src="${pageContext.request.contextPath}/data/morris-data.js"></script>
		
		<!-- Custom Theme JavaScript -->
		<script src="${pageContext.request.contextPath}/dist/js/sb-admin-2.js"></script>
	   

	</body>
	 
</html>


