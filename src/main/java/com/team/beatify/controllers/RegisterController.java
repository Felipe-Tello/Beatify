package com.team.beatify.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.team.beatify.models.User;
import com.team.beatify.services.UserService;
import com.team.beatify.validations.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;
    
    @GetMapping("/register")
	public String registerForm(@ModelAttribute("user") User user) {
		return "register.jsp";
	}

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "register.jsp";
        }
        if (userService.emailExist(user.getEmail())) {
            FieldError error = new FieldError("email", "email", "El email " + user.getEmail() + " ya se encuentra registrado");
            result.addError(error);
            return "register.jsp";
        }
        else {
            User u = userService.registerUser(user);
            session.setAttribute("userId", u.getId());
            return "redirect:/dashboard";
        }
	}

}
