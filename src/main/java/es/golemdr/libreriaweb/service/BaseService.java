package es.golemdr.libreriaweb.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import es.golemdr.libreriaweb.ext.Constantes;
import es.golemdr.libreriaweb.ext.utils.paginacion.PaginacionBean;

public class BaseService {
	
	@Value("${api.server.name}")
	String SERVER;
	
	@Value("${api.server.port}")
	String PORT;	
	
	final RestTemplate restTemplate;
	
    public BaseService (){
        restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
    }
    
    
    HttpEntity<String> buildHeaders(PaginacionBean paginacion){
    	
    	
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set(Constantes.PAGINACION_INICIO, String.valueOf(paginacion.getInicio()));
		headers.set(Constantes.PAGINACION_ELEMENTOS_PAGINA, String.valueOf(paginacion.getElementosXpagina()));
		
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
    	
    	return entity;
    }

}
