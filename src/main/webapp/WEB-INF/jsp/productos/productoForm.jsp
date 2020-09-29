<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


	<form:form modelAttribute="producto" action='${modo}Producto.do' method="post">


	<br>


	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><i
						class="fas fa-list-alt fa-lg mr-1"></i><i
						class="fas fa-users fa-lg mr-2"></i>
					<c:if test="${modo == 'insertar'}">
					Nuevo producto
					</c:if>
					<c:if test="${modo == 'actualizar'}">
					Editar producto
					</c:if>
					</li>
				</ol>
			</nav>
		</div>
		</div>

						

							<c:if test="${modo == 'actualizar'}">

								<form:hidden path="idProducto"/>

							</c:if>
														
								<div class="form-group">
									<label for="inputAddress">Categor�a</label>
									<form:select path="categoria.idCategoria" class="form-control">
		                                <option value="">Seleccione la categor�a</option>
										<form:options items="${categorias}" itemValue="idCategoria" itemLabel="nombre" />
									</form:select>				 
								</div>	
											

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="nombre">Nombre</label> <form:input path="nombre" class="form-control"/><form:errors path="nombre" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="precio">Precio</label> <form:input path="precio" class="form-control"/><form:errors path="precio" element="div" id="rojo"/>
									</div>
								</div>
								
								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="precio">Foto</label> <form:input path="nombreFoto" class="form-control"/><form:errors path="nombreFoto" element="div" id="rojo"/>
									</div>
								</div>								
					

							
							<a href="./listadoProductos1.do" class="btn btn-secondary btn-sm"><i class="fas fa-times-circle"></i>&nbsp;&nbsp;Cancelar</a>
							<button type="submit" class="btn btn-success btn-sm" ><i class="fas fa-save"></i> &nbsp;&nbsp;Guardar</button>	
							


	</div>
	</div>

	</form:form>