package es.golemdr.libreriaweb.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import es.golemdr.libreriaweb.service.security.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
		// Este es otro comentario
	
	   @Autowired
	   PasswordEncoder passwordEncoder;
	   
//		@Bean
//		@Override
//		public UserDetailsService userDetailsService() {
//			UserDetails user =
//				 User.withUsername("usuario")					
//					.password(new BCryptPasswordEncoder().encode("aaa"))
//					.roles("USER")
//					.build();
//
//			return new InMemoryUserDetailsManager(user);
//		}
	   
	 
		@Bean
		@Override
		public UserDetailsService userDetailsService() {
			return new CustomUserDetailsService();
		}
	   
	    @Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    	
	    	auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder);
	    	
//	        auth.inMemoryAuthentication()
//	        .passwordEncoder(passwordEncoder)
//	        .withUser("user").password(passwordEncoder.encode("123456")).roles("USER")
//	        .and()
//	        .withUser("admin").password(passwordEncoder.encode("123456")).roles("USER", "ADMIN");
	    }
	   
	 
	    @Bean
	    public PasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	 
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.authorizeRequests()
	        .antMatchers("/login**", "/static/**")
	            .permitAll()
	        .antMatchers("/**")
	            .hasAnyRole("ADMIN", "USER")
	        .and()
	            .formLogin()
	            .loginPage("/login.do")
	            .defaultSuccessUrl("/accessok.do")
	            .failureUrl("/login-failure.do")
	            .permitAll()
	        .and()
	            .logout()
	            .logoutSuccessUrl("/logout.do")
	            .invalidateHttpSession(true)
	            .permitAll()
	        .and()
	            .csrf()
	            .disable();
	    }
	    
	    
}