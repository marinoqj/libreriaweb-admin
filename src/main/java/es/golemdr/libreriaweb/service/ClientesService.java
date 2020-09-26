package es.golemdr.libreriaweb.service;

import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Cliente;

@Service
public class ClientesService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(ClientesService.class);
	
	public List<Cliente> getClientes(){
		
		ResponseEntity<Cliente[]> response = restTemplate.getForEntity(SERVER + ":" + PORT + "/clientes", Cliente[].class);
		
		Cliente[] clientes = response.getBody();
		
		return Arrays.asList(clientes);

	}

}
