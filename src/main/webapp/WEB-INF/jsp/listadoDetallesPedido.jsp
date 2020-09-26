<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>



<br>
<br>
<br>


<c:if  test="${!empty pedido.cliente}">

		<br>
	
		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><i
							class="fas fa-list-alt fa-lg mr-1"></i><i
							class="fas fa-users fa-lg mr-2"></i>Detalle del pedido</li>
					</ol>
				</nav>
			</div>
		</div>
		
		<br>
		
		<div class="row">
			<div class="col-md-1"><b>Cliente:</b></div>
			<div class="col-md-11">${pedido.cliente.nombre} ${pedido.cliente.apellidos}</div>
		</div>	
		
		<div class="row">
			<div class="col-md-1"><b>Dirección:</b></div>
			<div class="col-md-11">${pedido.cliente.direccion}</div>
		</div>				

		<div class="row">
			<div class="col-md-1"><b>Teléfono:</b></div>
			<div class="col-md-8">${pedido.cliente.telefono}</div>
			<div class="col-md-1"><b>Fecha:</b></div>
			<div class="col-md-2"><fmt:formatDate value="${pedido.fecha}" pattern="dd-MM-yyyy"/></div>
		</div>	


</c:if>

			<c:if  test="${!empty pedido.detalles}">           
		
		<br>
		

		
		<div id="msgListaVacia"></div>

        	  <!-- DataTables Example -->
              <table class="table table-sm table-hover" id="itemList">
				<thead class="blue lighten-4">
					<tr class="bg-light">	
					<th>Nombre</th>															
					<th>Precio</th>																							
					<th>Cantidad</th>
					<th>Total</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr class="bg-light">
					<th>&nbsp;</th>																					
					<th>&nbsp;</th>																						
					<th>Total</th>
					<th><label id="totalLista">${pedido.total}</label></th>
                  </tr>
                </tfoot>
                <tbody>
					<c:forEach items="${pedido.detalles}" var="detalle">
						<tr id="itemRow_${detalle.producto.idProducto}">
						
							<td>${detalle.producto.nombre}</td>						
						
							<td>${detalle.precio}</td>		
							
							<td>${detalle.cantidad}</td>	
							
							<td><label><fmt:formatNumber pattern="###,###.00" value="${detalle.precio * detalle.cantidad}"/></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>						
																
						</tr>
					</c:forEach>
                </tbody>
              </table>		
	
			<br>
			<br>
			<br>
			
			
		</c:if>
	
	
	