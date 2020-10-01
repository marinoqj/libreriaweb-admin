package es.golemdr.libreriaweb.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;
import org.springframework.web.util.UrlPathHelper;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import es.golemdr.libreriaweb.ext.exceptions.resolver.CustomExceptionResolver;


import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_NULL;
import static com.fasterxml.jackson.databind.MapperFeature.SORT_PROPERTIES_ALPHABETICALLY;



// DispatcherServlet context: defines Spring MVC infrastructure
// and web application components

@Configuration
@ComponentScan(basePackages = "es.golemdr.libreriaweb")
@EnableWebMvc
@EnableScheduling
@PropertySource("classpath:application.properties")
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private Environment env;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("/static/");
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("Login");

	}



	@Override
	public void configurePathMatch(PathMatchConfigurer configurer) {
		UrlPathHelper pathHelper = new UrlPathHelper();
		pathHelper.setRemoveSemicolonContent(false); // For @MatrixVariable's
		configurer.setUrlPathHelper(pathHelper);
	}

	@Bean
	public MultipartResolver multipartResolver() {
		return new CommonsMultipartResolver();
	}
	
	//----------------------------- Añado todo lo que sigue
	
    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(
          new String[] { "classpath:tiles.xml" });
        tilesConfigurer.setCheckRefresh(true);
        
        return tilesConfigurer;
    }
    
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		
        TilesViewResolver viewResolver = new TilesViewResolver();
        registry.viewResolver(viewResolver);
        
	}
	
    @Bean  
    public MessageSource messageSource() {  
    	ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
    	messageSource.setBasename("classpath:es/golemdr/libreriaweb/messages/ApplicationResources");
        messageSource.setUseCodeAsDefaultMessage(false);
        // messageSource.setDefaultEncoding("UTF-8");  -- Por defecto es ISO-8859-1
        messageSource.setCacheSeconds(-1);
        return messageSource;  
    }
    
   
    @Bean
    public SimpleMappingExceptionResolver simpleMappingExceptionResolver() {
      
      SimpleMappingExceptionResolver exceptionResolver = new CustomExceptionResolver();

      Properties mappings = new Properties();
      mappings.setProperty("Exception", "ErrorGenerico");

      exceptionResolver.setExceptionMappings(mappings);  // None by default

      return exceptionResolver;
    }
    
    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, true);

        return mapper;
    }
    
//	// Para JSON
//	  @Bean
//	  @Primary
//	  ObjectMapper objectMapper() {
//	    final ObjectMapper mapper = new ObjectMapper();
//	    mapper.findAndRegisterModules();
//	    mapper.setSerializationInclusion(NON_NULL);
//	    mapper.enable(SORT_PROPERTIES_ALPHABETICALLY);
//	    return mapper;
//	  }	
    


}
