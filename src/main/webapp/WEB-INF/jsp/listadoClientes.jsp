<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<script>

//Para limpiar las ventanas modales
$(document).ready(function(){
    $('#modalBuscar').on('hidden.bs.modal', function () {
        $('form[id="formularioBuscar"]').trigger('reset');
    });
});

function verPedidosCliente(idCliente){
	 
 	document.formulario.idCliente.value = idCliente;
 	document.formulario.action="listadoPedidosCliente.do";
 	document.formulario.submit();
 

}
</script>


<br>
<br>
<br>

<form name="formulario" method="post">
	<input type="hidden" name="idCliente"/>
</form>

	<c:if  test="${!empty clientes}">           
		
		<br>
		
		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><i
							class="fas fa-list-alt fa-lg mr-1"></i><i
							class="fas fa-users fa-lg mr-2"></i>Listado de clientes</li>
					</ol>
				</nav>
			</div>
		</div>
		
<div class="row">
<div class="col-md-8">
	<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalBuscar"><i class="fas fa-search"></i> &nbsp;&nbsp;Buscar</button>  
	<button type="button" class="btn btn-outline-blue btn-rounded btn-sm px-2">
        <i class="fas fa-file-pdf fa-2x"></i>
      </button>
      <button type="button" class="btn btn-outline-blue btn-rounded btn-sm px-2">
        <i class="fas fa-file-excel fa-2x"></i>
      </button>
</div>

<mistags:paginacion accion="listadoClientes" />


</div>		

        	  <!-- DataTables Example -->
              <table class="table table-hover" id="dataTable">
				<thead class="blue lighten-4">
					<tr class="bg-light">	
					<th>Nombre</th>															
					<th>Apellidos</th>
					<th>Dirección</th>
					<th>Teléfono</th>																							
					<th>&nbsp;</th>
                  </tr>
                </thead>
                <tbody>
					<c:forEach items="${clientes}" var="cliente">
						<tr>
						
							<td>${cliente.nombre}</td>	
							
							<td>${cliente.apellidos}</td>
							
							<td>${cliente.direccion}</td>
							
							<td>${cliente.telefono}</td>
						
							
							<td>
								<div>
								  <label data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<span style="cursor:pointer;"><i class="fas fa-cog fa-lg"></i></span>
								  </label>					  
								  <ul class="dropdown-menu dropdown-primary">
									<li class="nav-item dropdown"><a class="dropdown-item" href="javascript:verPedidosCliente(${cliente.idCliente})">Ver pedidos</a></li>
									<li class="nav-item dropdown"><a class="dropdown-item" href="#">Datos</a></li>
								  </ul>
								</div>
							</td>						
						</tr>
					</c:forEach>
                </tbody>
              </table>		
		</c:if>
		
		<c:if  test="${empty clientes}">>
		<div class="row">
			<div class="col-md-3 col-lg-2">&nbsp;</div>
			<div class="col-md-6 col-lg-4 align-middle alert alert-warning"><i class="fas fa-info-circle fa-2x"></i> No se encontraron clientes que mostrar</div>
			<div class="col-md-3 col-lg-2">&nbsp;</div>
		</div>
		</c:if> 
	
<br>
<br>

	
<!-- Modal -->
<div class="modal fade" id="modalBuscar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Búsqueda de usuarios</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row">
		<div class="col-md-1">&nbsp;</div>
		<div class="col-md-10">
		<!-- Extended default form grid -->
		
		<form:form modelAttribute="cliente" action='buscarClientes.do' method="post" id="formularioBuscar">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nombre">Nombre</label> <form:input path="nombre" class="form-control" id="nombre"/><form:errors path="nombre" element="div" id="rojo"/>
				</div>
				<div class="form-group col-md-6">
					<label for="precio">Apellidos</label> <form:input path="apellidos" class="form-control" id="apellidos"/><form:errors path="apellidos" element="div" id="rojo"/>
				</div>
			</div>								
			
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="precio">Dirección</label> <form:input path="direccion" class="form-control" id="direccion"/><form:errors path="direccion" element="div" id="rojo"/>
				</div>
			</div>
		<!-- Extended default form grid -->
		</div>
		<div class="col-md-1">&nbsp;</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><i class="fas fa-times-circle"></i>&nbsp;&nbsp;Cancelar</button>
        <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-save"></i> &nbsp;&nbsp;Buscar</button>
      </div>
      
      </form:form>
      
    </div>
  </div>
</div>