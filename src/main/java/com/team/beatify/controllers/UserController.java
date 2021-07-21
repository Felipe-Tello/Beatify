package com.team.beatify.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.team.beatify.models.User;
import com.team.beatify.services.UserService;
import com.team.beatify.validations.UserValidator;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    private final UserService userService;
    private final UserValidator userValidator;

    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }

    //----------------------------------------------------------------------------------------//

    @GetMapping("/")
	public String registerForm(@ModelAttribute("user") User user) {
		return "register.jsp";
	}

    @PostMapping("/")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "register.jsp";
        }
        if (userService.emailExist(user.getEmail())) {
            FieldError error = new FieldError("email", "email", "El email ingresado ya se encuentra registrado");
            result.addError(error);
            return "register.jsp";
        }
        else {
            User u = userService.registerUser(user);
            session.setAttribute("userId", u.getId());
            return "redirect:/dashboard";
        }
	}

    //----------------------------------------------------------------------------------------//

    @GetMapping("/login")
	public String loginForm(@ModelAttribute("user") User user) {
		return "login.jsp";
	}
    
    @PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
		Boolean authenticated = userService.authenticateUser(email, password);
		if (authenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/events";
		}else {
			//redirectAttributes.addFlashAttribute("error", "Usuario y/o Contraseña incorrectos. Por favor intente de nuevo");
			session.setAttribute("error", "Invalid Credentials. Please thy again.");
			return "redirect:/login";
		}
	}

    //----------------------------------------------------------------------------------------//

    @GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}