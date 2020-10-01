package es.golemdr.libreriaweb.service.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	
	
	@Override
	public UserDetails loadUserByUsername(String login)
			throws UsernameNotFoundException {
		
		UserDetails securityUser = null;
		
		Map<String,UserDetails> usuarios = new HashMap<String, UserDetails>();
		
		UserDetails usuario =  User.withUsername("usuario").password(new BCryptPasswordEncoder().encode("abc")).roles("USER").build();
		UserDetails admin =  User.withUsername("admin").password(new BCryptPasswordEncoder().encode("123")).roles("ADMIN").build();
		
		usuarios.put("usuario", usuario);
		usuarios.put("admin", admin);
		
		if(usuarios.containsKey(login)) {
			
			securityUser = usuarios.get(login);
		}
		
		
		return securityUser;
		
		
	}


}

