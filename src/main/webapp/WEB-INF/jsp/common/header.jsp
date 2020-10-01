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
			<sec:authorize access="hasRole('ADMIN')"> 
				<li class="nav-item active"><a class="nav-link"
					href='<spring:url value="/listadoClientes1.do"/>'>Clientes <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					href='<spring:url value="/listadoPedidos.do"/>'>Pedidos </a></li>
			</sec:authorize>
				<li class="nav-item active"><a class="nav-link"
					href='<spring:url value="/listadoProductos1.do"/>'>Productos </a></li>					
			</ul>
		    <ul class="navbar-nav">
		      <li class="nav-item dropdown active">
		        <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
		          aria-haspopup="true" aria-expanded="false">
		          <i class="fas fa-user-circle fa-lg"></i>
		        </a>
		        <div class="dropdown-menu dropdown-menu-right dropdown-default"
		          aria-labelledby="navbarDropdownMenuLink-333">
		          <a class="dropdown-item" href="#">Mi perfil</a>
		          <a class="dropdown-item" href="logout.do">Cerrar sesión</a>
		        </div>
		      </li>
		    </ul>			
		</div>
		
	</div>
</nav>