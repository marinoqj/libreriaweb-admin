package es.golemdr.libreriaweb.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import es.golemdr.libreriaweb.domain.Cliente;
import es.golemdr.libreriaweb.service.ClientesService;
import es.golemdr.libreriaweb.controller.constantes.ForwardConstants;
import es.golemdr.libreriaweb.controller.constantes.UrlConstants;

@Controller
public class ClientesController {

	
	private static final Logger log = LogManager.getLogger(ClientesController.class);
	
	@Resource
	private ClientesService clientesService;
	
	@GetMapping(UrlConstants.URL_LISTADO_CLIENTES)
	public String listadoClientes(Map<String, Object> map, HttpServletRequest request) {

		List<Cliente> resultado = null;
		resultado = clientesService.getClientes();

		map.put("clientes", resultado);

		return ForwardConstants.FWD_LISTADO_CLIENTES;

	}
}
