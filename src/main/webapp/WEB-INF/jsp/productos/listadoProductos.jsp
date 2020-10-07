

 
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


<script>
function borrarProducto(idProducto){

	 	document.formulario.idProducto.value = idProducto;
	 	document.formulario.action="borrarProducto.do";
	 	document.formulario.submit();

}
function editarProducto(idProducto){
	 
 	document.formulario.idProducto.value = idProducto;
 	document.formulario.action="editarProducto.do";
 	document.formulario.submit();
 

}
function altaProducto(){

	window.location.href= "altaProducto.do";
	
}

function verBusquedaProducto(){

	window.location.href= "verBusquedaProducto.do";
	
}

function mostarConfirmBorrarProducto(idProducto) {
    var message = '¿Desea borrar el producto?';
    
    $("#aceptarBorrar").attr("href", "javascript:borrarProducto(" + idProducto + ");");
    
    mostrarConfirm(message);
}



function mostrarConfirm(message) {
    $('#alertModal').find('.modal-body p').html(message);
    $('#alertModal').modal('show');
} 
</script>


<!-- Confirm Modal -->
<div id="alertModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header alert alert-warning">
      	<h5 class="modal-title"><i class="fas fa-exclamation-triangle fa-lg"></i>&nbsp;Atención</h5>  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>		     
      </div>    
      <div class="modal-body">
         <p class="text-center"></p>
      </div>
      <div class="modal-footer">         
         <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><i class="fas fa-times-circle"></i>&nbsp;&nbsp;Cancelar</button>
         <a class="btn btn-primary btn-sm" role="button" href="#" id="aceptarBorrar"><i class="fas fa-check-circle"></i>&nbsp;&nbsp;Aceptar</a>
      </div>
    </div>
  </div>
</div>
<!-- ./ Confirm Modal -->

<br>
<br>
<br>

<form name="formulario" method="post">
	<input type="hidden" name="idProducto"/>
</form>
				
		<c:if  test="${!empty productos}">           
		
		<br>
		
		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><i
							class="fas fa-list-alt fa-lg mr-1"></i><i
							class="fas fa-users fa-lg mr-2"></i>Listado de productos</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="row">
		<div class="col-md-8">
			<button type="button" class="btn btn-success btn-sm" onclick="javascript:altaProducto();"><i class="fas fa-plus-circle"></i>&nbsp;&nbsp;Nuevo</button>&nbsp;&nbsp;		
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
					<th>Precio</th>																							
					<th width="10%">&nbsp;</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr class="bg-light">
					<th>Nombre</th>															
					<th>Precio</th>																							
					<th width="10%">&nbsp;</th>
                  </tr>
                </tfoot>
                <tbody>
					<c:forEach items="${productos}" var="producto">
						<tr>
						
							<td>${producto.nombre}</td>	
						
							<td>${producto.precio}</td>								
											
							
							<td>
								<div>
										<label data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> <span style="cursor: pointer;"><i
												class="fas fa-cog fa-lg"></i></span>
										</label>
										<ul class="dropdown-menu dropdown-primary">
											<li class="nav-item dropdown"><a class="dropdown-item"
												href="javascript:editarProducto('${producto.idProducto}')">Editar</a></li>
											<li class="nav-item dropdown"><a class="dropdown-item"
												href="javascript:mostarConfirmBorrarProducto('${producto.idProducto}')">Borrar</a></li>
										</ul>
									</div>				  
							</td>						
						</tr>
					</c:forEach>
                </tbody>
              </table>		
	
		
			
		</c:if>

	
		<c:if  test="${empty productos}">
		
			<br>
			<br>
			<br>
			<br>
			<center>No hay productos que mostrar...</center>
		</c:if>
	
		<br>
		<br>
		<br>
		<br>
		
		
<script>

$(document).ready(function() {
	  $('#dataTable').DataTable();	 
	});


</script>		
