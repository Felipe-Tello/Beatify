package com.team.beatify.controllers;

import javax.servlet.http.HttpSession;

import com.team.beatify.models.User;
import com.team.beatify.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    
    //Está la ruta login y logout
    @GetMapping("/login")
	public String loginForm(@ModelAttribute("user") User user) {
		return "login.jsp";
	}
    
    @PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, Model model) {
		Boolean authenticated = userService.authenticateUser(email, password);
		if (authenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/dashboard";
		}else {
			//redirectAttributes.addFlashAttribute("error", "Usuario y/o Contraseña incorrectos. Por favor intente de nuevo");
            //modificar al español pofavor
			model.addAttribute("error", "Usuario y/o Contraseña incorrectos. Por favor intente de nuevo");
            return "login.jsp";
		}
	}

    //logout
    @GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
