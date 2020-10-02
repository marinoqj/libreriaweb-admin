package es.golemdr.libreriaweb.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import es.golemdr.libreriaweb.service.PedidosService;
import es.golemdr.libreriaweb.controller.constantes.ForwardConstants;
import es.golemdr.libreriaweb.controller.constantes.UrlConstants;
import es.golemdr.libreriaweb.domain.Cliente;
import es.golemdr.libreriaweb.domain.Pedido;
import es.golemdr.libreriaweb.ext.utils.paginacion.PaginacionBean;

@Controller
public class PedidosController {

	
	private static final Logger log = LogManager.getLogger(PedidosController.class);
	
	@Resource
	private PedidosService pedidosService;
	
	@GetMapping(UrlConstants.URL_LISTADO_PEDIDOS)
	public String listadoPedidos(@PathVariable("inicio") int inicio, Map<String, Object> map, HttpServletRequest request) {

		List<Pedido> resultado = null;
		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);
		
		resultado = pedidosService.getPedidosPaginados(paginacion);

		map.put("pedidos", resultado);
		map.put("paginacion", paginacion);

		return ForwardConstants.FWD_LISTADO_PEDIDOS;

	}
	
	@PostMapping(UrlConstants.URL_LISTADO_PEDIDOS_CLIENTE)
	public String listadoPedidosClilente(String idCliente, Map<String, Object> map, HttpServletRequest request) {

		List<Pedido> resultado = null;
		
		Pedido pedido = new Pedido();
		Cliente cliente = new Cliente();
		cliente.setIdCliente(new Long(idCliente));
		pedido.setCliente(cliente);
		
		resultado = pedidosService.getPedidosCliente(pedido);

		map.put("pedidos", resultado);

		return ForwardConstants.FWD_LISTADO_PEDIDOS;

	}
	
	
	@PostMapping(UrlConstants.URL_VER_DETALLE_PEDIDO)
	public String detallePedido(String idPedido, Map<String, Object> map, HttpServletRequest request) {

		List<Pedido> resultado = null;
		
		Pedido pedido = new Pedido();
		pedido.setIdPedido(new Long(idPedido));
		
		resultado = pedidosService.getPedidosCliente(pedido);

		map.put("pedido", resultado.get(0));

		return ForwardConstants.FWD_LISTADO_DETALLES_PEDIDO;

	}	
}
