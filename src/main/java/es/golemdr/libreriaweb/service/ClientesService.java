package es.golemdr.libreriaweb.service;

import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Cliente;
import es.golemdr.libreriaweb.ext.Constantes;
import es.golemdr.libreriaweb.ext.utils.paginacion.PaginacionBean;

@Service
public class ClientesService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(ClientesService.class);
	

	public List<Cliente> findClientes(Cliente cliente){
		
		ResponseEntity<Cliente[]> response = restTemplate.postForEntity(SERVER + ":" + PORT + "/clientes/buscar", cliente, Cliente[].class);
		
		Cliente[] clientes = response.getBody();
		
		return Arrays.asList(clientes);

	}
	
	public List<Cliente> getClientesPaginados(PaginacionBean paginacion){
		
		HttpEntity<String> entity =  buildHeaders(paginacion);

		ResponseEntity<Cliente[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/clientes/paginado", HttpMethod.GET,entity, Cliente[].class);		
		
		Cliente[] clientes = response.getBody();
		
		String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
		paginacion.setTotalRegistros(Integer.valueOf(total));
		
		return Arrays.asList(clientes);

	}
	
	
	// TODO -- Implementar búsquedas paginadas
	public List<Cliente> findClientesPaginados(Cliente cliente, int inicio){
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Paginacion-Inicio", String.valueOf(inicio));

		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

		ResponseEntity<Cliente[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/clientes/buscarPaginado", HttpMethod.POST,entity, Cliente[].class, cliente);
		
		Cliente[] clientes = response.getBody();
		
		return Arrays.asList(clientes);

	}
	
}
