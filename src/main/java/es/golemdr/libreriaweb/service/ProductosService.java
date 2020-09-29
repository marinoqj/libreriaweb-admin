package es.golemdr.libreriaweb.service;

import java.net.URI;
import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Producto;




@Service
public class ProductosService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(ClientesService.class);
	
	public List<Producto> getProductos(){
		
		ResponseEntity<Producto[]> response = restTemplate.getForEntity(SERVER + ":" + PORT + "/productos", Producto[].class);
		
		Producto[] productos = response.getBody();
		
		return Arrays.asList(productos);

	}
		
	
	public URI insertarProducto(Producto producto) {
		
		return restTemplate.postForLocation(SERVER + ":" + PORT + "/productos", producto);
		
	}

	
	public void actualizarProducto(Producto producto) {
		
		restTemplate.put(SERVER + ":" + PORT + "/productos", producto);
		
	}
	
	public Producto getById(Long idProducto) {
	
		return restTemplate.getForObject(SERVER + ":" + PORT + "/productos/" + idProducto.toString(), Producto.class);
		 
	}

	
	public void borrarProducto(Long idProducto) {
	
		restTemplate.delete(SERVER + ":" + PORT + "/productos/" + idProducto.toString());
		
	}	

}
