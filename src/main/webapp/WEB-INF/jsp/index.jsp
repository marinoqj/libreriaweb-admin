<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

<nav
	class="navbar navbar-expand-lg navbar-light fixed-top scrolling-navbar"
	style="background-color: #e3f2fd;">
	<div class="container">
		<a class="navbar-brand" href="#"> <img
			src='<spring:url value="/static/imagenes/logo.png"/>' height="50"
			class="d-inline-block align-top">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
	</div>
</nav>

<br>
<br>
<br>
<br>
<br>
<br>

<div class="row">
	<div class="col-md-3">&nbsp;</div>
	<div class="col-md-6">
	<p><h3>Tienda online con arquitectura de microservicios</h3></p>
	<p>Esta aplicación está compuesta por tres partes:</p>
	<p><b>- Servidor:</b> Implementado con Spring Boot y Spring Data. Conecta con la BBDD y expone el modelo mediante un API REST</p>
	<p><b>- Web de administración:</b> Implementada con Spring MVC, Spring Security y Spring REST. Utiliza los servicios de API REST para gestión de toda la tienda</p> 
	<p><b>- Web pública:</b> Implementada con Spring MVC y Spring REST. UI que sirve para realizar la compras en la tienda.</p>
	<br>
	<p>Todo ello está desplegado en Cloud sobre un sistema de contenedores Docker/Kubernetes.</p>
	
	</div>
	<div class="col-md-3">&nbsp;</div>
</div>

<div class="row">
	<div class="col-md-8">&nbsp;</div>
	<div class="col-md-4">
		<a href="login.do" class="btn btn-primary btn-sm">Acceder&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-alt-circle-right fa-lg mr-2"></i></a>
	</div>
</div>	