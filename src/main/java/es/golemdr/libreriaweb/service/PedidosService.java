package es.golemdr.libreriaweb.service;

import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Pedido;

@Service
public class PedidosService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(PedidosService.class);
	
	public List<Pedido> getPedidos(){
		
		ResponseEntity<Pedido[]> response = restTemplate.getForEntity(SERVER + ":" + PORT + "/pedidos", Pedido[].class);
		
		Pedido[] pedidos = response.getBody();
		
		return Arrays.asList(pedidos);

	}
	
	
	public List<Pedido> getPedidosCliente(Pedido pedido){
		
		ResponseEntity<Pedido[]> response = restTemplate.postForEntity(SERVER + ":" + PORT + "/pedidos/buscar", pedido, Pedido[].class);
		
		Pedido[] pedidos = response.getBody();
		
		return Arrays.asList(pedidos);

	}

}
