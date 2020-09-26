<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<script>

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
	<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#buscarFormulario"><i class="fas fa-search"></i> &nbsp;&nbsp;Buscar</button>  
	<button type="button" class="btn btn-outline-blue btn-rounded btn-sm px-2">
        <i class="fas fa-file-pdf fa-2x"></i>
      </button>
      <button type="button" class="btn btn-outline-blue btn-rounded btn-sm px-2">
        <i class="fas fa-file-excel fa-2x"></i>
      </button>
</div>
<div class="col-md-4">
  <ul class="pagination pagination-sm pg-blue justify-content-end">
    <li class="page-item disabled"><a class="page-link">Primero</a></li>
    <li class="page-item disabled">
      <a class="page-link" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item active"><a class="page-link">1</a></li>
    <li class="page-item">
      <a class="page-link" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link">Último</a></li>
    <li class="page-item"><a class="page-link">(10 págs.)</a></li>
  </ul>
</div>


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
	


	
<!-- Modal -->
<div class="modal fade" id="buscarFormulario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
		<form>
			<!-- Grid row -->
			<div class="form-row">
				<!-- Default input -->
				<div class="form-group col-md-6">
					<label for="inputEmail4">Nombre</label> <input type="email"
						class="form-control" id="inputEmail4">
				</div>
				<!-- Default input -->
				<div class="form-group col-md-6">
					<label for="inputPassword4">Apellidos</label> <input type="password"
						class="form-control" id="inputPassword4" >
				</div>
			</div>
			<!-- Grid row -->

			<!-- Default input -->
			<div class="form-group">
				<label for="inputAddress">Dirección</label> <input type="text"
					class="form-control" id="inputAddress">
			</div>
			<!-- Default input -->
			<div class="form-group">
				<label for="inputAddress2">Población</label> <input type="text"
					class="form-control" id="inputAddress2">
			</div>
			<!-- Grid row -->
			<div class="form-row">
				<!-- Default input -->
				<div class="form-group col-md-6">
					<label for="inputCity">Provincia</label> <input type="text"
						class="form-control" id="inputCity">
				</div>
				<!-- Default input -->
				<div class="form-group col-md-6">
					<label for="inputZip">Código postal</label> <input type="text"
						class="form-control" id="inputZip">
				</div>
			</div>
			<!-- Grid row -->
		</form>
		<!-- Extended default form grid -->
		</div>
		<div class="col-md-1">&nbsp;</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><i class="fas fa-times-circle"></i>&nbsp;&nbsp;Cancelar</button>
        <button type="button" class="btn btn-success btn-sm"><i class="fas fa-save"></i> &nbsp;&nbsp;Guardar</button>
      </div>
    </div>
  </div>
</div>