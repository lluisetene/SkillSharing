<%@ tag description="Estructura d'una pàgina normal" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<html lang="es-ES">

	<head>
	
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>${title}</title>

		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/CSS/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/CSS/bootstrap-theme.min.css" rel="stylesheet">
		
		<!-- Estils propis -->
		<link href="${pageContext.request.contextPath}/CSS/errors.css" rel="stylesheet">
	</head>
	
	<body>
    <header class="container page-header"><h1>Skill Sharing</h1></header>
    <t:logininfo />
    <div class="container">
    <jsp:doBody/>
    </div>
    <footer>
    <hr>
    <p class="text-muted">&#169; 2017 Skill Sharing. All Rights Reserved</p>
    </footer>
</body>
</html>