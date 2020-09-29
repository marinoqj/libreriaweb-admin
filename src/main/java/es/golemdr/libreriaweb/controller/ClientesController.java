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

import es.golemdr.libreriaweb.domain.Cliente;
import es.golemdr.libreriaweb.ext.utils.paginacion.PaginacionBean;
import es.golemdr.libreriaweb.service.ClientesService;
import es.golemdr.libreriaweb.controller.constantes.ForwardConstants;
import es.golemdr.libreriaweb.controller.constantes.UrlConstants;

@Controller
public class ClientesController {

	
	private static final Logger log = LogManager.getLogger(ClientesController.class);
	
	@Resource
	private ClientesService clientesService;
	
	@GetMapping(UrlConstants.URL_LISTADO_CLIENTES)
	public String listadoClientes(@PathVariable("inicio") int inicio, Map<String, Object> map, HttpServletRequest request) {

		List<Cliente> resultado = null;
		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);
		
		resultado = clientesService.getClientesPaginados(paginacion);

		map.put("clientes", resultado);
		map.put("cliente", new Cliente());
		map.put("paginacion", paginacion);

		return ForwardConstants.FWD_LISTADO_CLIENTES;

	}
	
	
	@PostMapping(UrlConstants.URL_BUSCAR_CLIENTES)
	public String buscarClientes(Cliente cliente, Map<String, Object> map) {

		List<Cliente> resultado = null;
		resultado = clientesService.findClientes(cliente);

		map.put("clientes", resultado);
		map.put("cliente", new Cliente());

		return ForwardConstants.FWD_LISTADO_CLIENTES;

	}
	
}
