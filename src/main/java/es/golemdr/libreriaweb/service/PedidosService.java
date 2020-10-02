package es.golemdr.libreriaweb.service;

import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Cliente;
import es.golemdr.libreriaweb.domain.Pedido;
import es.golemdr.libreriaweb.ext.Constantes;
import es.golemdr.libreriaweb.ext.utils.paginacion.PaginacionBean;

@Service
public class PedidosService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(PedidosService.class);
	
	public List<Pedido> getPedidosPaginados(PaginacionBean paginacion){
		
		HttpEntity<String> entity =  buildHeaders(paginacion);

		ResponseEntity<Pedido[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/pedidos/paginado", HttpMethod.GET,entity, Pedido[].class);		
		
		Pedido[] pedidos = response.getBody();
		
		String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
		paginacion.setTotalRegistros(Integer.valueOf(total));
		
		return Arrays.asList(pedidos);

	}
	
	
	public List<Pedido> getPedidosCliente(Pedido pedido){
		
		ResponseEntity<Pedido[]> response = restTemplate.postForEntity(SERVER + ":" + PORT + "/pedidos/buscar", pedido, Pedido[].class);
		
		Pedido[] pedidos = response.getBody();
		
		return Arrays.asList(pedidos);

	}

}
