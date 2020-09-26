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

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href='<spring:url value="/listadoClientes.do"/>'>Clientes <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					href='<spring:url value="/listadoPedidos.do"/>'>Pedidos </a></li>
			</ul>
		</div>
	</div>
</nav>