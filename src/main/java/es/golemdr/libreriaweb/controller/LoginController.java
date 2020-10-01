package es.golemdr.libreriaweb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

 
@Controller
public class LoginController {
	
	private static final Logger log = LogManager.getLogger(LoginController.class);

	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String verlogin(Model model,HttpServletRequest request) {
		
		return "Login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginDo(Model model,HttpServletRequest request) {
		
		return "Home";
	}
	
	@RequestMapping(value="/login-failure.do")
 	public String loginFailure(Model model) {
		
		String mensaje = "Usuario o password incorrectos";
		
		model.addAttribute("mensaje", mensaje);
		
		return "Login";
	}
	
    @RequestMapping(value = "/accessok.do", method = RequestMethod.GET)
    public String loginPage() {
        return "Home";
    }
  
    @RequestMapping(value="/logout.do", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:login.do";
    }
}
