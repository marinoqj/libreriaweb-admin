<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<script>

function verDetallePedido(idPedido){
	 
 	document.formulario.idPedido.value = idPedido;
 	document.formulario.action="detallePedido.do";
 	document.formulario.submit();
 

}
</script>


<br>
<br>
<br>

<form name="formulario" method="post">
	<input type="hidden" name="idPedido"/>
</form>



	<c:if  test="${!empty pedidos}">           
		
		<br>
		
		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><i
							class="fas fa-list-alt fa-lg mr-1"></i><i
							class="fas fa-users fa-lg mr-2"></i>Listado de pedidos</li>
					</ol>					
				</nav>
			</div>
		</div>


<div class="row">
	<div class="col-md-8">&nbsp;</div>

	<mistags:paginacion accion="listadoPedidos" />

</div>        	  
              <table class="table table-hover" id="dataTable">
				<thead class="blue lighten-4">
					<tr class="bg-light">
					<th>ID</th>
					<th>Nombre</th>															
					<th>Apellidos</th>
					<th>Fecha</th>
					<th>Num. articulos</th>
					<th>Total</th>																							
					<th>&nbsp;</th>
                  </tr>
                </thead>
                <tbody>
					<c:forEach items="${pedidos}" var="pedido">
						<tr>
						
							<td>${pedido.idPedido}</td>
						
							<td>${pedido.cliente.nombre}</td>	
							
							<td>${pedido.cliente.apellidos}</td>
							
							<td><fmt:formatDate value="${pedido.fecha}" pattern="dd-MM-yyyy"/></td>
							
							<td>${pedido.numArticulos}</td>
							
							<td>${pedido.total}</td>
						
							
							<td>
								<button type="button" onclick="javascript:verDetallePedido(${pedido.idPedido})" class="btn btn-outline-white btn-rounded btn-sm px-2"><i class="fas fa-list-alt text-primary fa-lg mr-2"></i></button>
							</td>						
						</tr>
					</c:forEach>
                </tbody>
              </table>		
		</c:if>
		
		<c:if  test="${empty pedidos}">
		<br>
		<br>
		<br>
		<div class="row alert alert-warning">
			<div class="col-md-4">&nbsp;</div>
			<div class="col-md-4"><i class="fas fa-info-circle fa-2x align-bottom"></i> No se encontraron pedidos que mostrar</div>
			<div class="col-md-4">&nbsp;</div>
		</div>
		</c:if> 
	

<br>
<br>
<br>
	
	